echo 'Installing Vim pathogen & plugins..'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle

git clone https://github.com/charlespascoe/vim-go-syntax.git
git clone https://github.com/hashivim/vim-terraform.git
git clone https://github.com/joerdav/templ.vim.git
git clone https://github.com/junegunn/fzf
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/ledger/vim-ledger.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/uiiaoo/java-syntax.vim
git clone https://github.com/w0rp/ale.git
git clone https://github.com/yuttie/comfortable-motion.vim.git
