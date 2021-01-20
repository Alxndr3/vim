set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
" " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/plugins')
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'mattn/emmet-vim' 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

call vundle#end()            " required
filetype plugin indent on    " required

" Color scheme
colorscheme medic_chalk

" Set vim transparent mode
let t:is_transparent = 0                                                                        
function! Toggle_transparent_background()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=NONE ctermbg=NONE                                                           
    let t:is_transparent = 0                                                                    
  endif                                                                                         
endfunction                                                                                     
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

let python_highlight_all=1

syntax on

" PEP 8 identation
au BufNewFile,BufRead *.py
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
map <C-p> :w<CR>:!clear<CR>:!python3 %<CR>
imap <C-p> <Esc>:!clear<CR>:w<CR>:!python3 l%<CR>

" Shortcutting split navigation.
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-c>c <C-c>:

" Open terminal
map <C-t> <C-c>:terminal<CR><C-w>:resize -5<CR>. ./venv/bin/activate && clear<CR>

" autocmd VimEnter * terminal 
" autocmd VimEnter * resize 8

" Display and select buffer. 
map <C-b> <C-c>:w<CR><C-c>:ls b<CR>:b 


" Make NERDTree open by default.
autocmd VimEnter * NERDTree
" Close NERDTree when closing main split screen.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
