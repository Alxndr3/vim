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
set encoding=utf-8
set shell=zsh 

" Color scheme
colorscheme monokai

" Set vim transparent mode
let t:is_transparent = 0                                                            
function! ToggleTransparentBackground()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 0                                                                    
    colorscheme monokai
  endif                                                                                         
endfunction                                                                                     
nnoremap <C-x>x :call ToggleTransparentBackground()<CR>

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
map <C-r>p :w<CR>:!clear<CR>:!python3 %<CR>
imap <C-r>p <Esc>:!clear<CR>:w<CR>:!python3 %<CR>

" Excecute current shell script.
map <C-r>s :w<CR>:!clear<CR>:!bash %<CR>
imap <C-r>s <Esc>:!clear<CR>:w<CR>:!bash %<CR>

" Shortcutting split navigation.
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-c>c <C-c>:

"" Open terminal
map <C-t>t <C-c>:terminal<CR><C-w>:resize -7<CR>. ./venv/bin/activate & clear<CR>

"function! OpenTerminal()
"  if !empty(expand(glob("venv")))
"    <C-c>:terminal<CR><C-w>:resize -8<CR> clear<CR>. venv/bin/activate && clear<CR>
"  else
"    <C-c>:terminal<CR><C-w>:resize -8<CR> clear<CR>
"  endif
"endfunction
"nnoremap <C-t>t :call OpenTerminal()<CR>


" autocmd VimEnter * terminal 
" autocmd VimEnter * resize 8

" Display and select buffer. 
map <C-b> <C-c>:w<CR><C-c>:ls b<CR>:b 
" Open up NERDTree
map <C-c>n <C-c>:NERDTree<CR>
" Make NERDTree open by default.
autocmd VimEnter * NERDTree
" Close NERDTree when closing main split screen.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Default python version for vim
let g:syntastic_python_python_exec = 'python3.8.11'
