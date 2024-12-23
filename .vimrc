source /etc/vimrc
set background=dark
set visualbell
set noerrorbells

set nocompatible
set path+=**
syntax enable
filetype plugin on
set wildmenu

" netrw stuff
let g:netrw_banner=0  " Disable annoying netrw banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1  " Open splits to the right.
" let g:netrw_list_hide=netrw_gitignore:Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" numbers
set nu
set relativenumber

" Columns and cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=darkGray
set cursorline
hi CursorLine cterm=NONE ctermbg=black

" searching
set nohlsearch
set incsearch

" tabs and indents
set ts=2
set sw=2
set et
set ai

" Comment with gc
source ~/.config/vim/commentary.vim

" Highligh trainiling whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" misc.
let mapleader=" "
set mouse=a

" Inset Title Header.
nnoremap <leader>H ggO<esc>!! /Users/zkticrm/Notes/bin/insert-header.sh <c-r>%<cr>jo

" Strikethrough the line.
nnoremap <leader>~ I~~<esc>A~~<esc>:s/\~\~- /- \~\~<cr><esc>

" Inset Diary Header.
" nnoremap <leader>H !! /Users/zkticrm/Notes/bin/insert-diary-header.sh <c-r>%<cr>jA

" Insert datestamp/timestamp
nnoremap <leader>D o<esc>!! /Users/zkticrm/bin/datestamp <cr><esc>I# <esc>kJ$
" nnoremap <leader>T o<esc>!! /Users/zkticrm/bin/timestamp <cr><esc>I# <esc>kJ$
nnoremap <leader>T <esc>!! /Users/zkticrm/bin/shorttimestamp.sh <cr><esc>o

" Replace blanks with dashes.
vnoremap <leader>- :s/\%V\s/-/g<cr><esc>

" Link to markdown.
vnoremap <leader>X :s/.*/[&](&.md)<cr><esc>

nnoremap <leader>P @p

" There Exists
inoremap <C-e> ∃
