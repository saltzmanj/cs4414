#ifndef __MEMORY_H_
#define __MEMORY_H_

#include <stdint.h>
#include <cstdio>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <fstream>

#define ENABLE_LRU
#define FRAME_SIZE 256
#define PAGE_SIZE 256
#define N_FRAMES 8

#define PAGE_TABLE_ENTRIES 16

#define BACKEND_FN "BACKING_STORE.bin"
#define BACKEND_FN_CHARS 18

#define VIRTUAL_ADDRESS_MAX 4095

using namespace std;

/**
    @class PhysicalMemory
    @brief Imitates a physical memory.
*/
class PhysicalMemory {

public:
    /**
        @brief Constructor. Initializes memory to zero.
    */
    PhysicalMemory();
    
    /**
        @brief Finds the first available frame in the memory.
        @retval Integer position of the first available frame.
    */
    int FindFirstFrame();
    
    /**
        @brief Gets the byte at position (f, d)

        @param Frame #
        @param Offset in bytes
        @retval Byte at (f, d)
    */
    char GetMemoryContents(int frame, int offset);

    /**
        @brief Returns true/false if the memory is full/empty
        @retval True if memory is full, False otherwise
    */
    bool isFull();

    /**
        @brief Pages a page into frame f.

        @param Frame # to page into
        @param Contents of the frame
    */
    void PageIn(int frame, char pagein[FRAME_SIZE]);

    /**
        @brief Page out a frame

        @param Frame to page out
    */
    void PageOut(int frame);

private:
    static const int n_frames = N_FRAMES;
    static const int frame_size = FRAME_SIZE;

    char memory[n_frames][frame_size];

    /**
        @brief Array of chars that determine whether frame i is occupied.
    */
    char occupied[n_frames];

};  

/**
    @class PageTable
    @brief Page table holding page/frame pairs.
*/
class PageTable {

public:

    /**
        @brief Constructor for PageTable object
    */
    PageTable();

    /**
        @brief Lookup a page number and return the corresponding frame
        @param page
        @retval frame
    */
    int LookupPage(int pagenum);

    /**
        @brief Lookup a page number, but don't update LRU calculations
        @param Page to Lookup
        @retval Frame at 
    */
    int LookupPage_no_LRU(int pagenum);
    /**
        @brief Set a page table entry to a given frame
    */
    void SetPageToFrame(int pagenum, int framenum);

    /**
        @brief Determines if a page is loaded into physical memory.
        @param Page number to check
        @retval True if in memory (hit), False if not (miss)
    */
    bool PageIsValid(int pagenum);

    /**
        @brief Print out the page table
    */
    void PrintPageTable();

    /** 
        @brief Get the LRU page
        @retval The integer value of the LRU page
    */

    int GetLRUPage();

    /**
        @brief Update the LRU list.
        @param The latest used element
    */
    void UpdateLRUList(int last_used);
    
    /**
        @brief Page out the table.
        @param The page to pageout.


    */
    void PageOut_table(int pagenum);

private:
    static const int pgtable_entries = PAGE_TABLE_ENTRIES;
    /**
        @brief Array functioning as the page table
    */
    int pgtable[PAGE_TABLE_ENTRIES];
    int valid[PAGE_TABLE_ENTRIES];
    std::vector<int> LRU_list;
};


typedef struct {
    int P;
    int d;
} MemoryPairAddress_t;
/**
    @brief Convert a base-10 address to (P, d) format
    @param base-10 address to translate
    @retval (P, d) pair corresponding to the address
*/
MemoryPairAddress_t ConvertAddressFormat(int addr);
void PrintMemoryPairAddress(MemoryPairAddress_t mempair);
/**
    @class MemoryManager
    @brief A memory management unit
*/

class MemoryManager {
public:
    /**
        @brief Constructor
    */
    MemoryManager();
    
    /**
        @brief Read a value from memory

        @param Virtual address to read from.
        @retval value from mem[addr]
    */
    char ReadMemory(int addr);

    /**
        @brief Translate a virual address (P, d) to a physical address (f, d). Doesn't implement any p

        @param Virtual address to translate.

    */
    int TranslateAddress(int addr);

    /**
        @brief Print the page table.
    */
    void PrintPageTable();
private:
    char* backend_store_filename;

    PageTable page_table;
    PhysicalMemory physical_memory;

    /**
        @brief Seek a page from the file and copy it to dest

        @param Page # in file to read from
        @param char[256] to copy the page to

    */
    void FileSeek(int fpage, char* dest);



};

#endif
