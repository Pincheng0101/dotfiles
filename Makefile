
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

define install_clang-format
	curl -O http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-$(1).tar.xz
	tar Jxf clang+llvm-6.0.0-$(1).tar.xz
	cp clang+llvm-6.0.0-$(1)/bin/clang-format ~/.bin/
endef

all: dotfiles $(DIST)

dotfiles: $(DOTFILES)
	mkdir -p ~/.bin
	cp -r $^ $(HOME)

# install clang-format
Ubuntu:
	$(call install_clang-format,x86_64-linux-gnu-ubuntu-14.04)
Darwin:
	$(call install_clang-format,x86_64-apple-darwin)
