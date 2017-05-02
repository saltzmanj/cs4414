# Makefile for Project 4
# Jake Saltzman
# CS4414 - Spring 2017

CC = gcc
CFLAGS = -g -Wall -std=c99 -Wno-unused-variable 

BIN_NAME = fs
TEST_NAME = myapp

default: src/main.c fileManager.o disk.o
	$(CC) $(CFLAGS) -o $(BIN_NAME) src/main.c ofiles/*.o
	@echo "fs Compiled!"

testApp: src/myApp.c fileManager.o disk.o
	$(CC) $(CFLAGS) -o $(TEST_NAME) src/myApp.c ofiles/*.o

fileManager.o: src/fileManager.c src/fileManager.h
	$(CC) $(CFLAGS) -c src/fileManager.c
	@mv fileManager.o ofiles

disk.o: src/disk.c src/disk.h
	$(CC) $(CFLAGS) -c src/disk.c
	@mv disk.o ofiles
