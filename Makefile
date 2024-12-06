.PHONY: all build clean run

# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=adb-init
BINARY_UNIX=$(BINARY_NAME)_unix

all: build

build: 
	$(GOBUILD) -o $(BINARY_NAME) -v

clean: 
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_UNIX)

run: build
	./$(BINARY_NAME)

test: 
	$(GOTEST) -v ./...

deps:
	$(GOGET) -v ./...