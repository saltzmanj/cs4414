# Makefile for project 3
# Jacob Saltzman (jss7kj)
# April 18th, 2017


EXENAME = mmu

CXX = g++

CFLAGS = -ggdb -std=c++98 -o $(EXENAME)
OFLAGS = -ggdb -Wall -c

CC = $(CXX) $(CFLAGS)
CO = $(CXX) $(OFLAGS)

SOURCE_DIR = src
MAIN_FN = main.cpp


default: $(SOURCE_DIR)/$(MAIN_FN) memory.o
	$(CC) memory.o $(SOURCE_DIR)/$(MAIN_FN)
	@echo "Project 3 Built: Run as './mmu' "

memory.o: $(SOURCE_DIR)/memory.cpp $(SOURCE_DIR)/memory.h
	$(CO) $(SOURCE_DIR)/memory.cpp

clean: 
	rm ./mmu
	rm memory.o
	@echo "Cleaned!"