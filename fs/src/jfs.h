#ifndef __JFS_H_
#define __JFS_H_

#include "disk.h"
#include <string>

using namespace std;

class DiskDriver {
public:
	DiskDriver(string diskfname);
	int WriteBlock(int block, char* buf);
	int ReadBlock(int block, char* buf);
private:
	string disk_name;

};

#endif