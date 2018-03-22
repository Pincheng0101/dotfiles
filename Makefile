
DOTFILES=clang-format/.[0-9a-zA-Z_]* \
		 git/.[0-9a-zA-Z_]*

UNAME=$(shell uname)
ifeq ($(UNAME), Linux)
	DIST=$(shell cat /etc/issue | awk '{print $$1}')
else
ifeq ($(UNAME), Darwin)
	DIST=Darwin
endif
endif

all: dotfiles $(DIST)

dotfiles: $(DOTFILES)
	mkdir -p ~/.bin
	cp -r $^ $(HOME)

# install clang-formt
Ubuntu:
	curl http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz > clang-format.tar.xz
	tar Jxf clang-format.tar.xz
	mv clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang-format ~/.bin/
Darwin:
	curl http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-apple-darwin.tar.xz > clang-format.tar.xz
	tar Jxf clang-format.tar.xz
	mv clang+llvm-6.0.0-x86_64-apple-darwin/bin/clang-format ~/.bin/
