.PHONY: all build clean run build-macos build-windows build-linux build-macos-arm64 build-windows-arm64 build-linux-arm64
default: build

# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=adbinit
BINARY_LOCAL=./dist/$(BINARY_NAME)
BINARY_UNIX=./dist/$(BINARY_NAME)_linux_amd64
BINARY_UNIX_ARM64=./dist/$(BINARY_NAME)_linux_arm64
BINARY_DARWIN=./dist/$(BINARY_NAME)_darwin_amd64
BINARY_DARWIN_ARM64=./dist/$(BINARY_NAME)_darwin_arm64
BINARY_WINDOWS=./dist/$(BINARY_NAME)_windows_amd64
BINARY_WINDOWS_ARM64=./dist/$(BINARY_NAME)_windows_arm64

all: build build-macos build-windows build-linux build-macos-arm64 build-windows-arm64 build-linux-arm64

build: 
	$(GOBUILD) -o $(BINARY_LOCAL) -v

build-macos:
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_DARWIN) -v

build-windows:
	GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_WINDOWS) -v

build-linux:
	GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v

build-macos-arm64:
	GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_DARWIN_ARM64) -v

build-windows-arm64:
	GOOS=windows GOARCH=arm64 $(GOBUILD) -o $(BINARY_WINDOWS_ARM64) -v

build-linux-arm64:
	GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_UNIX_ARM64) -v

clean: 
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_LOCAL)
	rm -f $(BINARY_UNIX)
	rm -f $(BINARY_UNIX_ARM64)
	rm -f $(BINARY_DARWIN)
	rm -f $(BINARY_DARWIN_ARM64)
	rm -f $(BINARY_WINDOWS)
	rm -f $(BINARY_WINDOWS_ARM64)

run: build
	./$(BINARY_LOCAL)

test: 
	$(GOTEST) -v ./...

deps:
	$(GOGET) -v ./...