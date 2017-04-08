#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdio>
#include "memory.h"
using namespace std;

#define INPUT_FN "addresses2.txt"

void RunPhysicalMemoryTests();
void RunAddressConversionTests();
void RunPagingTests();
void RunFullMemoryTests();

void ExecuteFromFile();

int main() {
	ExecuteFromFile();
	return 0;
}

void ExecuteFromFile() {
	MemoryManager mmu;

	std::ifstream infile(INPUT_FN);
	std::string line;
	while(std::getline(infile, line)) {
		std::istringstream iss(line);
		int addr;
		
		if(!(iss >> addr)){
			cout << "I/O ERROR: Couldn't parse " << iss << endl;
			exit(EXIT_FAILURE);
		}
		cout << "Dereferencing address {" << addr << "}..." << endl;
		int contents = mmu.ReadMemory(addr);
		cout << "... found data [" << contents << "]" << endl << endl;
	}

	cout << endl << "Contents of TLB:" << endl;
	mmu.PrintTLB();
	cout << endl << "Contents of Page Table:" << endl;
	mmu.PrintPageTable();
	cout << endl << "Contents of Page Table (Inverse):" << endl;
	mmu.PrintInversePageTable();
	cout << endl << "Memory Access Statistics: " << endl << endl;
	mmu.PrintStats();
}

void RunFullMemoryTests() {
	MemoryManager mmu;
	// Fill the memory with the first 8 frames
	
	for(int i = 1; i < 4095-255; i = i + 256) {
		mmu.ReadMemory(i);
		mmu.PrintAll();
	}
	mmu.ReadMemory(3555);
	mmu.PrintAll();
	mmu.ReadMemory(5);
	mmu.PrintAll();
	mmu.ReadMemory(2050);
	mmu.PrintAll();
	mmu.ReadMemory(2050);
	mmu.PrintAll();
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