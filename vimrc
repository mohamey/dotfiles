call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'

" Syntastic
Plug 'scrooloose/syntastic'

" vim base 16
Plug 'chriskempson/base16-vim'

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" Nerd Tree
Plug 'scrooloose/nerdtree'

" Whitespace Highlight
Plug 'ntpeters/vim-better-whitespace'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Easy buffer
Plug 'troydm/easybuffer.vim'

" tcomment
Plug 'tomtom/tcomment_vim'

" Vim Commentary
Plug 'tpope/vim-commentary'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Vim JS
Plug 'pangloss/vim-javascript'
call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set scrolloff=15
set sidescrolloff=15

set t_Co=256
let base16colorspace=256

" Background
set background=dark

colorscheme base16-solarized-dark

" Solarized theme for vim airline
let g:solarized_base16 = 1

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let mapleader=" "

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Vim airline themes
let g:airline_powerline_fonts = 1

"let g:airline_theme='solarized'
set laststatus=2

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Peters whitespace shite
highlight ExtraWhitespace ctermbg = red
" Nerdtree Config
" autocmd vimenter * NERDTree
" Auto open Nerdtree
" autocmd StdinReadPre * let s:std_in=1 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Change Vim Split behaviour
set splitbelow
set splitright

" Nerd Tree toggle
nnoremap <Leader>NT :NERDTreeToggle<CR>

" Map split navigations
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-l>

" Map control P to fuzzy file search"
nnoremap <C-p> :FZF<CR>

" Easily make changes to vimrc
nnoremap <Leader>R :so ~/.vimrc<CR>
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

" Map custom keys for changing tabs
nnoremap <Leader>m :bnext<cr>
nnoremap <Leader>n :bprevious<cr>
nnoremap <Leader>N :bp <BAR> bd #<CR>
nnoremap <Leader>bl :ls<cr>

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Vim airline fonts
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Vim stuffsie Stuffs
set noswapfile
set nobackup
set nowritebackup

let g:javascript_plugin_jsdoc = 1
