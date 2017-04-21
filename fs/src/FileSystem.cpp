#include "FileSystem.h"

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

	disk_driver.MakeDisk(disk_name);

	// TODO: Write filesystem to disk
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
