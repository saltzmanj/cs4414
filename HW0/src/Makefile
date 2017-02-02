# Makefile for Homework 0

CXXFLAGS = -std=c99 -g -O
CXX = gcc $(CXXFLAGS)
OFILES = @echo *.o


TARGETMOD0 = module0bin
MOD0DIR = module0

TARGETMOD1 = module1bin
MOD1DIR = module1

TARGETMOD2 = module2bin
MOD2DIR = module2

TARGETMOD3 = module3bin
MOD3DIR = module3

.SUFFIXES: .o .c

mod0: $(MOD0DIR)/module0.c
	$(CXX) $(MOD0DIR)/module0.c -o $(TARGETMOD0)
	@echo "Module 0 - I/O - Compiled"

mod1: $(MOD1DIR)/module1.c
	$(CXX) $(MOD1DIR)/module1.c -o $(TARGETMOD1)
	@echo "Module 1 - Simple Calculator - Compiled"

mod2: $(MOD2DIR)/module2.c
	$(CXX) $(MOD2DIR)/module2.c -o $(TARGETMOD2)
	@echo "Module2 - Word Selector - Compiled"

mod3: $(MOD3DIR)/module3.c
	$(CXX) $(MOD3DIR)/module3.c -o $(TARGETMOD3)
	@echo "Module3 - Word Selector (Hard) - Compiled"

clean:
	-rm -f *.o $(TARGETMOD0) $(TARGETMOD1) $(TARGETMOD2)
	@echo "cleaned"
