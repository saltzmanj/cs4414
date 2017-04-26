#ifndef __FSTYPES_H_
#define __FSTYPES_H_

#include <string.h>

// 16 Byte "superblock": block 0 on disk
#define ADDR_BLOCK_SIZE_BYTES 16
typedef struct {
	unsigned char directory_addr[4];
	unsigned char fat_addr[4];
	unsigned char data_addr[4];
	unsigned char unused_addr[4];
} AddressBlock_t;


// 16 byte directory block
#define DIRECTORY_BLOCK_SIZE_BYTES 16
typedef struct {
	unsigned char isUsed;
	unsigned char first_block_num[2];
	unsigned char file_name[4];
	unsigned char file_len[3];
	unsigned char unused[6];
} DirectoryBlock_t;

#define FAT_BLOCK_SIZE 4
typedef struct {
	unsigned char isUsed;
	unsigned char blocknum[3];
} FATBlock_t;

void SerializeAddressBlock(AddressBlock_t addrblock, char* dest);
void SerializeDirectoryBlock(DirectoryBlock_t dirblock, char* dest);
void SerializeFATBlock(FATBlock_t fatblock, char* dest);
#endif