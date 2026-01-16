QUARK_ROOT ?= quark
QK_FLAGS := -l $(QUARK_ROOT) -i unistd.h
TEST_DIR = testing
OUT = $(TEST_DIR)/main

test: build-test
	./$(TEST_DIR)/main

build-test:
	qc $(TEST_DIR)/main.qk -o $(TEST_DIR)/main.c $(QK_FLAGS)
	$(CC) $(TEST_DIR)/main.c -o $(OUT)
