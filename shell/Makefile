# Jake Saltzman
# 28 February 2017
# Makefile for Shell

CXXFLAGS = -std=c99 -g 
CXX = gcc
OFILES = @echo *.o

CMDSRCDIR = src
TARGETBIN = jsh
TARGETBIN2 = spp

spp: $(CMDSRCDIR)/spp.c $(CMDSRCDIR)/*.*
	$(CXX) $(CXXFLAGS) $(CMDSRCDIR)/spp.c -o $(TARGETBIN2)
	@echo "SPP Compiled"

jsh: $(CMDSRCDIR)/main.o $(CMDSRCDIR)/jsh.c $(CMDSRCDIR)/*.*
	$(CXX) $(CXXFLAGS) $(CMDSRCDIR)/main.c $(CMDSRCDIR)/jsh.c -o $(TARGETBIN)
	@echo "JSH Compiled"



clean:
	-rm -f $(CMDSRCDIR)/*.o $(TARGETBIN)
	@echo "JSH Cleaned"

cleano:
	-rm -f $(CMDSRCDIR)/*.o
	@echo 'JSH - Ofiles Cleaned'