#ifndef __MEMORY_H_
#define __MEMORY_H_

using namespace std;

class PhysicalMemory {

public:
	PhysicalMemory(int ws, int fs); // Constructor
	bool WriteValue(int addr, int data);
	bool isFull();

private:
	static const int n_frames = 8;
	static const int frame_size = 256;
	char memory[n_frames][frame_size];
};	


#endif