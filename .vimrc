" Plugins.
call plug#begin('~/.vim/plugged')

" Airline - status line at the bottom
Plug 'vim-airline/vim-airline'

" Oceanic-Next color scheme.
Plug 'mhartington/oceanic-next'

" Another color-scheme.
Plug 'whatyouhide/vim-gotham'

" Gruvbox
Plug 'morhetz/gruvbox'

" Odin syntax
Plug 'Tetralux/odin.vim'

call plug#end()

" Line numbering.
set number
set numberwidth=4

" Tabulation.
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Specific tab sizes
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab
autocmd Filetype c setlocal ts=2 sw=2 expandtab
autocmd Filetype py setlocal ts=2 sw=2 expandtab
autocmd Filetype odin setlocal ts=2 sw=2 noexpandtab
autocmd Filetype go setlocal ts=2 sw=2 noexpandtab

" Mail formatting - disable auto-wrap
autocmd Filetype mail setlocal tw=0

" Auto-complete parantheses.
" Disabling for now. Feels like it's more pain than usability.
":inoremap ( ()<Esc>i
":inoremap { {}<Esc>i
":inoremap [ []<Esc>i

" Airline - use powerline fonts
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1

" netrw config.
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Move to the next buffer
nmap <F6> :bn<CR>

" Move to the previous buffer
nmap <F5> :bp<CR>

" Close current buffer
nmap <C-t> :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Trying out new mapping for buffer navigation
set <m-h>=h " Fix for st
set <m-l>=l " Fix for st
nmap <m-h> :bn<CR>
nmap <m-l> :bp<CR>

" Basic mapping for cyrillic keyboard layout in normal mode
set langmap=рh,оj,лk,дl,шi,зp,щo,фa,вd,чx,ВD,ИB,цw,уe,иb,кr,КR

" Setting color scheme
syntax enable
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme OceanicNext
set background=dark
set termguicolors

" Kitty background bug fix
let &t_ut=''

" Opening URLs.
nmap <leader><space> yiW: !xdg-open <c-r>" &<cr>

" Comment out mode: type this and then a motion, like 10j
nmap <leader>q :set opfunc=CommentOut<CR>g@
" Comment out current line.
nmap <C-\> :call CommentLine()<CR>

function! Min(a, b)
  if a:a < a:b
    return a:a
  endif
  return a:b
endfunction

function! CommentOut(type, ...)
  let start = line("'[")
  let end = line("']")

  let end = Min(end, line("$"))
  while start < end
    exe "normal" start .. "G" .. "^i// "
    let start += 1
  endwhile
endfunction

function! CommentLine()
  let column = col(".")
  let row = line(".")
  exe "normal" "^i// "
  call cursor(row + 1, column)
endfunction

" Macros

let @q="r\"f\'r\""
