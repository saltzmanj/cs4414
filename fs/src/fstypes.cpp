#include "fstypes.h"

void SerializeAddressBlock(AddressBlock_t addrblock, char* dest) 
{
	memcpy(dest, &addrblock.directory_addr, 4);
	memcpy(dest+4, &addrblock.fat_addr, 4);
	memcpy(dest+8, &addrblock.data_addr, 4);
	memcpy(dest+12, &addrblock.unused_addr, 4);	
}

void SerializeDirectoryBlock(DirectoryBlock_t dirblock, char* dest)
{
	memcpy(dest, &dirblock.isUsed, 1);
	memcpy(dest+1, &dirblock.first_block_num, 2);
	memcpy(dest+3, &dirblock.file_name, 4);
	memcpy(dest+7, &dirblock.file_len, 3);
	memcpy(dest+10, &dirblock.unused, 6);

}

void SerializeFATBlock(FATBlock_t fatblock, char* dest) {
	memcpy(dest, &fatblock.isUsed, 1);
	memcpy(dest+1, &fatblock.blocknum, 3);
}