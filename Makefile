
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

define install_git-lfs
	curl -O -L https://github.com/git-lfs/git-lfs/releases/download/v2.4.0/git-lfs-$(1)-2.4.0.tar.gz
	tar zxf git-lfs-$(1)-2.4.0.tar.gz
	cp git-lfs-2.4.0/git-lfs ~/.bin/
endef

all: dotfiles $(DIST)

dotfiles: $(DOTFILES)
	mkdir -p ~/.bin
	cp -r $^ $(HOME)

# install clang-format, git-lfs
Ubuntu:
	$(call install_clang-format,x86_64-linux-gnu-ubuntu-14.04)
	$(call install_git-lfs,linux-amd64)
Darwin:
	$(call install_clang-format,x86_64-apple-darwin)
	$(call install_git-lfs,darwin-amd64)

CLEAN_FILES=$(shell echo $(DOTFILES) | sed 's/git\//~\//g' | sed 's/clang-format\//~\//g')
clean:
	rm -r $(CLEAN_FILES) ~/.bin
