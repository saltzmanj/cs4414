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
    fblock.is_used = (int) src[0];
    fblock.file_index = (int) src[1];
    // memcpy(&fblock.is_used, src, 1);
    // memcpy(&fblock.file_index, src+1, 2);
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

    // sb.dir_start_byte = 0;
    // sb.dir_end_byte = 8;
    // sb.fat_start_byte = 9;
    // sb.fat_end_byte = 16;
    // sb.data_start_byte = 32;
    // sb.data_end_byte = 63;

    if(fs.super_block.dir_start_byte    != 0 ||
       fs.super_block.dir_end_byte      != 8 ||
       fs.super_block.fat_start_byte    != 9 ||
       fs.super_block.fat_end_byte      != 16 ||
       fs.super_block.data_start_byte   != 32 ||
       fs.super_block.data_end_byte     != 63 ) {

        debug_print("Error: not a valid filesystem\n");
        globals.isvalid = 0;
    }

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
        fb = LoadFATBlock(src+offset+i*4);
        fs.fat_blocks[i] = fb;
    }

    for(i = 0; i < DATA_SIZE; i++) {
        int offset = 512;
        DataBlock_t dtb;
        dtb = LoadDataBlock(src+offset+i*16);
        fs.data_blocks[i] = dtb;
    }
    globals.isvalid = 1;
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

    if(space_wanted > 512) {
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
        if(ftable[i].file_index == file_index && ftable[i].is_used == 1){
            ftr.spaces[idx] = i;
            idx += 1;
            ftr.nspaces += 1;
        }
    }

    return ftr;
}

int GetFD(OFT_t* oft, DirectoryBlock_t* dptr) {
    int i;
    for(i = 0; i < OFT_SIZE; i++) {
        if(oft->dirptr[i] == dptr && oft->open[i] == 1)
            return -1;
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

void FileSystemPrintFAT() {
    printf("%s\n", "--- FAT ---");
    printf("%s\n","Block\tUsed?\tFile");
    int i;
    for(i = 0; i < FAT_SIZE; i++) {
        char strbuf[8] = "-";

        if(globals.fs.fat_blocks[i].is_used == 1) {
            sprintf(strbuf, "%d", globals.fs.fat_blocks[i].file_index);
        }
        printf("%d \t| %d \t| %s\n",
            i,
            globals.fs.fat_blocks[i].is_used,
            strbuf);
    }
}

/*==========================================
=            Core Functionality            =
==========================================*/


int make_fs(char* disk_name) {
    debug_print(">>> FS_MAKE CALLED\n");
    if(strlen(disk_name) > 4) {
        debug_print("Disk name %s too long\n", disk_name);
        return -1;
    }

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
        ft.file_index = -1;
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
    if(globals.isvalid == 0) {
        return -1;
    }
    for( i = 0; i < OFT_SIZE; i++) {
        globals.oft.open[i] = 0;
        globals.oft.dirptr[i] = NULL;
    }
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
        debug_print("\tFit failed; directory full\n");
        return -1;
        }

    for(i = 0; i < DIRECTORY_SIZE; i++) {
        if(strcmp(globals.fs.directory_blocks[i].filename, name) == 0){
           debug_print("\tFit failed; file already exists\n");
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
    if(filedes < 0 || filedes > 5)
        return -1;
    if(globals.oft.open[filedes] != 1) {
        return -1;
    }
    DirectoryBlock_t* dr = LookupFD(&globals.oft, filedes);
    // dr->is_used = 0;

    debug_print("\tClosing file %s, (fd %d)...\n", dr->filename,filedes);
    
    int cstatus = ClearFD(&globals.oft, filedes);
    if(cstatus == -1){
        debug_print("\tfs_close failed; no file in OFT\n");
        return -1;
    }

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
    strcpy(dptr->filename, "");
    FatTableReturn_t ftr = LookupFATBlocks(&globals.fs, dptr);

    for(i = 0; i < ftr.nspaces; i++) {
        globals.fs.fat_blocks[ftr.spaces[i]].is_used = 0;
        globals.fs.fat_blocks[ftr.spaces[i]].file_index = -1;
    }
    return 0;

}

int fs_write(int filedes, void* buf, size_t nbytes) {
    //TODO: Support file pointer
    debug_print(">>> FS_WRITE CALLED on filedes %d\n", filedes);
    
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
            debug_print("\tFile too big (%d bytes)\n", (int) nbytes);
            return -1;
        }

        nblocks = nbytes / 16 + 1;

        ftr = FindFATTableSpace(&globals.fs, nblocks);
        if(ftr.failed != 1)
            debug_print("\tFound %d blocks starting at block %d\n", nblocks, ftr.spaces[0]);
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

            int i;
            debug_print("\tWriting to block %d\n", ftr.spaces[idx]);
            for(i = 0; i < bytes_to_copy; i++) {
                globals.fs.data_blocks[ftr.spaces[idx]].data[i] = ((char*) buf)[i + idx*16];
            }
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

        int fat_space_taken = file_to_write->file_len % 16;
        int fat_space_left = 16 - fat_space_taken;
        int new_space = nbytes - fat_space_left;

        int i;
        for(i = 0; i < min_(nbytes, fat_space_left); i++) {
            globals.fs.data_blocks[ftr.spaces[ftr.nspaces - 1]].data[i + fat_space_taken] = ((char*) buf)[i];
        }

        globals.oft.offset[filedes] += min_(nbytes, fat_space_left);
        file_to_write->file_len += min_(nbytes, fat_space_left);
        if(nbytes > fat_space_left) {
            int nblocks = new_space / 16 + 1;
            ftr = FindFATTableSpace(&globals.fs, nblocks);

            if(ftr.failed) {
                debug_print("Not enough space left!");
                return -1;
            }

            ReserveFATBlocks(&globals.fs, ftr, file_to_write);

            int bytes_left = new_space;
            int idx = 0;
            while(bytes_left > 0) {
                int bytes_to_copy = 0;
                if(bytes_left >= 16)
                    bytes_to_copy = 16;
                else
                    bytes_to_copy = bytes_left;

                int i;
                for(i = 0; i < bytes_to_copy; i++) {
                    globals.fs.data_blocks[ftr.spaces[idx]].data[i] = ((char*) buf)[i + idx*16 + fat_space_left];
                }
                bytes_left -= 16;
                idx += 1;
            }
            globals.oft.offset[filedes] += new_space; 
            file_to_write->file_len += new_space;
            return nbytes; 
        }
    }
    return 0;
}

int fs_read(int fildes, void *buf, size_t nbytes) {
    //TODO: read w/ proper offset
    debug_print(">>> FS_READ CALLED on filedes %d\n", fildes);
    if(globals.oft.open[fildes] == 0) {
        debug_print("\tFile %d is not open!\n", fildes);
        return -1;
    }


    DirectoryBlock_t* file_to_read = LookupFD(&globals.oft, fildes);
    FatTableReturn_t ftr = LookupFATBlocks(&globals.fs, file_to_read);

    int i;
    int bytes_read = 0;

    if(globals.oft.offset[fildes] >= file_to_read->file_len) {
        debug_print("\tFile pointer is at end of file\n");
        return 0;
    } 
    if(nbytes + globals.oft.offset[fildes] > file_to_read->file_len) {
        nbytes = file_to_read->file_len - globals.oft.offset[fildes];
        debug_print("\tLength past offset, shortening to %d bytes",(int) nbytes);
    } else if(nbytes > file_to_read->file_len){
        debug_print("\tLength to read to long, shortening to %d bytes\n", file_to_read->file_len);
        nbytes = file_to_read->file_len;
    }

    int blocks_to_skip = globals.oft.offset[fildes] / 16;
    int bytes_to_skip = globals.oft.offset[fildes] % 16;

    debug_print("\tSkipping %d blocks and %d bytes\n", blocks_to_skip, bytes_to_skip );

    int bytes_left = nbytes;
    int blocks = 0;
    int bytecount = 0;
    int first = 1;
    int os = 0;

    for(i = 0; i < ftr.nspaces; i++) {
        int k;
        int block_to_read = ftr.spaces[i];
        debug_print("\tReading from block %d\n", block_to_read);
        char* blkpointer = (char *) &globals.fs.data_blocks[block_to_read];
        if(blocks < blocks_to_skip){
            blocks++;
            continue;
        }
        for( k = 0 ; k < 16; k++) {
            bytecount += 1;
            if(bytecount > bytes_to_skip && bytes_left > 0) {
                ((char*) buf)[os] = blkpointer[k];
                os += 1;
                bytes_left -= 1;
                bytes_read += 1;
            }
        }
    }
    globals.oft.offset[fildes] += bytes_read;
    return bytes_read;

}

int fs_get_filesize(int fildes) {
    debug_print(">>> FS_GET_FILESIZE CALLED\n");
    if(fildes < 0 || fildes > 3)
        return -1;
    if(globals.oft.open[fildes] == 0) {
        debug_print("\tFile %d is not open!\n", fildes);
        return -1;
    }
    DirectoryBlock_t* file_to_size = LookupFD(&globals.oft, fildes);
    return file_to_size->file_len;
}

int fs_lseek(int fildes, off_t offset) {
    debug_print(">>> FS_LSEEK CALLED\n");
    if(globals.oft.open[fildes] == 0) {
        debug_print("\tFile %d is not open!\n", fildes);
        return -1;
    }

    int current_offset = globals.oft.offset[fildes];
    DirectoryBlock_t* current_file = LookupFD(&globals.oft, fildes);

    int new_os = current_offset + (int) offset;
    
    if(new_os < 0){
        debug_print("Error: offset %d is negative\n", new_os);
        return -1;
    }
    if(new_os > current_file->file_len){
        debug_print("Error: offset %d is too large for file size\n", new_os);
        return -1;
    }

    globals.oft.offset[fildes] = new_os;
    return 0;
}

int CalculateBlocksToShorten(int old_len, int new_len) {
    int count = 0;
    int i;
    for(i = old_len; i > 0; i--) {
        if(i%16 == 0)
            count++;
    }
    return count;
}

int fs_truncate(int fildes, off_t length) {
    debug_print(">>> FS_TRUNCATE CALLED\n");
    if(globals.oft.open[fildes] == 0) {
        debug_print("\tFile %d is not open!\n", fildes);
        return -1;
    }
    if(length < 0) {
        debug_print("\tCannot shorted file by a negative number\n");
        return -1;
    }

    DirectoryBlock_t* file_to_trunc = LookupFD(&globals.oft, fildes);
    FatTableReturn_t ftr = LookupFATBlocks(&globals.fs, file_to_trunc);
    
    int flen_current = file_to_trunc->file_len; 
    int len_to_shorten = flen_current - length;

    int hanging_bytes = flen_current % 16;

    globals.oft.offset[fildes] = 0;
    if(hanging_bytes > len_to_shorten) {
        file_to_trunc->file_len -= len_to_shorten;
        globals.oft.offset[fildes] = 0;
        return 0;
    } else if(length == 0) {
        file_to_trunc->file_len = 0;
        int i;
        for(i = 0; i < ftr.nspaces; i++) {
            FATBlock_t* fb = &globals.fs.fat_blocks[ftr.spaces[i]];
            fb->is_used = 0;
        }
        globals.oft.offset[fildes] = 0;
        return 0;
    } else {
        int n_del_blocks = CalculateBlocksToShorten(flen_current, length);
        int i;
        for(i = ftr.nspaces - 1; i >= ftr.nspaces - n_del_blocks; i--) {
            FATBlock_t* fb = &globals.fs.fat_blocks[ftr.spaces[i]];
            fb->is_used = 0;
        }
        file_to_trunc->file_len = length;
        globals.oft.offset[fildes] = 0;
        return 0;
    }
    return -1;
}

/*=====  End of Core Functionality  ======*/