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
    char buf3[18]= "abcdefghijklmnopq";
    fs_create("tst0");
    fs_create("tst1");

    int fd = fs_open("tst0");
    FileSystemLS();
    FileSystemOFTLS();
    fs_write(fd, buf, 17);
    FileSystemLS();
    int fd2 = fs_open("tst1");
    fs_write(fd2, buf2, 17);
    FileSystemLS();
    fs_close(fd);
    fs_close(fd2);
    fs_delete("tst0");
    FileSystemLS();

    fs_create("tt0");
    int fs3 = fs_open("tt0");
    fs_write(fs3, buf3, 17);
    fs_write(fs3, buf3, 17);
    FileSystemLS();
    FileSystemOFTLS();

    char buf_r[35];
    fs_close(fs3);
    fs3 = fs_open("tt0");
    fs_read(fs3, buf_r, 34);

    buf_r[34] = '\0';
    printf("Contents of buf_r: %s\n", buf_r);
    printf("Length of file tt0: %d\n", fs_get_filesize(fs3));
    printf("\n\n");
    FileSystemOFTLS();
    fs_lseek(fs3, -16);
    FileSystemOFTLS();
    dismount_fs("vdisk5");
}

void Test6() {
    make_fs("vsk");
    mount_fs("vsk");

    char buf[18] = "abcdefghijklmnopq";

    fs_create("alph");
    int fd = fs_open("alph");
    fs_write(fd, buf, 18);

    FileSystemOFTLS();
    FileSystemLS();

    char buf_r1[18];
    char buf_r2[14];
    buf_r1[17] = '\0';
    buf_r2[13] = '\0';
    fs_read(fd, buf_r1, 18);

    fs_truncate(fd, 4);
    fs_read(fd, buf_r2, 14);
    FileSystemLS();
    FileSystemOFTLS();

    printf("%s\n", buf_r1);
    printf("%s\n", buf_r2);

    FileSystemPrintFAT();
    dismount_fs("vsk");
}

void TestMake() {
    int r = make_fs("tmk0");
    printf("Make: %d\n", r);
}

void TestMount() {
    // int r = make_fs("tmt0");
    int d = mount_fs("tmt0");
    printf("Mount: %d\n", d);
    dismount_fs("tmt0");
}

void TestCreate() {
    make_fs("tcr");
    mount_fs("tcr");
    int i;
    for(i = 0; i < 10; i++) {
        char fname[5];
        sprintf(fname, "f%d", i);
        if(i == 5){
            int k = fs_create("ffffffff");
            printf("File %d, status %d\n", i, k);
            continue;
        }
        int s = fs_create(fname);
        printf("File %d, status %d\n", i, s);

    }
    FileSystemLS();
}

void TestOpens() {
    make_fs("top");
    mount_fs("top");
    int i;
    for(i = 0; i < 8; i++) {
        char fname[5];
        sprintf(fname, "f%d", i);
        int s = fs_create(fname);
    } 

    char fname[5];
    for(i = 0; i < 5; i++) {
        sprintf(fname, "f%d", i);
        int fd = fs_open(fname);
        printf("File %s, fd %d\n", fname, fd);
    }
    int fd = fs_open("f3");
    printf("File %s, fd %d\n", "f3", fd);
    
    fd = fs_open("q1");
    printf("File %s, fd %d\n", "q1", fd);
    FileSystemOFTLS();
}

void TestClosed() {
    make_fs("tcl");
    mount_fs("tcl");

    char fname[5];
    int i;
    for(i = 0; i < 8; i++) {
        char fname[5];
        sprintf(fname, "f%d", i);
        int s = fs_create(fname);
    } 
    for(i = 0; i < 5; i++) {
        sprintf(fname, "f%d", i);
        int fd = fs_open(fname);
        printf("Open| File %s, fd %d\n", fname, fd);
    }
    FileSystemOFTLS();
    for(i = 0; i < 7; i++) {
        int s = fs_close(i);
        printf("Close| File %d, status %d\n", i, s);
    }
    FileSystemOFTLS();
}

void TestDeleteSimple() {
    make_fs("tdl");
    mount_fs("tdl");

    char fname[5];
    int i;
    for(i = 0; i < 8; i++) {
        char fname[5];
        sprintf(fname, "f%d", i);
        int s = fs_create(fname);
    } 
    FileSystemLS();

    for(i = 0; i < 5; i++) {
        sprintf(fname, "f%d", i);
        if(i==3) fs_open(fname);
        int fd = fs_delete(fname);
        printf("Delete| File %s, fd %d\n", fname, fd);
    }
    FileSystemLS();
}

void TestRead() {
    make_fs("trd");
    mount_fs("trd");

    int fd = fs_create("rdt");
    char buftest[27] = "abcdefghijklmnopqrstuvwxyz";
    fs_open("rdt");
    fs_write(fd, buftest, 27);
    fs_close(fd);

    FileSystemLS();

    int fd2 = fs_open("rdt");
    char buftarget[27];
    FileSystemOFTLS();
    fs_read(fd2, buftarget, 40);
    FileSystemOFTLS();
    printf("Read: %s\n", buftarget);

    fs_close(fd2);

    int fd3 = fs_open("rdt");
    char b1[8];
    char b2[10];

    b1[7] = '\0';
    b2[9] = '\0';
    FileSystemOFTLS();
    fs_read(fd3, b1, 7);
    FileSystemOFTLS();
    fs_read(fd3, b2, 9);
    FileSystemOFTLS();
    printf("Read: %s\n", b1);
    printf("Read: %s\n", b2);

}

void TestWrite1() {
    make_fs("tsw1");
    mount_fs("tsw1");

    char full[512];
    int i;
    for(i = 0; i < 511; i++) {
        full[i] = 's';
    }
    full[511] = '\0';

    fs_create("ssss");
    fs_create("s2");
    int fd = fs_open("ssss");
    int fd2 = fs_open("s2");
    int r = fs_write(fd, full, 512);
    int r2 = fs_write(fd2, full, 8);
    fs_close(fd);
    fs_close(fd2);
    FileSystemLS();
    dismount_fs("tsw1");
    printf("Write returned: %d, %d\n", r, r2);

}

void TestWrite2() {
    make_fs("tsw2");
    mount_fs("tsw2");


    char buf[18] = "abcdefghijklmnopq";
    char buf2[18] = "qqqqqqqqqqqqqqqqq";
    fs_create("w2");
    int fd = fs_open("w2");
    fs_write(fd, buf, 18);
    fs_write(fd, buf2, 18);

    char target[36];
    fs_close(fd);
    fd = fs_open("w2");
    FileSystemLS();
    fs_read(fd, target, 36);

    printf("Read Returned: %s %s\n", &target[0], &target[18]);

}

void TestFsize() {
    make_fs("tfs");
    mount_fs("tfs");
    char buf[18] = "abcdefghijklmnopq";
    fs_create("w2");
    int fd = fs_open("w2");
    fs_write(fd, buf, 18);
    int s = fs_get_filesize(0);
    printf("File Size: %d\n", s);
}

void TestSeek() {
    make_fs("tsk");
    mount_fs("tsk");
    char buf[18] = "abcdefghijklmnopq";
    char buf2[18]= "qqqqqqqqqqqqqqqqq";
    fs_create("f1");
    int fd = fs_open("f1");
    fs_write(fd, buf, 18);
    int s = fs_get_filesize(fd);
    int r1 = fs_lseek(fd, -s);
    fs_write(fd, buf2, 18);

    int r2 = fs_lseek(fd, -5);

    char target[6];
    fs_read(fd, target, 6);
    int r3 = fs_lseek(fd, 100);
    printf("LSeek returned: (%d, %d, %d), read: %s\n", r1, r2, r3, target);

}

void TestTruncate() {
    make_fs("ttr");
    mount_fs("ttr");

    char buf[18] = "abcdefghijklmnopq";
    fs_create("f1");
    int fd = fs_open("f1");
    fs_write(fd, buf, 18);
    fs_truncate(fd, 5);

    int l = fs_get_filesize(fd);
    printf("File Size: %d\n", l);

    fs_lseek(fd, -l);
    char target[6];
    target[5] = '\0';
    fs_read(fd, target, 18);
    printf("Read: %s\n", target);
    FileSystemLS();
    FileSystemOFTLS();
    fs_close(fd);
    FileSystemPrintFAT();
}

void TestDeleteComplex() {
    make_fs("tdlc");
    mount_fs("tdlc");

    char buf[18] = "abcdefghijklmnopq";

    char fname[5];
    int i;
    for(i = 0; i < 8; i++) {
        char fname[5];
        sprintf(fname, "f%d", i);
        int s = fs_create(fname);
    } 
    FileSystemLS();

    int fds[5];
    for(i = 0; i < 5; i++) {
        sprintf(fname, "f%d", i);
        fds[i] = fs_open(fname);
        fs_write(fds[i], buf, 18);
    }
    FileSystemLS();

    fs_close(fds[1]);
    fs_delete("f1");
    FileSystemLS();

    int q = fs_open("f4");
    fs_write(q, buf, 18);
    fs_close(q);
    FileSystemLS();

}

void ReproduceTestError() {
    make_fs("mydk");
    mount_fs("mydk");
    int status;
    status = fs_create("fa");
    int fda = fs_open("fa");
    // status = fs_open("fa");

    int nbyte;
    int total;

    nbyte = 9;
    char bufa[] = "Hi, there";
    status = fs_write(fda, bufa, nbyte);
    
    status = fs_create("fb");
    int fdb = fs_open("fb");

    char bufb[] = "The goal of this project";
    nbyte = 24;
    total = fs_write(fdb, bufb, nbyte);

    // (1)
    status = fs_create("fc");

    int fdc = fs_open("fc");

    char bufc[] = "CS4414 is fun";
    nbyte = 13;
    total = fs_write(fdc, bufc, nbyte);

    status = fs_create("fd");
    int fdd = fs_open("fd");

    char bufd[] = "I love computer programming because I can ask computers to do something for me";
    nbyte = 78;
    total = fs_write(fdd,bufd,nbyte);

    status = fs_create("fe");
    int fde = fs_open("fe");

    int offset = -22;
    fs_lseek(fdd, offset);

    FileSystemOFTLS();

    char rbuf[16];
    rbuf[15] = '\0';

    nbyte = 15;
    fs_read(fdd, rbuf, nbyte);
    printf("Read D/1: %s\n", rbuf);


    int c_nl = 9;
    fs_truncate(fdc, c_nl);
    FileSystemLS();

    fs_close(fda);
    fs_close(fdb);
    fs_close(fdc);
    fs_close(fdd);

    FileSystemOFTLS();
    FileSystemLS();
    fda = fs_open("fa");
    fdb = fs_open("fb");
    fdc = fs_open("fc");
    fdd = fs_open("fd");


    char target[79];
    target[9] = '\0';
    fs_read(fda, target, 9);
    printf("Read A: %s\n", target);

    target[24] = '\0';
    fs_read(fdb, target, 24);
    printf("Read B: %s\n", target);

    target[13] = '\0';
    fs_read(fdc, target, 13);
    printf("Read C: %s\n", target);

    target[78] = '\0';
    fs_read(fdd, target, 78);
    printf("Read D: %s\n", target);



}

int main() {
	ReproduceTestError();

	return 0;
}
