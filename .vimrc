" &shell
" let &shell='/bin/bash'
set nocompatible
let mapleader=" "
set mouse=a
set nowrap
 
set path+=**
syntax enable
filetype plugin on
set wildmenu
 
" netrw stuff
let g:netrw_banner=1  " Disable annoying netrw banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1  " Open splits to the right.
" let g:netrw_list_hide=netrw_gitignore:Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 
" numbers
set nu
set relativenumber
 
" Colors, columns cursorline, etc
"
set t_Co=16
set t_Co=256
set termguicolors
 
set colorcolumn=80
highlight ColorColumn ctermbg=white
set cursorline
hi CursorLine cterm=NONE ctermbg=black
 
" Min. # lines to keep on screen for 'zt'/'zb'.
set scrolloff=3
 
set modelines=10
 
set updatetime=200
 
" searching
set nohlsearch
set incsearch
 
" tabs and indents
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
 
" Use 4-space tabs in Python.
autocmd BufNewFile,BufRead *.py set ts=4 sw=4 sts=4
 
" Highlight trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
 
" Undofile
set undodir="$HOME/.vim/undodir"
set undofile
 
set laststatus=2
set showmode
set wildmode=list:longest
 
" Spellchecking
set spelllang=en_us
set nospell
autocmd BufNewFile,BufRead *.txt,*.md set spell
 
let g:vim_config_dir = expand('~/.config/vim/')
if isdirectory(g:vim_config_dir)
  for vim_file in glob(g:vim_config_dir . '*.vim', 0, 1)
    execute "source " . vim_file
  endfor
endif
 
