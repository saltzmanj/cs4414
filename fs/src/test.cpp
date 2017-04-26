#include <iostream>
#include "fileManager.h"
#include "fstypes.h"
#include "FileSystem.h"
#include <stdio.h>
#include <stdint.h>

// void test_addrblock(){
// 	AddressBlock_t addr_block;

// 	addr_block.directory_addr[0] = 1;
// 	addr_block.directory_addr[2] = 8;
// 	addr_block.fat_addr[0] = 9;
// 	addr_block.fat_addr[2] = 16;
// 	addr_block.data_addr[0] = 32;
// 	addr_block.data_addr[2] = 63;
// 	addr_block.unused_addr[0] = 0;
// 	addr_block.unused_addr[2] = 0;

// 	char buf[ADDR_BLOCK_SIZE_BYTES];
// 	SerializeAddressBlock(addr, buf);
// 	for(int i = 0; i < 16; i++) {
// 		printf("%x\n", (uint16_t) buf[i]);
// 	}
// }

void test_directory() {
	Directory dir;
	DirectoryBlock_t testblock;

	testblock.isUsed = 0;
	testblock.first_block_num[0] = 1;
	testblock.first_block_num[1] = 0;
	memcpy(testblock.file_name, "abcd",4);
	testblock.file_len[0] = 45;
	testblock.file_len[1] = 0;
	testblock.file_len[2] = 0;

	char src[16];
	SerializeDirectoryBlock(testblock, src);
	char srcall[128];
	for(int i = 0; i < 8; i++) {
		memcpy(srcall + (i*16), src, 16);
	}
	dir.LoadDirectory(srcall);
	dir.PrintDirectory();
}

void test_fat1() {
	FileAllocationTable fat; 
	FATBlock_t testblock;
	testblock.isUsed = 1;
	testblock.blocknum[0] = 6;
	testblock.blocknum[1] = 0;
	testblock.blocknum[2] = 0;

	char src[4];
	SerializeFATBlock(testblock, src);
	char srcall[128];
	for(int i = 0; i < 32; i++) {
		memcpy(srcall + (i*4), src, 4);
	}
	fat.LoadFAT(srcall);
	fat.PrintFAT();
}

int main() {
	printf("%s\n", ">>>> Testing Directory...");
	test_directory();
	printf("%s\n", ">>>> Testing FAT");
	test_fat1();
	printf("%s\n", ">>>> Testing FileSystem...");
	make_fs("vdisk1");
	return 0;
}

