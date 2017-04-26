# Makefile for Project 4
# Jake Saltzman
# CS4414 - Spring 2017

CC = gcc
CFLAGS = -g -Wall -std=c99

BIN_NAME = fs

default: src/main.c fileManager.o disk.o
	$(CC) $(CFLAGS) -o $(BIN_NAME) src/main.c ofiles/*.o
	@echo "fs Compiled!"

fileManager.o: src/fileManager.c src/fileManager.h
	$(CC) $(CFLAGS) -c src/fileManager.c
	@mv fileManager.o ofiles

disk.o: src/disk.c src/disk.h
	$(CC) $(CFLAGS) -c src/disk.c
	@mv disk.o ofiles
