#ifndef __FILESYSTEMINTERFACE_H_
#define __FILESYSTEMINTERFACE_H_

#include <sys/types.h>
#include "FileSystem.h"

int make_fs(char* disk_name);
int mount_fs(char* disk_name);
int dismount_fs(char* disk_name);

int fs_create(char* name);
int fs_open(char* name);
int fs_close(int fildes);
int fs_delete(char* name);
int fs_read(char fildes, void *buf, size_t nbytes);
int fs_write(int fildes, void *buf, size_t nbytes);
int fs_get_filesize(int fildes);
int fs_lseek(int fildes, off_t offset);
int fs_truncate(int fildes, off_t length);

#endif