#ifndef __FILESYSTEM_H_
#define __FILESYSTEM_H_

#include <sys/types.h>
#include <stdint.h>;
#include "DiskDriver.h"

using namespace std;

#define MAX_DISK_NAME_CHARS 255

// 16 Byte "superblock": block 0 on disk
typedef struct {
	uint8_t[2] directory_addr;
	uint8_t[2] fat_addr;
	uint8_t[2] data_addr;
	uint8_t[2] unused_addr;
} AddressBlock_t;

void SerializeAddressBlock(AddressBlock_t addrblock, char* dest);

// 16 byte directory block
// 	1 per file
typedef struct {
	unsigned char isUsed;
	uint8_t first_block_num;
	uint16_t file_name;
	uint16_t file_len;
	unsigned char unused[5];
} DirectoryBlock_t;

void SerializeDirectoryBlock(DirectoryBlock_t dirblock, char* dest);

class FileAllocationTable {
public:
	FileAllocationTable();
private:
};

class FileSystem {
public:
	FileSystem();

	// Creation, mount, dismount
	int make_fs(char* disk_name);
	int mount_fs(char* disk_name);
	int dismount_fs(char* disk_name);

	// File operations
	int fs_create(char* name);
	int fs_open(char* name);
	int fs_close(int fildes);
	int fs_delete(char* name);
	int fs_read(char fildes, void *buf, size_t nbytes);
	int fs_write(int fildes, void *buf, size_t nbytes);
	int fs_get_filesize(int fildes);
	int fs_lseek(int fildes, off_t offset);
	int fs_truncate(int fildes, off_t length);

private:
	DiskDriver 			disk_driver;
	FileAllocationTable file_table;
	AddressBlock_t		addr_block;

	char diskname[MAX_DISK_NAME_CHARS + 1];
};

#endif