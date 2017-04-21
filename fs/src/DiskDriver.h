#ifndef __DISK_DRIVER_H_
#define __DISK_DRIVER_H_

#include <string>
#include <cstring>

// extern "C" {
	#include "disk.h"
// }

using namespace std;

class DiskDriver {
public:
	DiskDriver();
	~DiskDriver();
	int WriteBlock(int block, char* buf);
	int ReadBlock(int block, char* buf);
	int MakeDisk(char* disk_name);
private:

};

#endif