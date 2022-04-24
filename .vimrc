set nocompatible              " be iMproved, required


filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
" " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/plugins')
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mattn/emmet-vim' 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

filetype plugin indent on    " required

colorscheme gruvbox 

"set guifont=JetBrainsMono\ Nerd\ Font:12
set guifont=Hack\ Nerd\ Font:12

" Solve vim-devicons cut half
set ambiwidth=double

set clipboard=unnamedplus

set encoding=UTF-8

set shell=zsh 
"
syntax on

" Toggle vim transparent mode
let t:is_transparent = 0                                                            
function! ToggleTransparentBackground()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 0                                                                    
"    colorscheme gruvbox
  endif                                                                                         
endfunction                                                                                     
nnoremap <C-x>x :call ToggleTransparentBackground()<CR>

let python_highlight_all = 1

" PEP 8 identation
au BufNewFile,BufRead *.py,*.cpp
    \ set encoding=UTF-8 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.sh
    \ set encoding=UTF-8 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.conf
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

" Enabling folding
set foldmethod=indent

set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" To see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" vim-syntastic
set statusline+=%#warningmsg#"
set splitbelow splitright
set wildmenu
set showcmd
set hlsearch " hilights words when searched
set visualbell
set ignorecase
set smartcase
set backspace=indent,eol,start
set mouse=a
set number relativenumber
set cursorline
set showmatch
set bg=light
set omnifunc=syntaxcomplete#Complete

map <Enter> o<ESC>k
map <C-Enter> O<ESC>j

" Save file
inoremap <C-s> <ESC>:w<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>

" Excecute current python script.
"map <C-r>p :terminal<CR><C-w>:resize -7<CR>. ./venv/bin/activate & clear<CR>:!python3 %<CR>
"map <C-j>p :w<CR>:!clear<CR>:!python3 %<CR>
map <C-j>p <Esc>:!clear<CR>:w<CR>:!python3 %<CR>
imap <C-j>p <Esc>:!clear<CR>:w<CR>:!python3 %<CR>

" Excecute current shell script.
map <C-j>s <Esc>:!clear<CR>:w<CR>:!bash %<CR>
imap <C-j>s <Esc>:!clear<CR>:w<CR>:!bash %<CR>

" Shortcutting split navigation.
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-c>c <C-c>:

" Open CtrlP
map <C-k>p :CtrlP<CR>

" Open terminal
map <C-t>t  :terminal<CR><C-w>:resize -7<CR>. ./venv/bin/activate & clear<CR>

" identline
let g:indentLine_enabled = 1
map <C-r>i :IndentLinesToggle<CR>
let g:indentLine_char = '¦'

" Display and select buffer. 
map <C-b> :w<CR><C-c>:ls b<CR>:b 

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Make NERDTree open by default.
autocmd VimEnter * NERDTree
" Close NERDTree when closing main split screen.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Default python version for vim
let g:syntastic_python_python_exec = 'python3.10.0rc1'

" vim-airline
let g:airline_theme='base16_twilight'
noremap <M-Right> :bn<CR>
noremap <M-Left> :bp<CR>
noremap <C-x> :bp \|bd #<CR>
map <C-a> :AirlineToggle<CR>

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

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

set noshowmode
