
DOTFILES=clang-format/.[0-9a-zA-Z_]* \
		 git/.[0-9a-zA-Z_]*

setup: $(DOTFILES)
	cp -r $^ $(HOME)
