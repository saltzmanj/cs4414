#include <iostream>
#include <cstdio>
#include "memory.h"

void RunPhysicalMemoryTests();
void RunAddressConversionTests();
void RunPagingTests();
void RunFullMemoryTests();

int main() {
	// RunPhysicalMemoryTests();
	// RunAddressConversionTests();
	// RunPagingTests();
	RunFullMemoryTests();
	return 0;
}

void RunFullMemoryTests() {
	MemoryManager mmu;
	// Fill the memory with the first 8 frames
	
	for(int i = 1; i < 4095-255; i = i + 256) {
		mmu.ReadMemory(i);
	}
	mmu.ReadMemory(3555);
	mmu.PrintPageTable();
	mmu.ReadMemory(5);
	mmu.PrintPageTable();
	mmu.ReadMemory(2050);
	mmu.PrintPageTable();
}

void RunPagingTests() {
	MemoryManager mmu;
	char result;
	int addr;

	addr = 1;
	result = mmu.ReadMemory(addr);
	printf("Retrieved {%d} from virtual address {%d}\n\n", result, addr);
	// The page table should have frame 0 assigned to page 0
	// mmu.PrintPageTable();

	addr = 513;
	result = mmu.ReadMemory(addr);
	printf("Retrieved {%d} from virtual address {%d}\n\n", result, addr);
	// mmu.PrintPageTable();

	addr = 515;
	result = mmu.ReadMemory(addr);
	printf("Retrieved {%d} from virtual address {%d}\n\n", result, addr);
	// result = mmu.ReadMemory(515);
	mmu.PrintPageTable();

}

void RunAddressConversionTests(){ 
	MemoryPairAddress_t m1 = ConvertAddressFormat(2096);
	PrintMemoryPairAddress(m1);

	m1 = ConvertAddressFormat(4095);
	PrintMemoryPairAddress(m1);

	m1 = ConvertAddressFormat(6);
	PrintMemoryPairAddress(m1);
}
void RunPhysicalMemoryTests(){
	PhysicalMemory pmem;
	pmem.GetMemoryContents(0, 100);
	pmem.GetMemoryContents(1, 100);
	pmem.GetMemoryContents(2, 100);
	pmem.GetMemoryContents(3, 100);

	pmem.GetMemoryContents(5, 100);
	pmem.GetMemoryContents(6, 100);
	pmem.GetMemoryContents(7, 100);
	pmem.GetMemoryContents(1, 100);
	pmem.GetMemoryContents(2, 100);
	pmem.GetMemoryContents(3, 100);
	pmem.GetMemoryContents(4, 100);

	pmem.GetMemoryContents(5, 100);
	pmem.GetMemoryContents(6, 100);

	// pmem.GetMemoryContents(0, 300);

	// printf("Least used: %d\n", pmem.FindLRUFrame());
	printf("Full?: %d\n", pmem.isFull());
	printf("First available frame: %d\n", pmem.FindFirstFrame());

}