# Jake Saltzman
# 16 March 2017
# Makefile for Quicksort
# 

CXXFLAGS = -std=c99 -pthread -g
CXX = gcc

SRC_DIR = src
TARGET_BIN = qsrt

qsrt: $(SRC_DIR)/*.*
	$(CXX) $(CXXFLAGS) $(SRC_DIR)/quicksort.c -o $(TARGET_BIN)
	@echo "Quicksort Compiled"

clean:
	-rm -f $(SRC_DIR)/*.o $(TARGET_BIN)
	@echo "Quicksort Cleaned!"