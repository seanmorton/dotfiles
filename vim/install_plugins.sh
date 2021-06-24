echo 'Installing Vim pathogen & plugins..'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle

git clone https://github.com/5outh/yesod-routes.vim.git
git clone https://github.com/LnL7/vim-nix.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/neovimhaskell/haskell-vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/seanmorton/vim-tomorrow-night-eighties.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/yuttie/comfortable-motion.vim.git

# Previously used and worth keeping for reference
# git clone https://github.com/mileszs/ack.vim.git
# git clone https://github.com/craigemery/vim-autotag.git
# git clone https://github.com/thoughtbot/vim-rspec.git
# git clone https://github.com/othree/yajs.vim.git
