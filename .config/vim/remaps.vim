""""""""""
" REMAPS "
""""""""""

" Insert Title Header.
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

" Move selected blocks with J/K.
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Keep curent line centered in <C-d>/<C-d> and N/n searching.
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Leader Y yanks to +y (system paste buffer)
vnoremap <leader>y :w !pbcopy<cr><cr>
nnoremap <leader>Y 0V:w !pbcopy<cr><cr>

" Easy splits
nnoremap <C-w>- <cmd>split<cr>
nnoremap <C-w>\| <cmd>vsplit<cr>
nnoremap <C-w>\ <cmd>vsplit<cr>

" Spellcheck
nnoremap <leader><F7> :set spell!<cr>
