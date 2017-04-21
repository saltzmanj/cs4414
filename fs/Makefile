# Makefile for Project 4: filesystem
# 
# Jake Saltzman
# CS4414, Spring 2017

EXENAME = jfs

CXX = g++
CC = gcc

CXXFLAGS = -ggdb -std=c++98 -Wall
CFLAGS = -ggdb -std=c99 -Wall

CO = $(CC) $(CFLAGS) -c
CPPC = $(CXX) $(CXXFLAGS) -o $(EXENAME)
CPPO = $(CXX) $(CXXFLAGS) -c

SOURCE_DIR = src
O_DIR = ofiles

MAIN_FN = fileManager.cpp

default: $(SOURCE_DIR)/$(MAIN_FN) jfs.o disk.o
	$(CPPC) $(O_DIR)/*.o $(SOURCE_DIR)/$(MAIN_FN)
	@echo "JFS Compiled!"

jfs.o: $(SOURCE_DIR)/jfs.cpp $(SOURCE_DIR)/jfs.h
	$(CPPO) $(SOURCE_DIR)/jfs.cpp
	@mv *.o $(O_DIR)

disk.o: $(SOURCE_DIR)/disk.c $(SOURCE_DIR)/disk.h
	$(CO) $(SOURCE_DIR)/disk.c
	@mv *.o $(O_DIR)

clean:
	rm -f $(O_DIR)/*.*
	rm $(EXENAME)
