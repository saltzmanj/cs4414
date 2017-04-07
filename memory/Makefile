# Makefile for project 3
# Jacob Saltzman (jss7kj)
# April 18th, 2017


EXENAME = mmu

CXX = g++

CFLAGS = -g -std=c++98 -o $(EXENAME)
OFLAGS = -Wall -c 

CC = $(CXX) $(CFLAGS)
CO = $(CXX) $(OFLAGS)

SOURCE_DIR = src
MAIN_FN = main.cpp

OFILES = $(SOURCE_DIR)/*.o

default: $(SOURCE_DIR)/$(MAIN_FN) $(OFILES)
	$(CC) $(OFILES) $(SOURCE_DIR)/$(MAIN_FN)

memory.o: $(SOURCE_DIR)/memory.cpp $(SOURCE_DIR)/memory.h
	$(CO) $(SOURCE_DIR)/memory.cpp

