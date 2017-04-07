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
        LRU_table[i] = 0;
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

// Find the LRU frame based on the LRU_Table
int PhysicalMemory::FindLRUFrame() {
    uint32_t minval = 0xFFFFFFFF;
    int lru = 0;
    for(int i = 0; i < n_frames; i++) {
        if (LRU_table[i] < minval) {
            minval = LRU_table[i];
            lru = i;
        }
    }
    return lru;
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
    #ifdef ENABLE_LRU
        LRU_table[frame] += 1;
    #endif  
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
}

void PhysicalMemory::PageOut(int frame) {
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
    }
}

// Lookup a page number and return the corresponding frame
int PageTable::LookupPage(int pagenum) {
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
}

bool PageTable::PageIsValid(int pagenum) {
    if(valid[pagenum] == 1) {
        return true;
    } else return false;
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

    if (page_table.PageIsValid(mempair.P)) {
        // If the page is valid:
        //      1. Lookup the frame in the page table
        //      2. Access the memory at (frame, d)
        int frame = page_table.LookupPage(mempair.P);
        return physical_memory.GetMemoryContents(frame, mempair.d);
    } else {
        if(physical_memory.isFull()) {
            // If the page is invalid and the memory is full:
            //      1. Load the page from the memory file
            //      2. Find the LRU Frame
            
            //TODO: Implement full memory paging
        }
        else {
            // If the page is invalid and the memory isn't full:
            //      1. Load the page from the memory file
            //      2. Find the first avaialable frame
            //      3. PageIn() the data
            //      4. Update the page table for this page with the frame found in (2)
            
            //TODO: Implement nonfull memory paging      

        }
    }

    return 0xAA;
}

int MemoryManager::TranslateAddress(int addr) {
    return 0;
}

void MemoryManager::FileSeek(int fpage, char* dest) {
    //TODO: Implement file seeking
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