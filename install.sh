#!/bin/bash

# Check if homebrew is installed
brew --version 2>&1 >/dev/null

BREW_IS_AVAILABLE=$?

if [[ $BREW_IS_AVAILABLE -neq 0 ]]
then
	echo "Homebrew is needed in order to run this script"
	exit 1;
fi

# Install brew dependencies
brew install --HEAD tree-sitter luajit neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

exit 0;
