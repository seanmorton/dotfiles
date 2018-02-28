#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/wincent/command-t
git clone https://github.com/mileszs/ack.vim
git clone https://github.com/vim-syntastic/syntastic
#git clone https://github.com/tpope/gem-browse
#git clone https://github.com/tpope/gem-ctags
git clone https://github.com/terryma/vim-smooth-scroll.git
git clone git://github.com/craigemery/vim-autotag.git
