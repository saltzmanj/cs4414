#include <iostream>
#include <cstdio>
#include "memory.h"

void RunPhysicalMemoryTests();
void RunStaticTests();
int main() {
	// RunPhysicalMemoryTests();
	RunStaticTests();
	return 0;
}

void RunStaticTests(){ 
	MemoryPairAddress_t m1 = ConvertAddressFormat(2096);
	PrintMemoryPairAddress(m1);

	m1 = ConvertAddressFormat(4095);
	PrintMemoryPairAddress(m1);

	m1 = ConvertAddressFormat(5);
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

	printf("Least used: %d\n", pmem.FindLRUFrame());
	printf("Full?: %d\n", pmem.isFull());
	printf("First available frame: %d\n", pmem.FindFirstFrame());

}