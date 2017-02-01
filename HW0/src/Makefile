# Makefile for Homework 0

CXXFLAGS = -std=c99 -o -g
CXX = gcc $(CXXFLAGS)
OFILES = @echo *.o


TARGETMOD0 = module0bin
MOD0DIR = module0

TARGETMOD1 = module1bin
MOD1DIR = module1

.SUFFIXES: .o .c

mod0: $(MOD0DIR)/module0.c
	$(CXX) $(MOD0DIR)/module0.c -o $(TARGETMOD0)
	@echo "Module 0 - I/O Compiled"

mod1: $(MOD1DIR)/module1.c
	$(CXX) $(MOD1DIR)/module1.c -o $(TARGETMOD1)
	@echo "Module 1 - Simple Calculator"

clean:
	-rm -f *.o $(TARGETMOD0)
	@echo "cleaned"
