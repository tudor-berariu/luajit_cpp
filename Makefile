.phony: build main lib main_lib shlib main_shlib clean

CC := g++ -Wall -std=c++11

CWD := $(shell pwd)

SRC_DIR := src
SRC := $(wildcard $(SRC_DIR)/*)

CPP := $(wildcard $(SRC_DIR)/*.cpp)
MAIN_CPP := $(SRC_DIR)/main.cpp
AUX_SRC := $(filter-out $(MAIN_CPP),$(SRC))
AUX_CPP := $(filter-out $(MAIN_CPP),$(CPP))

LIB_DIR = lib
LIB_NAME = mylib
LIB = $(LIB_DIR)/lib$(LIB_NAME).a
SHLIB = $(LIB_DIR)/libsh$(LIB_NAME).so

OBJ_DIR = obj
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(AUX_CPP))

EXEC := main main_lib main_shlib

EXP_LUA_CPATH := export LUA_CPATH=$$LUA_CPATH";"$(CWD)"/"$(LIB_DIR)/?.so
EXP_LD_LIBRARY_PATH:=export LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:$(CWD)/$(LIB_DIR)/

build: $(EXEC)

main: $(SRC)
	$(CC) $(CPP) -o $@

main_lib: lib $(MAIN_CPP)
	$(CC) $(MAIN_CPP) -o $@ -l$(LIB_NAME) -L$(LIB_DIR)

main_shlib: shlib $(MAIN_CPP)
	$(CC) $(MAIN_CPP) -o $@ -lsh$(LIB_NAME) -L$(LIB_DIR)

lib: $(LIB)

$(LIB): $(OBJS)
	mkdir -p $(LIB_DIR)
	ar rc $@ $^

shlib: $(SHLIB)

$(SHLIB): $(OBJS)
	mkdir -p $(LIB_DIR)
	$(CC) -fPIC $^ -shared -o $@


$(OBJS): $(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(AUX_SRC)
	mkdir -p obj
	$(CC) -fPIC -c $< -o $@

test: shlib
	$(EXP_LUA_CPATH); $(EXP_LD_LIBRARY_PATH); th wrapper.lua

clean:
	rm -f $(EXEC)
	rm -f $(LIB_DIR)/*
	rm -f $(OBJ_DIR)/*
	find . -name "*~" -print0 | xargs -0 rm -f
