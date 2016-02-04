" Config
set nocompatible      " Use vim rather than vi settings
set autoread          " Reload externally edited files
set pastetoggle=<F10> " Enable past insert mode with F10

" Appearance
syntax on             " Enable syntax highlighting
set linebreak         " Wrap at convenient points
set ruler             " Show row,column numbers

" Searching
set hlsearch          " Highlight search results
set ignorecase        " Ignore case while searching
set smartcase         " Unless capital letter specified

" Indentation
set autoindent        " Indent to same level of previous line
set smartindent       " Add indents to nested statements
set smarttab          " Handle tabs at beginning of lines better
set expandtab         " Use spaces instead of tabs
set tabstop=2         " Width of a tab
set softtabstop=2     " Width of tab when in insert mode
set shiftwidth=2      " Width for auto tab operations

" Remappings
nnoremap <CR> :noh<CR><CR>

" Tab spacing conversion
function ConvertTabWidth(OrigWidth, NewWidth)
  set ts=OrigWidth sts=OrigWidth noet
  retab!
  set ts=NewWidth sts=NewWidth et
  retab
endfunction
command T call ConvertTabWidth(4,2)
command F call ConvertTabWidth(2,4)

if has("autocmd")

  " Tab settings for Makefiles
  autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

endif

" Pathogen plugin manager
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

  " Hybrid colorscheme
  " https://github.com/w0ng/vim-hybrid
  let g:hybrid_use_Xresources = 1
  colorscheme hybrid

  " NERDTree file browser
  " https://github.com/scrooloose/nerdtree
  map <C-b> :NERDTreeToggle<CR>

  " Smooth Scroll
  " https://github.com/terryma/vim-smooth-scroll
  noremap <silent> <c-k> :call smooth_scroll#up(orig_width, 20, 1)<CR>
  noremap <silent> <c-j> :call smooth_scroll#down(orig_width, 20, 1)<CR>

  " Taboo tab renaming
  " https://github.com/gcmt/taboo.vim.git
  set sessionoptions+=tabpages,globals

  " Vim session management
  " https://github.com/xolox/vim-session.git
  let g:session_autosave = 'no'

