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

call plug#end()

" Tabulation.
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set tabstop=2
set softtabstop=0

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
set termguicolors

" Specific tab sizes
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2

" Kitty background bug fix
let &t_ut=''
