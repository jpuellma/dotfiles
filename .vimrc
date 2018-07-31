" runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle install: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" To add/reload plugins, add them here, RESTART vim,
" and run :PluginInstall inside vim.
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

Bundle 'gmarik/Vundle.vim'
Bundle 'ervandew/supertab'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/xoria256.vim'
Bundle 'vim-scripts/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/Syntastic'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/tComment'
" Bundle 'tristen/vim-sparkup'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-expand-region'
Bundle 'metakirby5/codi.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jacoborus/tender'
Plugin 'jamessan/vim-gnupg'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

set nocompatible
" filetype plugin indent on
syntax on
set nohlsearch
set expandtab
set tabstop=8
set shiftwidth=4
set smarttab
set smartindent
set modelines=10
"set guifont=Inconsolata\ Medium\ 8
"set guifont=Monospace\ 8
set showmode
"set showtabline=2
" set wrap
set number
set t_Co=256
set colorcolumn=+1 " red line and over is error
set textwidth=0
set fo-=t
"set mouse=a

"colorscheme jpuellma
"colorscheme solarized
"set background=dark
if ! exists('$TMUX')
 colorscheme xoria256
endif

" enforce purity
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-\> :NERDTreeToggle<CR>


execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=0
highlight ColorColumn guibg=Black

" General option
" ===============
let mapleader = "," " rebind <Leader> key
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
vnoremap <Leader>s :sort<CR>

let @r = '%s/\(.*\)	 \+MD5:.*\nSHA-256: \(.*\)/\2  \1'

" Play nice with tmux displays
if exists('$TMUX')
  set term=screen-256color
endif
hi Visual       ctermfg=255 guifg=#eeeeee ctermbg=96  guibg=#875f87
set ls=2
set nowrap

" vim-airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

