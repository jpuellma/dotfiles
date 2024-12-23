"""""""""""""""""
" COLOR SCHEMES
"""""""""""""""""

"""""""""""""""
" murphy
"   (builtin)
"""""""""""""""
colorscheme murphy

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" iceberg
" wget https://github.com/cocopon/iceberg.vim/raw/refs/heads/master/colors/iceberg.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme iceberg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-code-dark
" wget https://github.com/tomasiser/vim-code-dark/raw/refs/heads/master/colors/codedark.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you don't like many colors and prefer the conservative style of the
" standard Visual Studio
" let g:codedark_conservative=0
" If you like the new dark modern colors (Needs feedback!)
" let g:codedark_modern=1
" Activates italicized comments (make sure your terminal supports italics)
let g:codedark_italics=1
" Make the background transparent
let g:codedark_transparent=1
" If you have vim-airline, you can also enable the provided theme
" let g:airline_theme = 'codedark'
" if filereadable(expand("~/.vim/colors/codedark.vim"))
"   colorscheme codedark
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PaperColor
" wget https://github.com/NLKNguyen/papercolor-theme/raw/refs/heads/master/colors/PaperColor.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:PaperColor_Theme_Options = {
\   'theme': {
\     'default': {
\       'allow_bold': 1,
\       'allow_italic': 1,
\       'transparent_background': 1
\     }
\   }
\ }
if filereadable(expand("~/.vim/colors/PaperColor.vim"))
  colorscheme PaperColor
endif

