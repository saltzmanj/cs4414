# Makefile for the Pointer Quiz

CXXFLAGS = -g -Wall 
CXX = g++ $(CXXFLAGS)
OFILES = @echo *.o

TARGET = ptest.bin

.SUFFIXES: .o .cpp

$(TARGET): ptr_quiz.o main.cpp
	$(CXX) main.cpp ptr_quiz.o -o $(TARGET)
	$(OFILES)
	@echo "PointerTests Compiled"

ptr_quiz.o: ptr_quiz.cpp ptr_quiz.h
	$(CXX) -c ptr_quiz.cpp

clean:
	-rm *.o *.bin
	@echo "Cleaned"