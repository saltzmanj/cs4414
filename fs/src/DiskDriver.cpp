#include "DiskDriver.h"

/*==================================
=            DiskDriver            =
==================================*/

DiskDriver::DiskDriver() {

}

DiskDriver::~DiskDriver() {
	// close_disk();
}

int DiskDriver::MakeDisk(char* disk_name) {
	make_disk(disk_name);
}

int DiskDriver::WriteBlock(int block, char* buf) {
	// TODO: DiskDriver::WriteBlock 
	int r;
	r = block_read(block, buf);
	return r;
}

int DiskDriver::ReadBlock(int block, char* buf) {
	// TODO: DiskDriver::ReadBlock
	int r;
	r = block_write(block, buf);
	return r;
}
/*=====  End of DiskDriver  ======*/
