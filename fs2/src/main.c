#include <stdio.h>
#include "fileManager.h"

void TestSuperBlock() {
	SuperBlock_t sb;
	sb.dir_start_byte = 1;
	sb.dir_end_byte = 8;

	sb.fat_start_byte = 9;
	sb.fat_end_byte = 16;

	sb.data_start_byte = 32;
	sb.data_end_byte = 64;

	char dest[128];
	SerializeSuperBlock(dest, sb);
	SuperBlock_t sb2 = LoadSuperBlock(dest);
	PrintSuperBlock(sb2);
}

void TestDirBlock() {
	DirectoryBlock_t db;
	db.is_used = 1;
	db.first_block_num = 5;
	db.file_len = 3;
	strcpy(db.filename, "abcd");

	char dest[128];
	SerializeDirectoryBlock(dest, db);
	DirectoryBlock_t db2 = LoadDirectoryBlock(dest);
	PrintDirectoryBlock(db2);
}

void Test3() {
	make_fs("vdisk0");
	mount_fs("vdisk0");

	printf(">>>>>> Testing File Creation <<<<<<\n");
	fs_create("tst7");
	fs_create("tst6");
	fs_create("tst5");
	fs_create("tst4");
	fs_create("tst3");
	fs_create("tst2");
	fs_create("tst1");
	fs_create("tst0");

	FileSystemLS();
	printf("\n");
	dismount_fs("vdisk0");
	mount_fs("vdisk0");
	FileSystemLS();

	printf(">>>>>> Testing File Open/Close <<<<<<\n");
	int fd = fs_open("tst7");
	FileSystemOFTLS();
	fs_close(fd);
	FileSystemOFTLS();
	FileSystemLS();
	printf("\n");
	printf(">>>>>> Testing File Deletion <<<<<<\n");
	fs_delete("tst0");
	FileSystemLS();
	fs_open("tst5");
	fs_delete("tst5");
	fs_create("tst9");
	FileSystemLS();

	dismount_fs("vdisk0");
	mount_fs("vdisk0");
	FileSystemLS();

}

void Test4() {
	make_fs("vdisk4");
	mount_fs("vdisk4");
}

void Test5() {
    make_fs("vdisk5");
    mount_fs("vdisk5");


    char buf[18] = "aaaaaaaaaaaaaaaaa";
    char buf2[18]= "bbbbbbbbbbbbbbbbb";
    fs_create("tst0");
    fs_create("tst1");

    int fd = fs_open("tst0");
    FileSystemLS();
    FileSystemOFTLS();
    fs_write(fd, buf, 18);
    FileSystemLS();
    int fd2 = fs_open("tst1");
    fs_write(fd2, buf, 18);
    FileSystemLS();
    fs_close(fd);
    fs_close(fd2);
    fs_delete("tst0");
    FileSystemLS();

    fs_create("tt0");
    int fs3 = fs_open("tt0");
    fs_write(fs3, buf2, 18);
    FileSystemLS();
    dismount_fs("vdisk5");
}
int main() {
	Test5();

	return 0;
}
