#ifndef __FILEMANAGER_H_
#define __FILEMANAGER_H_

#include <sys/types.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "disk.h"

#define DEBUG 0
#define debug_print(...) \
    do { if (DEBUG) fprintf(stdout, __VA_ARGS__); } while(0)

#ifndef min_
    #define min_(a,b) ((a) < (b) ? (a) : (b))
#endif
/*==================================
=            Parameters            =
==================================*/

#define DIRECTORY_SIZE  8
#define FAT_SIZE        32
#define DATA_BLOCK_SIZE 16
#define DATA_SIZE       32
#define OFT_SIZE        4
/*=====  End of Parameters  ======*/

/*======================================================
=            FileSystem Interface Functions            =
======================================================*/

int make_fs(char* disk_name);
int mount_fs(char* disk_name);
int dismount_fs(char* disk_name);

int fs_create(char* name);
int fs_open(char* name);
int fs_close(int fildes);
int fs_delete(char* name);
int fs_read(int fildes, void *buf, size_t nbytes);
int fs_write(int fildes, void *buf, size_t nbytes);
int fs_get_filesize(int fildes);
int fs_lseek(int fildes, off_t offset);
int fs_truncate(int fildes, off_t length);

/*=====  End of FileSystem Interface Functions  ======*/

/*====================================
=            Custom Types            =
====================================*/

typedef struct {
    uint16_t    dir_start_byte;
    uint16_t    dir_end_byte;

    uint16_t    fat_start_byte;
    uint16_t    fat_end_byte;

    uint16_t    data_start_byte;
    uint16_t    data_end_byte;

    uint32_t    unused;
} SuperBlock_t;

typedef struct {
    uint8_t     is_used;
    uint16_t    first_block_num;

    char        filename[5];
    uint16_t    file_len;

    uint32_t    unused0;
    uint16_t    unused1;
} DirectoryBlock_t;

typedef struct {
    uint8_t     is_used;
    uint16_t    file_index;
    uint8_t     unused;
} FATBlock_t;

typedef struct {
    char    data[DATA_BLOCK_SIZE];
} DataBlock_t;

typedef struct {
    SuperBlock_t        super_block;
    DirectoryBlock_t    directory_blocks[DIRECTORY_SIZE];
    FATBlock_t          fat_blocks[FAT_SIZE];
    DataBlock_t         data_blocks[DATA_SIZE];
} FileSystem_t;

typedef struct {
    uint8_t             open[OFT_SIZE];
    DirectoryBlock_t*   dirptr[OFT_SIZE];
    uint16_t            offset[OFT_SIZE];
} OFT_t;

typedef struct {
    FileSystem_t    fs;
    OFT_t           oft;
    int             isopen;
    int             isvalid;
} GlobalData_t;

/*----------  SuperBlock  ----------*/

void SerializeSuperBlock(char* dest, SuperBlock_t sblock);
SuperBlock_t LoadSuperBlock(char* src);
void PrintSuperBlock(SuperBlock_t sblock);

/*----------  Directory Block  ----------*/

void SerializeDirectoryBlock(char* dest, DirectoryBlock_t dblock);
DirectoryBlock_t LoadDirectoryBlock(char* src);
void PrintDirectoryBlock(DirectoryBlock_t dblock);

/*----------  FAT Block  ----------*/

void SerializeFATBlock(char* dest, FATBlock_t fblock);
FATBlock_t LoadFATBlock(char* src);


/*----------  Data Block  ----------*/

void SerializeDataBlock(char* dest, DataBlock_t dblock);
DataBlock_t LoadDataBlock(char* src);


/*----------  OFT  ----------*/

int GetFD(OFT_t* oft, DirectoryBlock_t* dptr);
int ClearFD(OFT_t* oft, uint8_t fd);
DirectoryBlock_t* LookupFD(OFT_t* oft, int filedes);

/*----------  File System Related Commands  ----------*/

void SerializeFileSystem(char* dest, FileSystem_t fsystem);
FileSystem_t LoadFileSystem(char* src);

void FileSystemLS();
int CountFiles(FileSystem_t fsystem);
void FileSystemPrintFAT();
void FileSystemOFTLS();

typedef struct {
    int spaces[FAT_SIZE];
    int nspaces;
    int failed;
} FatTableReturn_t;

FatTableReturn_t FindFATTableSpace(FileSystem_t* fs, int space_wanted);
FatTableReturn_t LookupFATBlocks(FileSystem_t* fs, DirectoryBlock_t* file);
int ReserveFATBlocks(FileSystem_t* fs, FatTableReturn_t blocks_wanted, DirectoryBlock_t* file);

/*=====  End of Custom Types  ======*/


#endif