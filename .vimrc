" Line numbering.
set number
set numberwidth=4

" Plugins.
call plug#begin('~/.vim/plugged')

" Airline - status line at the bottom
Plug 'vim-airline/vim-airline'

" Oceanic-Next color scheme.
Plug 'mhartington/oceanic-next'

" File browser side window.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Another color-scheme.
Plug 'whatyouhide/vim-gotham'

" Gruvbox
Plug 'morhetz/gruvbox'

call plug#end()

" Tabulation.
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Specific tab sizes
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab
autocmd Filetype c setlocal ts=2 sw=2 expandtab

" Mail formatting - disable auto-wrap
autocmd Filetype mail setlocal tw=0

" Auto-complete parantheses.
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i

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
nmap <C-L> :bnext<CR>

" Move to the previous buffer
nmap <C-H> :bprevious<CR>

" Close current buffer
nmap <C-T> :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Setting color scheme
syntax enable
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme OceanicNext
set background=dark
set termguicolors

" Kitty background bug fix
let &t_ut=''

" ST backspace button fix
":set t_kD=
:set t_kb=

