# Makefile for Project 4: filesystem
# 
# Jake Saltzman
# CS4414, Spring 2017

EXENAME = jfs

CXX = g++
CC = gcc

CXXFLAGS = -ggdb -std=c++98 -Wno-write-strings

CPPC = $(CXX) $(CXXFLAGS) -o $(EXENAME)
CPPO = $(CXX) $(CXXFLAGS) -c

SOURCE_DIR = src
O_DIR = ofiles

MAIN_FN = main.c
TEST_FN = test.cpp

default: $(SOURCE_DIR)/$(MAIN_FN) DiskDriver.o disk.o fileManager.o FileSystem.o
	$(CPPC) $(O_DIR)/*.o $(SOURCE_DIR)/$(MAIN_FN)
	@echo "JFS Compiled!"

fsmanager: $(SOURCE_DIR)/$(TEST_FN) DiskDriver.o disk.o fileManager.o FileSystem.o fstypes.o
	$(CPPC) $(O_DIR)/*.o $(SOURCE_DIR)/$(TEST_FN)
	@echo "JFS - Test Compiled!"

DiskDriver.o: $(SOURCE_DIR)/DiskDriver.cpp $(SOURCE_DIR)/DiskDriver.h disk.o
	$(CPPO) $(SOURCE_DIR)/DiskDriver.cpp
	@mv DiskDriver.o $(O_DIR)

FileSystem.o: $(SOURCE_DIR)/FileSystem.h $(SOURCE_DIR)/FileSystem.cpp DiskDriver.o
	$(CPPO) $(SOURCE_DIR)/FileSystem.cpp
	@mv FileSystem.o $(O_DIR)

disk.o: $(SOURCE_DIR)/disk.c $(SOURCE_DIR)/disk.h
	$(CPPO) $(SOURCE_DIR)/disk.c
	@mv disk.o $(O_DIR)

fileManager.o: $(SOURCE_DIR)/fileManager.h $(SOURCE_DIR)/fileManager.cpp FileSystem.o
	$(CPPO) $(SOURCE_DIR)/fileManager.cpp
	@mv fileManager.o $(O_DIR)

fstypes.o: $(SOURCE_DIR)/fstypes.h $(SOURCE_DIR)/fstypes.cpp
	$(CPPO) $(SOURCE_DIR)/fstypes.cpp
	@mv fstypes.o $(O_DIR)

clean:
	rm -f $(O_DIR)/*.*
	rm -f $(EXENAME)
