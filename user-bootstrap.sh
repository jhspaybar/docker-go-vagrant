#!/usr/bin/env bash

# Add Go install to PATH
mkdir $HOME/go
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.profile
echo "export GOPATH=$HOME/go" >> $HOME/.profile

# Ensure Go is on PATH
source $HOME/.profile

# Install godep
go get github.com/tools/godep

# Create user workspace
mkdir -p $HOME/go/src/github.com/jhspaybar

# Setup vim with pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Add Solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

# Add NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# Add vim-go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# Add YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --gocode-completer

# Add pathogen setup to ~/.vimrc
cat >$HOME/.vimrc <<EOL
execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
EOL
