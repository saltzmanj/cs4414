# Jake Saltzman
# 28 February 2017
# Makefile for Shell

CXXFLAGS = -std=c99 -g
CXX = gcc
OFILES = @echo *.o

CMDSRCDIR = src
TARGETBIN2 = spp

spp: $(CMDSRCDIR)/spp.c $(CMDSRCDIR)/*.*
	$(CXX) $(CXXFLAGS) $(CMDSRCDIR)/spp.c -o $(TARGETBIN2)
	@echo "SPP Compiled"

clean:
	-rm -f $(CMDSRCDIR)/*.o $(TARGETBIN2)
	@echo "SPP Cleaned"

cleano:
	-rm -f $(CMDSRCDIR)/*.o
	@echo 'SPP - Ofiles Cleaned'