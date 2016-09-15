" Config
set nocompatible            " Use vim rather than vi settings
set autoread                " Reload externally edited files
set pastetoggle=<F10>       " Enable past insert mode with F10
set encoding=utf-8          " For the wurldz
set scrolloff=5             " Display at least 5 lines above and below the cursor
set spell spelllang=en_us   " Enable spell checking for English 

" Appearance
syntax on             " Enable syntax highlighting
set linebreak         " Wrap at convenient points
set ruler             " Show row,column numbers
set number            " Line numbers

" Searching
set hlsearch          " Highlight search results
set ignorecase        " Ignore case while searching
set smartcase         " Unless capital letter specified

" Indentation
set autoindent        " Indent to same level of previous line
set smartindent       " Add indents to nested statements
set smarttab          " Handle tabs at beginning of lines better
set expandtab         " Use spaces instead of tabs
set tabstop=4         " Width of a tab
set softtabstop=4     " Width of tab when in insert mode
set shiftwidth=4      " Width for auto tab operations

set t_ut=             " Disable background color erase for tmux/screen

" Folding
set foldenable
set foldmethod=indent
set foldlevelstart=2
set foldnestmax=2


" Remappings
nnoremap <CR> :noh<CR><CR> 
nnoremap <Space> za
map Y y$

" [ctags] open definition vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>  

colorscheme Tomorrow-Night-Eighties

if has("autocmd")

  " Tab settings for Makefiles
  autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Remove trailing whitespace
  " autocmd BufWritePre * :%s/\s\+$//e

endif

function! s:PrettyJSON()
  %!jq .
    set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" CtrlP
  set runtimepath^=~/.vim/bundle/ctrlp.vim
  let g:ctrlp_map = '<c-p>'
  let g:cntrlp_working_path_mode = 'ra'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Pathogen plugin manager
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

  " NERDTree file browser
  " https://github.com/scrooloose/nerdtree
  map <C-b> :NERDTreeToggle<CR>

  " Syntastic syntax checker
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_auto_jump = 1
  let g:syntastic_javascript_checkers = ["eslint"]

  " Smooth Scroll
  " https://github.com/terryma/vim-smooth-scroll
  noremap <silent> <c-k> :call smooth_scroll#up(10, 5, 1)<CR>
  noremap <silent> <c-j> :call smooth_scroll#down(10, 5, 1)<CR>

  " Taboo tab renaming
  " https://github.com/gcmt/taboo.vim.git
  set sessionoptions+=tabpages,globals

  " Vim session management
  " https://github.com/xolox/vim-session.git
  let g:session_autosave = 'no'
