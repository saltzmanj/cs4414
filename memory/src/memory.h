#ifndef __MEMORY_H_
#define __MEMORY_H_

#include <iostream>
#include <stdint.h>
#include <cstdio>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <queue>
#include <fstream>
using namespace std;

#define ENABLE_LRU
#define FRAME_SIZE 256
#define PAGE_SIZE 256
#define N_FRAMES 8

#define PAGE_TABLE_ENTRIES 16

#define BACKEND_FN "BACKING_STORE.bin"
#define BACKEND_FN_CHARS 18

#define VIRTUAL_ADDRESS_MAX 4095

#define TLB_ENTRIES 4


// Forward Declarations

class PhysicalMemory;
class PageTable;
class TranslationLookasideBuffer;
class MemoryManager;


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
        @retval int Integer position of the first available frame.
    */
    int FindFirstFrame();
    
    /**
        @brief Gets the byte at position (f, d)

        @param int Frame #
        @param int Offset in bytes
        @retval char Byte at (f, d)
    */
    char GetMemoryContents(int frame, int offset);

    /**
        @brief Returns true/false if the memory is full/empty
        @retval bool True if memory is full, False otherwise
    */
    bool isFull();

    /**
        @brief Pages a page into frame f.

        @param int Frame # to page into
        @param char[FRAME_SIZE] Contents of the frame
    */
    void PageIn(int frame, char pagein[FRAME_SIZE]);

    /**
        @brief Page out a frame

        @param int Frame to page out
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
        @param int page
        @retval int frame
    */
    int LookupPage(int pagenum);

    /**
        @brief Lookup a page number, but don't update LRU calculations
        @param int Page to Lookup
        @retval int Frame at 
    */
    int LookupPage_no_LRU(int pagenum);
    /**
        @brief Set a page table entry to a given frame
    */
    void SetPageToFrame(int pagenum, int framenum);

    /**
        @brief Determines if a page is loaded into physical memory.
        @param int Page number to check
        @retval bool True if in memory (hit), False if not (miss)
    */
    bool PageIsValid(int pagenum);

    /**
        @brief Print out the page table
    */
    void PrintPageTable();

    /**
     * @brief Print the Inverse Page table
     */
    void PrintInversePageTable();

    /** 
        @brief Get the LRU page
        @retval int The integer value of the LRU page
    */

    int GetLRUPage();

    /**
        @brief Update the LRU list.
        @param int The latest used element
    */
    void UpdateLRUList(int last_used);
    
    /**
        @brief Page out the table.
        @param int The page to pageout.


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

/**
    @typedef MemoryPairAddress_t
    @brief Holds the (P, d) or (f, d) address format 
*/
typedef struct {
    int P;
    int d;
} MemoryPairAddress_t;

/**
    @brief Convert a base-10 address to (P, d) format
    @param int base-10 address to translate
    @retval MemoryPairAddress_t (P, d) pair corresponding to the address
*/
MemoryPairAddress_t ConvertAddressFormat(int addr);
void PrintMemoryPairAddress(MemoryPairAddress_t mempair);
/*
    @class TranslationLookasideBuffer
    @brief A TLB used as a cache for memory
*/

typedef struct {
    int frame;
    int entry;
} TLBReturnData_t;

class TranslationLookasideBuffer {

public:
    /**
     * @brief Constructor for the TLB
     */
    TranslationLookasideBuffer();

    /**
        @brief Determines whether the TLB is full
        @retval bool True/false depending on status of TLB
    */ 
    bool isFull();

    /**
        @brief Searches the TLB for the frame
        @retval TLBReturnData_t Returns frame number, or -1 if a TLB miss
    */
    TLBReturnData_t LookupTLBFrame(int pagenum);

    /**
     * @brief Update the TLB with a new page/frame combination
     * 
     * @param int Page number to cache
     * @param int Frame number to cache
     * @retval int The index into which page/frame combo was hashed
     */
    int UpdateTLB(int pagenum, int framenum);

    /**
     * @brief Print the TLB
     */
    void PrintTLB();
private:
    int pagecol[TLB_ENTRIES];
    int framecol[TLB_ENTRIES];
    int occupied[TLB_ENTRIES];

    /**
        @brief TLB FIFO for page replacement algorithm
    */
    std::queue<int> FIFO_tlb;
};

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

        @param int Virtual address to read from.
        @retval char value from mem[addr]
    */
    char ReadMemory(int addr);

    /**
        @brief Translate a virual address (P, d) to a physical address (f, d). Doesn't implement any p

        @param int Virtual address to translate.

    */
    int TranslateAddress(int addr);

    /**
        @brief Print the page table.
    */
    void PrintPageTable();

    /**
     * @brief Print the TLB
     */
    void PrintTLB();

    /**
     * @brief Print Inverse page table.
     */
    void PrintInversePageTable();

    /**
     * @brief Print TLB and Page Table
     */
    void PrintAll();

    /**
     * @brief Print statistics for page faults and hit rate
     */
    void PrintStats();
private:
    char* backend_store_filename;

    PageTable page_table;
    PhysicalMemory physical_memory;
    TranslationLookasideBuffer tlb;

    uint32_t total_accesses;
    uint32_t page_faults;
    uint32_t tlb_hitrate;

    /**
        @brief Seek a page from the file and copy it to dest

        @param int Page # in file to read from
        @param char[256] Array to copy the page to

    */
    void FileSeek(int fpage, char* dest);
};


#endif
