# Makefile for building and running the C++ program

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17
LDFLAGS =

# Build directory (where compile_commands.json is located)
BUILDDIR = build

# Source file and executable
SRC = test.cpp
EXE = test

# Default target
all: $(EXE)

# Build target
$(EXE): $(BUILDDIR)/compile_commands.json
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $(SRC) $(shell sed -n 's/"file": "\(.*\)",/\1/p' $(BUILDDIR)/compile_commands.json)

# Run target
run: $(EXE)
	./build/$(EXE)

# Clean target
clean:
	rm -f ./build/$(EXE)

.PHONY: all run clean

