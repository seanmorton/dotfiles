#!/bin/bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/w0ng/vim-hybrid.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/wesQ3/vim-windowswap.git
git clone https://github.com/gcmt/taboo.vim.git
git clone https://github.com/xolox/vim-session.git
git clone https://github.com/terryma/vim-smooth-scroll.git
