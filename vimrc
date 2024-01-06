" Global pre-configuration
inoremap jj <ESC>

" vim-colors-solarized
syntax enable
"colorscheme solarized
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
"let g:solarized_termcolors=256

set cursorline
set cursorcolumn
set bg=dark
set completeopt-=preview
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set tags=~/insights/tags
let python_highlight_all=1
let mapleader=","

" Misc
set noswapfile
set nobackup
set viminfo+=n~/.vim/info
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif
set wildmenu
set wildmode=list:full
set visualbell

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set wrap    " automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set cc=+1

" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward

" Search
set magic
set incsearch
set ignorecase
set smartcase
set hlsearch

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Useful settings
set history=700
set undolevels=700

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" Real programmers don't use TABs but spaces
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set fileformat=unix


" Make search case insensitive
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase


" Fold                                                                             
set foldenable                                                                     
set foldmethod=indent                                                              
set foldminlines=3                                                                 
set foldlevel=9999                                                                 
set foldcolumn=6 

       
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Vundle to manage your plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'tpope/vim-commentary'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'yum-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython'
Plugin 'nvie/vim-flake8'
Plugin 'alfredodeza/pytest.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kevinw/pyflakes-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kannokanno/previm'
"Plugin 'altercation/vim-colors-solarized'

" Utility
Plugin 'CmdlineComplete'
Plugin 'kien/ctrlp.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ============================================================================
" Python IDE Setup
" ============================================================================

" Setting for NerdTree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
"autocmd VimEnter * NERDTree | wincmd p

" Setting for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

" Setting for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '/home/shawn/.ycm_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Setting for airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1       
let g:airline#extensions#tabline#left_sep = ' '    
let g:airline#extensions#tabline#left_alt_sep = '|'

" Setting for pyflakes 
let g:pyflakes_use_quickfix = 0

" Setting for rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Setting for vim-instant-preview
let g:instant_markdown_autostart = 0

" Setting for vim-indent
" let g:indent_guides_auto_colors = 0
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgray
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" let g:indent_guides_enable_on_vim_startup = 1
