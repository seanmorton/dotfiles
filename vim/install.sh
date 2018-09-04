#!/bin/bash

echo 'Installing pathogen & plugins..'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/yuttie/comfortable-motion.vim.git
git clone https://github.com/wincent/command-t.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/craigemery/vim-autotag.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/thoughtbot/vim-rspec.git
git clone https://github.com/othree/yajs.vim.git

echo 'Compiling command-t..'
cd command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
