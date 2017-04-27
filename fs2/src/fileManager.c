#include "fileManager.h"
/*========================================
=            Global Variables            =
========================================*/

GlobalData_t globals;

/*=====  End of Global Variables  ======*/

void SerializeSuperBlock(char* dest, SuperBlock_t sblock){
    memcpy(dest,    &sblock.dir_start_byte,  2);
    memcpy(dest+2,  &sblock.dir_end_byte,    2);

    memcpy(dest+4,  &sblock.fat_start_byte,  2);
    memcpy(dest+6,  &sblock.fat_end_byte,    2);

    memcpy(dest+8,  &sblock.data_start_byte, 2);
    memcpy(dest+10, &sblock.data_end_byte,   2);
}

SuperBlock_t LoadSuperBlock(char* src){
    SuperBlock_t sblock;

    memcpy(&sblock.dir_start_byte,  src,    2);
    memcpy(&sblock.dir_end_byte,    src+2,  2);

    memcpy(&sblock.fat_start_byte,  src+4,  2);
    memcpy(&sblock.fat_end_byte,    src+6,  2);

    memcpy(&sblock.data_start_byte, src+8,  2);
    memcpy(&sblock.data_end_byte,   src+10, 2);

    return sblock;
}

void PrintSuperBlock(SuperBlock_t sblock) {
    printf("%s\n", "SuperBlock Contents");
    printf("\tDirectory: [%hd,%hd]\n", sblock.dir_start_byte, sblock.dir_end_byte);
    printf("\tFAT: [%hd,%hd]\n", sblock.fat_start_byte, sblock.fat_end_byte);
    printf("\tData: [%hd,%hd]\n", sblock.data_start_byte, sblock.data_end_byte);
}

void SerializeDirectoryBlock(char* dest, DirectoryBlock_t dblock){
    memcpy(dest, &dblock.is_used, 1);
    memcpy(dest+1, &dblock.first_block_num, 2);
    memcpy(dest+3, dblock.filename, 5);
    memcpy(dest+8, &dblock.file_len, 2);
}

DirectoryBlock_t LoadDirectoryBlock(char* src){
    DirectoryBlock_t dblock;
    memcpy(&dblock.is_used, src, 1);
    memcpy(&dblock.first_block_num, src+1, 2);
    memcpy(dblock.filename, src+3, 5);
    memcpy(&dblock.file_len, src+8, 2);
    return dblock;
}

void PrintDirectoryBlock(DirectoryBlock_t dblock) {
    printf("%s\n", "Directory Block Contents");
    printf("\tAllocated?: %hd\n", dblock.is_used);
    printf("\tFirst Block #: %hd\n", dblock.first_block_num);
    printf("\tFilename: %s\n", dblock.filename);
    printf("\tFile Length: %hd\n", dblock.file_len);
}

void SerializeFATBlock(char* dest, FATBlock_t fblock){
    memcpy(dest, &fblock.is_used, 1);
    memcpy(dest+1, &fblock.file_index, 2);
}

FATBlock_t LoadFATBlock(char* src){
    FATBlock_t fblock;
    memcpy(&fblock.is_used, src, 1);
    memcpy(&fblock.file_index, src+1, 2);
    return fblock;
}

void SerializeDataBlock(char* dest, DataBlock_t dblock){
    memcpy(dest, dblock.data, DATA_BLOCK_SIZE);
}

DataBlock_t LoadDataBlock(char* src){
    DataBlock_t dblock;
    memcpy(dblock.data, src, DATA_BLOCK_SIZE);
    return dblock;
}


void SerializeFileSystem(char* dest, FileSystem_t fsystem){
    int i;
    char addr_block[16];
    char dir_blocks[16*DIRECTORY_SIZE];
    char fat_blocks[4*FAT_SIZE];
    char* unused_blocks = (char*) calloc(15, sizeof(char) * 16);
    char data_blocks[16*DATA_SIZE];

    // Serialize everything

    SerializeSuperBlock(addr_block, fsystem.super_block);

    for(i = 0; i < DIRECTORY_SIZE; i++) {
        char* bptr = dir_blocks + 16*i;
        SerializeDirectoryBlock(bptr, fsystem.directory_blocks[i]);
    }

    for(i = 0; i < FAT_SIZE; i++) {
        char* fptr = fat_blocks + 4*i;
        SerializeFATBlock(fptr, fsystem.fat_blocks[i]);
    }

    for(i = 0; i < DATA_SIZE; i++) {
        char* dptr = data_blocks + 16*i;
        SerializeDataBlock(dptr, fsystem.data_blocks[i]);
    }

    memcpy(dest, addr_block, 16);
    memcpy(dest + 16, dir_blocks, 16*DIRECTORY_SIZE);
    memcpy(dest + 144, fat_blocks, 4*FAT_SIZE);
    memcpy(dest + 272, unused_blocks, 16*15);
    memcpy(dest + 512, data_blocks, 512);

    free(unused_blocks);

}

FileSystem_t LoadFileSystem(char* src) {
    FileSystem_t fs;

    memcpy(&fs.super_block, src, 16);

    int i;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        int offset = 16;
        DirectoryBlock_t db;
        db = LoadDirectoryBlock(src+offset+i*16);
        fs.directory_blocks[i] = db;
    }

    for(i = 0; i < FAT_SIZE; i++) {
        int offset = 9*16;
        FATBlock_t fb;
        fb = LoadFATBlock(src+offset+i*16);
        fs.fat_blocks[i] = fb;
    }

    for(i = 0; i < DATA_SIZE; i++) {
        int offset = 512;
        DataBlock_t dtb;
        dtb = LoadDataBlock(src+offset+i*16);
        fs.data_blocks[i] = dtb;
    }

    return fs;
}

void FileSystemLS() {
    printf("--- Directory --- \n");
    printf("%s \t| %s \t| %s \n","Name", "Size", "Block");
    printf("--------+-------+--------\n");
    int i;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        if(globals.fs.directory_blocks[i].is_used == 1) {
            printf("%s \t| %d \t| %d \n",
                    globals.fs.directory_blocks[i].filename,
                    globals.fs.directory_blocks[i].file_len,
                    globals.fs.directory_blocks[i].first_block_num);
        }
    }
}

int CountFiles(FileSystem_t fsystem) {
    int i;
    int count = 0;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        DirectoryBlock_t* dptr = &globals.fs.directory_blocks[i];
        if(dptr->is_used == 1)
            count++;
    }
    return count;
}

FatTableReturn_t FindFATTableSpace(FileSystem_t* fs, int space_wanted) {
    FATBlock_t* ftable = fs->fat_blocks;
    FatTableReturn_t retstruct;
    retstruct.nspaces = 0;

    int i;
    int idx = 0;

    if(space_wanted > FAT_SIZE) {
        retstruct.failed = 1;
        return retstruct;
    }

    for(i = 0; i < FAT_SIZE; i++) {
        if(ftable[i].is_used == 0) {
            retstruct.spaces[idx] = i;
            idx += 1;
            retstruct.nspaces += 1;
            if(idx == space_wanted){
                retstruct.failed = 0;
                return retstruct;
            }
        }
    }
    if(idx < space_wanted - 1) {
        retstruct.failed = 1;
    }
    return retstruct;
}

int ReserveFATBlocks(FileSystem_t* fs, FatTableReturn_t blocks_wanted, DirectoryBlock_t* file) {

    FATBlock_t* ftable = fs->fat_blocks;
    // Search the filesystem for the index of the file
    int i;
    int file_index = 0;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        if(strcmp(fs->directory_blocks[i].filename, file->filename) == 0){
            file_index = i;
            break;
        }
    }

    for(i = 0; i < blocks_wanted.nspaces; i++) {
        int block = blocks_wanted.spaces[i];
        ftable[block].is_used = 1;
        ftable[block].file_index = file_index;
    }
    return 0;
}

FatTableReturn_t LookupFATBlocks(FileSystem_t* fs, DirectoryBlock_t* file) {
    FATBlock_t* ftable = fs->fat_blocks;
    // Search the filesystem for the index of the file
    int i;
    int file_index = 0;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        if(strcmp(fs->directory_blocks[i].filename, file->filename) == 0){
            file_index = i;
            break;
        }
    }

    FatTableReturn_t ftr;

    int idx = 0;
    ftr.nspaces = 0;
    for(i = 0; i < FAT_SIZE; i++) {
        if(ftable[i].file_index == file_index){
            ftr.spaces[idx] = i;
            idx += 1;
            ftr.nspaces += 1;
        }
    }

    return ftr;
}



int make_fs(char* disk_name) {
    SuperBlock_t sb;
    FileSystem_t fs;
    char* blank1024 = (char*) calloc(1024, 1);
    char buf[1024];
    memcpy(buf, blank1024, 1024);
    free(blank1024);

    make_disk(disk_name);

    sb.dir_start_byte = 0;
    sb.dir_end_byte = 8;
    sb.fat_start_byte = 9;
    sb.fat_end_byte = 16;
    sb.data_start_byte = 32;
    sb.data_end_byte = 63;

    fs.super_block = sb;

    int i;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        DirectoryBlock_t db;
        db.is_used = 0;
        db.first_block_num = 0;
        fs.directory_blocks[i] = db;
    }

    for(i = 0; i < FAT_SIZE; i++) {
        FATBlock_t ft;
        ft.is_used = 0;
        ft.file_index = 0;
        fs.fat_blocks[i] = ft;
    }

    char* blank = (char*) calloc(DATA_SIZE, 16);
    for(i = 0; i < DATA_SIZE; i++) {
        DataBlock_t dt;
        memcpy(dt.data, blank, 16);
        fs.data_blocks[i] = dt;
    }

    SerializeFileSystem(buf, fs);
    open_disk(disk_name);

    for(i = 0; i < 64; i++) {
        block_write(i, buf + i*16);
    }

    close_disk();
    return 0;

}

int GetFD(OFT_t* oft, DirectoryBlock_t* dptr) {
    int i;
    for(i = 0; i < OFT_SIZE; i++) {
        if(oft->open[i] == 0) {
            oft->open[i] = 1;
            oft->dirptr[i] = dptr;
            oft->offset[i] = 0;
            return i;
        }
    }
    return -1;
}

int ClearFD(OFT_t* oft, uint8_t fd) {
    if(fd > 3) return -1;
    oft->open[fd] = 0;
    return fd;
}

void FileSystemOFTLS(){
    printf("--- OFT ---\n");
    int i;
    for(i = 0; i < OFT_SIZE; i++) {
        if(globals.oft.open[i])
            printf("fd: %d, open: %d, file: %s, offset: %d\n",
                i,
                globals.oft.open[i],
                globals.oft.dirptr[i]->filename,
                globals.oft.offset[i]);
    }
}

DirectoryBlock_t* LookupFD(OFT_t* oft, int filedes) {
    return oft->dirptr[filedes];
}

int mount_fs(char* disk_name) {
    char buf[1024];

    open_disk(disk_name);

    // Read in the entire disk
    int i;
    for(i = 0; i < 16; i++) {
        block_read(i, buf + i*16);
    }

    close_disk();

    // Load the file system from the buffer
    globals.fs = LoadFileSystem(buf);
    globals.isopen = 1;
    return 0;

}

int dismount_fs(char* disk_name) {
    char buf[1024];
    // serialize the filesystem
    SerializeFileSystem(buf, globals.fs);
    open_disk(disk_name);

    //write it to disk
    int i = 0;
    for(i = 0; i < 64; i++) {
        block_write(i, buf + i*16);
    }

    close_disk();
    globals.isopen = 0;
    return 0;
}

int fs_create(char* name) {
    //Create a pointer for the directory block to allocate
    DirectoryBlock_t* dtarget = NULL;
    int i;
    int fflag = 1;
    int dir_selected;
    debug_print(">>> FS_CREATE CALLED \n");

    debug_print("\tFitting file: %s \n", name);
    if(CountFiles(globals.fs) == 8){
        debug_print("\tFit failed; directory full");
        return -1;
        }

    for(i = 0; i < DIRECTORY_SIZE; i++) {
        if(strcmp(globals.fs.directory_blocks[i].filename, name) == 0){
           debug_print("\tFit failed; file already exists");
           return -1;
        }
        if(globals.fs.directory_blocks[i].is_used == 0 && fflag){
            dtarget = &globals.fs.directory_blocks[i];
            fflag = 0;
            dir_selected = i;
            debug_print("\tFound empty slot %d\n", i);
        }
    }
    
    if(fflag==1){
        debug_print("\tFit failed; directory full\n");
        return -1;
    }
    if(strlen(name) > 4)
        return -1;
    debug_print("\tTargeting directory %d\n", dir_selected);
    dtarget->is_used = 1;   
    dtarget->first_block_num = -1;
    dtarget->file_len = 0;
    memcpy(dtarget->filename, name, 5);
    return 0;

}

int fs_open(char* name) {
    int i;
    DirectoryBlock_t* db;
    int fflag = 0;
    for(i = 0; i < DIRECTORY_SIZE; i++) {
        db = &globals.fs.directory_blocks[i];
        if(strcmp(db->filename, name) == 0) {
            fflag = 1;
            break;
        }
    }

    if(fflag == 0) 
        return -1;

    int fd = GetFD(&globals.oft, db);
    if(fd == -1)
        return -1;
    return fd;
}

int fs_close(int filedes) {
    debug_print(">>> FS_CLOSE CALLED\n");
    DirectoryBlock_t* dr = LookupFD(&globals.oft, filedes);
    // dr->is_used = 0;

    debug_print("\tClosing file %s, (fd %d)...\n", dr->filename,filedes);
    
    int cstatus = ClearFD(&globals.oft, filedes);
    if(cstatus == -1)
        debug_print("\tfs_close failed; no file in OFT\n");
        return -1;


    return 0;

}

int fs_delete(char* name) {
    debug_print(">>> FS_DELETE CALLED\n");
    DirectoryBlock_t* dptr = NULL;
    int fflag = 0;

    int i;
    for(i = 0; i < OFT_SIZE; i++) {
        dptr = globals.oft.dirptr[i];
        if(globals.oft.open[i] == 0)
            continue;
        if(strcmp(dptr->filename, name) == 0) {
            debug_print("\tFile %s is already open\n", name);
            return -1;
        }
    }

    for(i = 0; i < DIRECTORY_SIZE; i++) {
        dptr = &globals.fs.directory_blocks[i];
        if(strcmp(dptr->filename, name) == 0){
            fflag = 1;
            break;
        }
    }

    if(fflag == 0) {
        debug_print("\tCouldn't find file %s", name);
        return -1;
    }

    debug_print("\tDeleting file %s...\n", name);
    dptr->is_used = 0;
    FatTableReturn_t ftr = LookupFATBlocks(&globals.fs, dptr);

    for(i = 0; i < ftr.nspaces; i++) {
        globals.fs.fat_blocks[ftr.spaces[i]].is_used = 0;
    }
    return 0;

}

int fs_write(int filedes, void* buf, size_t nbytes) {
    //TODO: Support file pointer
    debug_print(">>> FS_WRITE CALLED\n");
    
    FatTableReturn_t ftr;
    if(globals.oft.open[filedes] == 0){
        debug_print("\tFile not open\n");
        return -1;
    }
    DirectoryBlock_t* file_to_write = LookupFD(&globals.oft, filedes);
    // If this is an empty file
    if(file_to_write->file_len == 0) {
        int nblocks;

        if(nbytes > 512) {
            debug_print("\tFile too big (%d bytes)\n", nbytes);
        }

        nblocks = nbytes / 16 + 1;

        ftr = FindFATTableSpace(&globals.fs, nblocks);
        if(ftr.failed != 1)
            printf("\tFound %d blocks starting at block %d\n", nblocks, ftr.spaces[0]);
        else {
            debug_print("\tNo free space available!\n");
            return -1;
        }
        ReserveFATBlocks(&globals.fs, ftr, file_to_write);
        file_to_write->first_block_num = ftr.spaces[0];

        int bytes_left = nbytes;
        int idx = 0;
        while(bytes_left > 0) {
            int bytes_to_copy = 0;
            if(bytes_left >= 16)
                bytes_to_copy = 16;
            else
                bytes_to_copy = bytes_left;

            memcpy(&globals.fs.data_blocks[ftr.spaces[idx]], buf + idx*16, bytes_to_copy);
            idx += 1;
            bytes_left -= 16;
        }

        // Increment file pointer
        
        globals.oft.offset[filedes] += nbytes;
        file_to_write->file_len = nbytes;
        return nbytes;
    
    // If the file already exists
    } else {
        int existing_bytes = file_to_write->file_len;
        int current_offset = globals.oft.offset[filedes];
        FatTableReturn_t ftr = LookupFATBlocks(&globals.fs, file_to_write);
        // int fat_space_left = 

    }

    return 0;

}

