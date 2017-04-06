# Makefile for project 3
# Jacob Saltzman (jss7kj)
# April 18th, 2017


EXENAME = mmu

CXX = g++

CFLAGS = -g -o $(EXENAME)
OFLAGS = -Wall -c 

CC = $(CXX) $(CFLAGS)
CO = $(CXX) $(OFLAGS)

SOURCE_DIR = src

OFILES = $(SOURCE_DIR)/*.o

default: $(OFILES)
	$(CC) $(OFILES)


memory.o: $(SOURCE_DIR)/memory.cpp $(SOURCE_DIR)/memory.h
	$(CO) $(SOURCE_DIR)/memory.cpp

