"""Vundle


set nocompatible      " Nécessaire
filetype off          " Nécessaire

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    

" On indique à Vundle de s'auto-gérer 
Bundle 'gmarik/Vundle.vim'

"Coloration des #......
Bundle 'vim-scripts/colorizer'

"Incrémenter/Décrémenter à l'aide de +/-
Bundle 'vim-scripts/nextval'

"Gestionnaire de fichiers
Bundle 'scrooloose/nerdtree'

"Controleur de syntaxe à DÉSACTIVÉ À CAUSE DE LISP
Bundle 'vim-syntastic/syntastic' 

"Statusbar
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

"Tagbar
Bundle 'majutsushi/tagbar'

"Fermer parenthèses ouvrantes automatiquement
Bundle 'Raimondi/delimitMate'

"Auto-complétion NE FONCTIONNE PAS
Bundle 'valloric/youcompleteme'

"Snippets NE FONCTIONNE PAS
Bundle 'SirVer/ultisnips'

call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire

"""Configuration
syntax on
set nu
set autoindent
set mouse=a
map <F3> :set relativenumber!<CR>
colorscheme molokai
hi Normal ctermbg=none

""Nextval
nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec

""Nerdtree
map <C-n> :NERDTreeToggle<CR>
"Fermer si il n'y a que nerdtree de lancé
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree
let g:NERDTreeWinSize=15

""Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3'] "flake8 


""Airline
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
set laststatus=2

"youcompleteme
let g:ycm_python_binary_path = '/usr/bin/python3'

"tagbar
let g:Tbar_WinWidth=20
nmap <F4> :TagbarToggle<CR>

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



"Copier-coller
set clipboard=unnamedplus

