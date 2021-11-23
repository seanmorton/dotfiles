" Config
set nocompatible                    " Use vim rather than vi settings
set autoread                        " Reload externally edited files
set pastetoggle=<F10>               " Enable past insert mode with F10
set encoding=utf-8                  " For the wurldz
set scrolloff=5                     " Display at least 5 lines above and below the cursor
set t_ut=                           " Disable background color erase for tmux/screen

" Appearance
syntax on                           " Enable syntax highlighting
set linebreak                       " Wrap at convenient points
set ruler                           " Show row,column numbers
set number relativenumber           " 'Hybrid' line numbers

" Searching
set hlsearch                        " Highlight search results
set ignorecase                      " Ignore case while searching
set smartcase                       " Unless capital letter specified

" Indentation
set autoindent                      " Indent to same level of previous line
set smartindent                     " Add indents to nested statements
set smarttab                        " Handle tabs at beginning of lines better
set expandtab                       " Use spaces instead of tabs
set tabstop=2                       " Width of a tab
set softtabstop=2                   " Width of tab when in insert mode
set shiftwidth=2                    " Width for auto tab operations

" Configure FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '20%' }
let g:fzf_colors =
  \ { 'hl':       ['fg', 'fzfHighlight'],
    \ 'hl+':      ['fg', 'fzfHighlight'],
    \ 'fg+':      ['fg', 'fzfCurrLine'],
    \ 'bg+':      ['bg', 'fzfCurrLine'],
    \ 'pointer':  ['fg', 'fzfPointer'],
    \ 'spinner':  ['fg', 'fzfSpinner'],
    \ 'info':     ['fg', 'fzfInfo'],
    \ 'prompt':   ['fg', 'fzfPrompt'] }

" Remappings
noremap <Leader>t :FZF<CR>
noremap <Leader>b :Buffers<CR>
nnoremap <CR> :noh<CR><CR>
noremap <Leader>n :set number! relativenumber!<CR>
map Y y$

" [ctags] open definition vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags+=gems.tags

if has("autocmd")
  " Tab settings for Makefiles
  autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  " Always start on the first line of commit files
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
endif

" Multipurpose tab key
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<CR>
inoremap <s-tab> <c-n>

" Pathogen plugin manager
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
  filetype plugin indent on
  colorscheme Tomorrow-Night-Eighties

  " NERDTree file browser
  " https://github.com/scrooloose/nerdtree
  map <C-b> :NERDTreeToggle<CR>

  " ALE linter
  noremap <Leader>l :ALEToggle<CR>
  noremap <Leader>j :ALENext<CR>
  noremap <Leader>k :ALEPrevious<CR>
  let g:ale_sign_error='xx'
  let g:ale_sign_warning='!!'
  let g:ale_linters =
        \ { 'javascript': ['eslint'],
          \ 'haskell':    ['hlint'] }
  let g:ale_fixers =
        \ {
          \ 'haskell':    ['ormolu'] }
  let g:ale_haskell_hlint_options = '--refactor'
  let g:ale_haskell_ormolu_executable="fourmolu"
  let g:ale_fix_on_save = 1

  " comfortable-motion (smooth scroll)
  let g:comfortable_motion_no_default_key_mappings = 1
  let g:comfortable_motion_impulse_multiplier = 1.5
  nnoremap <silent> <C-j> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0))<CR>
  nnoremap <silent> <C-k> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * -1 * winheight(0))<CR>

  " fugitive
  noremap <Leader>g :Git blame<CR>
  noremap <Leader>G :Gedit<CR>

  " fzf.vim
  noremap <Leader>a :Rg<Space>
  noremap <Leader>s :Rg <C-R><C-W>
  let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']
