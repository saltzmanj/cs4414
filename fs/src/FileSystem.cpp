#include "FileSystem.h"


/*==================================
=            FileSystem            =
==================================*/




FileSystem::FileSystem() {
	strcpy(this->diskname, "");

}

int FileSystem::make_fs(char* disk_name){
	size_t diskname_chars;

	// Check if name of disk is too long
	diskname_chars = strlen(disk_name);
	if(diskname_chars > MAX_DISK_NAME_CHARS){
		return -1;
	}

	make_disk(disk_name);
	open_disk(disk_name);
	// Setup the address block
	addr_block.directory_addr[0] = 1;
	addr_block.directory_addr[2] = 8;
	addr_block.fat_addr[0] = 9;
	addr_block.fat_addr[2] = 16;
	addr_block.data_addr[0] = 32;
	addr_block.data_addr[2] = 63;
	addr_block.unused_addr[0] = 0;
	addr_block.unused_addr[2] = 0;

	// TODO: Write filesystem to disk
	char block0_buf[BLOCK_SIZE];
	SerializeAddressBlock(addr_block, block0_buf);

	char dir_buf[DIRECTORY_SIZE*BLOCK_SIZE_BYTES];
	dir.Serialize(dir_buf);

	char fat_buf[FAT_TABLE_SIZE*FAT_BLOCK_SIZE];
	file_table.Serialize(fat_buf);

	char datablocks[32 * BLOCK_SIZE_BYTES];

	char total_fs[BLOCK_SIZE_BYTES * TOTAL_BLOCKS];

	memcpy(total_fs, block0_buf, 16);
	memcpy(total_fs + 16, dir_buf, DIRECTORY_SIZE*BLOCK_SIZE_BYTES);
	memcpy(total_fs + 144, fat_buf, FAT_TABLE_SIZE * FAT_BLOCK_SIZE);
	memcpy(total_fs + 512, datablocks, 512);

	for(int i = 0; i < TOTAL_BLOCKS; i++) {
		char block_to_write[16];
		memcpy(block_to_write, total_fs + (i * 16), 16);
		block_write(i, block_to_write);
	}

	close_disk();

	return 0;
}

int FileSystem::mount_fs(char* disk_name){

}

int FileSystem::dismount_fs(char* disk_name){

}

int FileSystem::fs_create(char* name){

}

int FileSystem::fs_open(char* name){

}

int FileSystem::fs_close(int fildes){

}

int FileSystem::fs_delete(char* name){

}

int FileSystem::fs_read(char fildes, void *buf, size_t nbytes){

}

int FileSystem::fs_write(int fildes, void *buf, size_t nbytes){

}

int FileSystem::fs_get_filesize(int fildes){

}

int FileSystem::fs_lseek(int fildes, off_t offset){

}

int FileSystem::fs_truncate(int fildes, off_t length){

}
/*=====  End of FileSystem  ======*/

/*=================================
=            Directory            =
=================================*/

int Directory::LoadDirectory(char* src) { 

	for(int i = 0; i < DIRECTORY_SIZE; i++) {
		char* rawptr = src + i*DIRECTORY_BLOCK_SIZE_BYTES;

		dir_blocks[i].isUsed = rawptr[0];
		memcpy(&dir_blocks[i].first_block_num, rawptr+1, 2);
		memcpy(&dir_blocks[i].file_name, rawptr+3, 4);
		memcpy(&dir_blocks[i].file_len, rawptr+7, 3);
		memcpy(&dir_blocks[i].unused, rawptr+10, 6);
	}
	return 0;
}

int Directory::Serialize(char* dest) {
	char blockbuf[BLOCK_SIZE_BYTES];
	for(int i = 0; i < DIRECTORY_SIZE; i++) {
		SerializeDirectoryBlock(this->dir_blocks[i], blockbuf);
		memcpy(dest + i*BLOCK_SIZE_BYTES, blockbuf, BLOCK_SIZE_BYTES);
	}
	return 0;
}

void Directory::PrintDirectory() {
	printf("%s\n", "Directory Listing");
	printf("Allocated? | 1st Block | Filename | Length\n");	
	for(int i = 0; i < DIRECTORY_SIZE; i++) {
		printf("%hd\t%hd%hd\t%c%c%c%c\t%hd\n", 
			dir_blocks[i].isUsed, 
			dir_blocks[i].first_block_num[1], 
			dir_blocks[i].first_block_num[0], 
			dir_blocks[i].file_name[0],
			dir_blocks[i].file_name[1],
			dir_blocks[i].file_name[2],
			dir_blocks[i].file_name[3], 
			dir_blocks[i].file_len[0]);
	}
}

/*=====  End of Directory  ======*/

/*=============================================
=            File Allocation Table            =
=============================================*/

FileAllocationTable::FileAllocationTable(){
 	for(int i = 0; i < FAT_TABLE_SIZE; i++) {
 		fat_blocks[i].isUsed = 0x00;
 	}
}

int FileAllocationTable::LoadFAT(char* src) {
	for(int i = 0; i < FAT_TABLE_SIZE; i++) {
		char* rawptr = src + i*FAT_BLOCK_SIZE;
		fat_blocks[i].isUsed = rawptr[0];
		memcpy(&fat_blocks[i].blocknum, rawptr+1, 3);
	}
}

int FileAllocationTable::Serialize(char* dest) {
	char blockbuf[FAT_BLOCK_SIZE];
	for(int i = 0; i < FAT_TABLE_SIZE; i++) {
		SerializeFATBlock(fat_blocks[i], blockbuf);
		memcpy(dest + i*FAT_BLOCK_SIZE, blockbuf, FAT_BLOCK_SIZE);
	}
}

void FileAllocationTable::PrintFAT() {
	printf("%s\n", "Free? | Block #");
	for(int i = 0; i < FAT_TABLE_SIZE; i++) {
		printf("%hd\t%hd%hd%hd\n",
			fat_blocks[i].isUsed,
			fat_blocks[i].blocknum[2],
			fat_blocks[i].blocknum[1],
			fat_blocks[i].blocknum[0]);
	}
}

/*=====  End of File Allocation Table  ======*/
