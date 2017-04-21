#include "jfs.h"

/*==================================
=            DiskDriver            =
==================================*/

DiskDriver::DiskDriver(string diskfname) {
	this.disk_name = diskfname;
	make_disk(this.diskname.c_str())
}

DiskDriver::~DiskDriver() {
	close_disk();
}

int DiskDriver::WriteBlock(int block, char* buf) {
	// TODO: DiskDriver::WriteBlock 
	int r;
	r = block_read(block, buf)
	return r;
}

int DiskDriver::ReadBlock(int block, char* buf) {
	// TODO: DiskDriver::ReadBlock
	int r;
	r = block_write(block, buf);
	return r;
}
/*=====  End of DiskDriver  ======*/
