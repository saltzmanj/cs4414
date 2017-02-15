# Jake Saltzman
# 28 February 2017
# Makefile for Shell

CXXFLAGS = -std=c99 -g -O2
CXX = gcc
OFILES = @echo *.o

CMDSRCDIR = src
TARGETBIN = jsh

jsh: $(CMDSRCDIR)/main.o $(CMDSRCDIR)/jsh.o
	$(CXX) $(CXXFLAGS) $(CMDSRCDIR)/main.c $(CMDSRCDIR)/jsh.c -o $(TARGETBIN)
	@echo "JSH Compiled"


clean:
	-rm -f $(CMDSRCDIR)/*.o $(TARGETBIN)
	@echo "JSH Cleaned"

cleano:
	-rm -f $(CMDSRCDIR)/*.o
	@echo 'JSH - Ofiles Cleaned'