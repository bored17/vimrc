let g:mapleader=" "

set t_Co=256
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch

exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set cindent "C"
set shiftwidth=4

" set mouse=anv 
"
set ts=4
set expandtab
set autoindent

    

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse -=a
set encoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
noremap <LEADER><CR> :nohlsearch<CR>
noremap h i
noremap  H I

noremap i k
noremap j h
noremap k j

noremap I 5k
noremap K 5j
noremap L 5l
noremap J 5h

noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>

noremap si :set nosplitbelow<CR>:split<CR>
noremap sk :set splitbelow<CR>:split<CR>


map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j

map ti : tabe<CR>
map tl :+tabnext<CR>
map tj :-tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map s <nop>
map W :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>


call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim'
"pairs
Plug 'jiangmiao/auto-pairs'


Plug 'tpope/vim-commentary'

"wild
Plug 'gcmt/wildfire.vim'

Plug 'tpope/vim-surround'

"snippets
Plug 'SirVer/ultisnips'


Plug 'honza/vim-snippets'


Plug 'itchyny/vim-cursorword'

Plug 'sickill/vim-monokai'

" Plug 'Yggdroot/indentLine'


Plug 'connorholyday/vim-snazzy'

Plug 'joshdick/onedark.vim'

Plug 'Shougo/echodoc.vim'

Plug 'Chiel92/vim-autoformat'


call plug#end()
set background=dark
set t_Co=256
colorscheme onedark 
highlight Normal guibg=NONE ctermbg=None
"NERDTree
"
map tt :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

"coc.vim
"let g:coc_global_extensions=[
"            \'coc-json',
"            \'coc-vimslp']

set hidden
set shortmess+=c
set updatetime=100

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


autocmd CursorHold * silent call CocActionAsync('highlight')




nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)]
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)



"prepare_code_plugin_path





"ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-r>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']

"color 

"echodoc
set cmdheight=2
let g:echodoc_enable_at_startup	 = 1

autocmd BufNewFile *.py,*.cpp,*.sh,*.java,*.h exec ":call SetTitle()"                                                                                              
"新建.py,.cc,.java,.sh,
""定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'java'
                call setline(1, "//coding=utf8")
                call setline(2, "/*************************************************************************")
                call setline(3, "\ @Author: bored")
                call setline(4, "\ @Created Time : ".strftime("%c"))
                call setline(5, "")
                call setline(6, "\ @File Name: ".expand("%"))
                call setline(7, "\ @Description:")
                call setline(8, "")
                call setline(9, " ************************************************************************/")
                call setline(10,"")
        endif
        if &filetype == 'cpp'
            call setline(1, "//coidng=utf8")
            call setline(2, "//--------------")
            call setline(3, "// Author: bored")
            call setline(4, "// Created Time : ".strftime("%c"))
            call setline(5, "// File Name: ".expand("%"))
            call setline(6, "// Description:")
            call setline(7, "//--------------")
            call setline(8, "#include <iostream>")
        endif
        if &filetype == 'python'
            call setline(1, "#!/usr/bin/env python3")
            call setline(2, "# -*- coding: utf-8 -*-")
        endif
endfunc



"format
let g:formatterpath=['/usr/bin/clang-format']
au BufWrite *.cpp :Autoformat
au BufWrite *.c :Autoformat
au BufWrite *.h :Autoformat
