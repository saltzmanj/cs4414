#ifndef __FILESYSTEM_H_
#define __FILESYSTEM_H_

#include <sys/types.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "fstypes.h"
// #include "DiskDriver.h"
#include "disk.h"

using namespace std;

#define MAX_DISK_NAME_CHARS 255
#define BLOCK_SIZE_BYTES 16
#define TOTAL_BLOCKS 64
#define FAT_TABLE_SIZE 32
#define FAT_UNUSED_BLOCKS 16
#define DIRECTORY_SIZE 8

class Directory {
public:
	/**
	 * @brief Populate the directory listing from an 8 block, 128 byte buffer
	 * 
	 * @param src Source buffer
	 * @return 0
	 */
	int LoadDirectory(char* src);
	/**
	 * @brief Serialize a directory 
	 * 
	 * @param dest Destination buffer, 128 bytes
	 * @return 0
	 */
	int Serialize(char* dest);

	/**
	 * @brief Print out the directory
	 */
	void PrintDirectory();
private:
	DirectoryBlock_t dir_blocks[DIRECTORY_SIZE];
};

class FileAllocationTable {
public:
	FileAllocationTable();

	/**
	 * @brief Load FAT From 128 byte buffer
	 * @return 0
	 */
	int LoadFAT(char* src);

	/**
	 * @brief Serialize FAT into a 128 byte buffer
	 * 
	 * @param dest 128 byte destination buffer
	 * @return 0
	 */
	int Serialize(char* dest);

	/**
	 * @brief Print FAT
	 */
	void PrintFAT();
private:
	FATBlock_t fat_blocks[FAT_TABLE_SIZE];
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
	// DiskDriver 			disk_driver;
	FileAllocationTable file_table;
	Directory 			dir;
	AddressBlock_t		addr_block;

	char diskname[MAX_DISK_NAME_CHARS + 1];
};

#endif