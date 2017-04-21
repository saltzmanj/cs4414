#include "fileManager.h"
FileSystem filesystem;

int make_fs(char* disk_name) {
	int r = filesystem.make_fs(disk_name);
	return r;
}
int mount_fs(char* disk_name) {
	int r = filesystem.mount_fs(disk_name);
	return r;
}
int dismount_fs(char* disk_name) {
	int r = filesystem.dismount_fs(disk_name);
	return r;
}
int fs_create(char* name) {
	int r = filesystem.fs_create(name);
	return r;
}
int fs_open(char* name) {
	int r = filesystem.fs_open(name);
	return r;
}
int fs_close(int fildes) {
	int r = filesystem.fs_close(fildes);
	return r;
}
int fs_delete(char* name) {
	int r = filesystem.fs_delete(name);
	return r;
}
int fs_read(char fildes, void *buf, size_t nbytes) {
	int r = filesystem.fs_read(fildes, buf, nbytes);
	return r;
}
int fs_write(int fildes, void *buf, size_t nbytes) {
	int r = filesystem.fs_write(fildes, buf, nbytes);
	return r;
}
int fs_get_filesize(int fildes) {
	int r = filesystem.fs_get_filesize(fildes);
	return r;
}
int fs_lseek(int fildes, off_t offset){
	int r = filesystem.fs_lseek(fildes, offset);
	return r;
}
int fs_truncate(int fildes, off_t length){
	int r = filesystem.fs_truncate(fildes, length);
	return r;
}