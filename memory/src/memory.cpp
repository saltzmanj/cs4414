#include "memory.h"

/*=======================================
=            Physical Memory            =
=======================================*/

PhysicalMemory::PhysicalMemory() {
    for(int i = 0; i < n_frames; i++) {
        for(int j = 0; j < frame_size; j++) {
            memory[i][j] = 0x00;
        }
        occupied[i] = 0x00;
    }
}

// Determine if the memory is full
bool PhysicalMemory::isFull() {
    
    for(int i = 0; i < n_frames; i++) {
        if(occupied[i] == 0) return false;
    }
    return true;

}

// Find the first available frame
int PhysicalMemory::FindFirstFrame() {
    for(int i = 0; i < n_frames; i++) {
        if(occupied[i] == 0) {
            return i;
        }
    }
    return -1;
}

// Return the contents of memory at a give frame and offset
char PhysicalMemory::GetMemoryContents(int frame, int offset) {
    if(frame >= n_frames) {
        fprintf(stderr, "%s %d\n", "MEM_ERROR: invalid frame #: ",frame);
        exit(EXIT_FAILURE);
    }
    if(offset >= frame_size) {
        fprintf(stderr, "%s %d\n", "MEM_ERROR: invalid offset #: ",offset);
        exit(EXIT_FAILURE);
    }

    return memory[frame][offset];
}

void PhysicalMemory::PageIn(int frame, char pagein[FRAME_SIZE]) {
    if(frame >= N_FRAMES) {
        fprintf(stderr, "%s %d\n", "MEM_ERROR: invalid frame #: ", frame);
        exit(EXIT_FAILURE);
    }
    for(int i = 0; i < FRAME_SIZE; i++) {
        memory[frame][i] = pagein[i];
    }
    occupied[frame] = 1;
}

void PhysicalMemory::PageOut(int frame) {
    if(frame < 0 || frame >= N_FRAMES) {
        fprintf(stderr, "MEM_ERROR: invalid frame # %d\n",frame);
        exit(EXIT_FAILURE);
    }
    for(int i = 0; i < FRAME_SIZE; i++) {
        memory[frame][i] = 0x00;
    }
    occupied[frame] = 0;
}
/*=====  End of Physical Memory  ======*/

/*==================================
=            Page Table            =
==================================*/

// Page Table Constructor
PageTable::PageTable() {
    for(int i = 0; i < pgtable_entries; i++) {
        pgtable[i] = -1;
        valid[i] = 0;
    }
}

// Lookup a page number and return the corresponding frame
int PageTable::LookupPage(int pagenum) {
    if(pagenum >= pgtable_entries) {
        fprintf(stderr, "%s %d\n", "PT_ERROR: invalid page #: ", pagenum );
        exit(EXIT_FAILURE);
    }
    UpdateLRUList(pagenum);
    return pgtable[pagenum];
}
int PageTable::LookupPage_no_LRU(int pagenum){
    if(pagenum >= pgtable_entries) {
        fprintf(stderr, "%s %d\n", "PT_ERROR: invalid page #: ", pagenum );
        exit(EXIT_FAILURE);
    }
    return pgtable[pagenum];
}
// Set a value of the page table
void PageTable::SetPageToFrame(int pagenum, int framenum) {
    if(pagenum >= pgtable_entries || framenum >= FRAME_SIZE) {
        fprintf(stderr, "PT_ERROR: Invalid Page/Frame Combination: Page: %d , Frame: %d\n", pagenum, framenum);
        exit(EXIT_FAILURE);
    }
    pgtable[pagenum] = framenum;
    valid[pagenum] = 1;
}

void PageTable::PageOut_table(int pagenum) {
    if(pagenum >= pgtable_entries) {
        fprintf(stderr, "PT_ERROR: Invalid Page #: %d", pagenum);
        exit(EXIT_FAILURE);
    }
    pgtable[pagenum] = -1;
    valid[pagenum] = 0;

    int lrusize = LRU_list.size();
    for(int i = 0; i < lrusize; i++) {
        if (LRU_list[i] == pagenum) {
            LRU_list.erase(LRU_list.begin() + i);
            break;
        }
    } 
}

bool PageTable::PageIsValid(int pagenum) {
    if(valid[pagenum] == 1) {
        return true;
    } else return false;
}

void PageTable::PrintPageTable() {
    printf("\tPAGE TABLE\n");
    printf("\t%s  %s  %s\n","[Page #]", "[Frame #]", "[Valid?]");
    printf("\t%s","------------------------------\n");
    for(int i = 0; i < PAGE_TABLE_ENTRIES; i++) {
        if (pgtable[i] != -1)
             printf("\t%d\t     %d\t        %d\n", i, pgtable[i], valid[i]);
        else
            printf("\t%d\t     %s\t        %d\n", i, "-", valid[i]);
    }
    printf("\tLRU List (old->new): ");
    for(uint32_t i = 0; i < LRU_list.size(); i++) {
        printf("{%d}", LRU_list[i]);
    }
    printf("\n");
}

void PageTable::UpdateLRUList(int last_used) {
    int size = LRU_list.size();
    for(int i = 0; i < size; i++) {
        if(LRU_list.at(i) == last_used){
            LRU_list.erase(LRU_list.begin() + i);
            break;
        }
    }
    LRU_list.push_back(last_used);
}

int PageTable::GetLRUPage() {
    return LRU_list[0];

}
/*=====  End of Page Table  ======*/



/*=====================================
=            MemoryManager            =
=====================================*/

MemoryManager::MemoryManager() {
    backend_store_filename = (char*) malloc(sizeof(char) * BACKEND_FN_CHARS);
    strcpy(backend_store_filename, BACKEND_FN);
}

char MemoryManager::ReadMemory(int addr) {
    if (addr > VIRTUAL_ADDRESS_MAX || addr < 0) {
        fprintf(stderr, "SEGFAULT at address %d\n", addr);
        exit(EXIT_FAILURE);
    }

    MemoryPairAddress_t mempair_virtual = ConvertAddressFormat(addr);

    if (page_table.PageIsValid(mempair_virtual.P)) {
        // If the page is valid:
        //      1. Lookup the frame in the page table
        //      2. Access the memory at (frame, d)
        int frame = page_table.LookupPage(mempair_virtual.P);
        char contents = physical_memory.GetMemoryContents(frame, mempair_virtual.d);
        printf("Virtual address {%d} is contained in page {%d}, frame {%d}\n", addr, mempair_virtual.P, frame);
        return contents;
    } else {
        printf("Virtual address {%d} contained in page {%d} causes a page fault\n",addr, mempair_virtual.P);
        if(physical_memory.isFull()) {
            printf(" ---> Physical Memory Full! Taking corrective action...\n");
            // If the page is invalid and the memory is full:
            //      1. Load the page from the memory file
            //      2. Find the LRU Page and extract its frame
            //      3. PageOut() the page
            //      4. PageIn() the desired page in the right frame
            //      5. Update the page table and LRU list
            
            // (1) Load page from memory
            
            char* page_to_load = new char[PAGE_SIZE];
            FileSeek(mempair_virtual.P, page_to_load);

            // (2) find the LRU page
            int lru_page = page_table.GetLRUPage();
            int target_frame = page_table.LookupPage_no_LRU(lru_page);

            // (3) Pageout() the corresponding frame
            physical_memory.PageOut(target_frame);
            page_table.PageOut_table(lru_page);
            printf(" ---> Paging out LRU page {%d}\n", lru_page);

            // (4) PageIn() the desired frame
            physical_memory.PageIn(target_frame, page_to_load);
            // (5) update the page table
            page_table.SetPageToFrame(mempair_virtual.P, target_frame);
            printf(" ---> Paging in page {%d} to frame {%d}\n", mempair_virtual.P, target_frame);
            page_table.UpdateLRUList(mempair_virtual.P);
            
            delete[] page_to_load;
        } else {
            // If the page is invalid and the memory isn't full:
            //      1. Load the page from the memory file
            //      2. Find the first avaialable frame
            //      3. PageIn() the data
            //      4. Update the page table for this page with the frame found in (2)
            
            // (1): Load page from memory
            char* page_to_load = new char[PAGE_SIZE];
            FileSeek(mempair_virtual.P, page_to_load);

            // (2): Find the first available frame
            int available_frame = physical_memory.FindFirstFrame();

            // (3): PageIn the data
            physical_memory.PageIn(available_frame, page_to_load);
            printf(" ---> Page {%d} paged into frame {%d}\n",mempair_virtual.P, available_frame);

            // (4): Update the page table
            page_table.SetPageToFrame(mempair_virtual.P, available_frame);
            page_table.UpdateLRUList(mempair_virtual.P);
            delete[] page_to_load;
            return physical_memory.GetMemoryContents(available_frame, mempair_virtual.d);

        }
    }

    return 0xAA;
}

int MemoryManager::TranslateAddress(int addr) {
    return 0;
}

void MemoryManager::FileSeek(int fpage, char* dest) {
    ifstream infs;
    // uint32_t buffer[PAGE_SIZE];

    infs.open(BACKEND_FN, ios::binary);
    if(infs.is_open()) {
        infs.seekg(fpage*PAGE_SIZE*4); // 4 bytes/uint32_t
        // infs.read((char*) buffer, PAGE_SIZE*4);
        for(int i = 0; i < PAGE_SIZE; i++) {
            infs.read(dest+i, 1);
        }
        infs.close();
    } else {
        fprintf(stderr, "%s %s\n", "Couldn't open ", BACKEND_FN);
    }
}

void MemoryManager::PrintPageTable() {
    page_table.PrintPageTable();
}
/*=====  End of MemoryManager  ======*/

MemoryPairAddress_t ConvertAddressFormat(int addr) {
    MemoryPairAddress_t mempair;
    uint16_t addr_16 = (uint16_t) addr;
    mempair.d = addr_16 & 0x00FF;
    mempair.P = (addr_16 & 0x0F00) >> 8; 
    return mempair;
}

void PrintMemoryPairAddress(MemoryPairAddress_t mempair) {
    printf("(%d,%d)\n", mempair.P, mempair.d);
}