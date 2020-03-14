" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set nocompatible              " required
filetype off                  " required
set autoread
au CursorHold * checktime

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'
" Nerd Tree
Plugin 'scrooloose/nerdtree'
" CTRL-P
Plugin 'kien/ctrlp.vim'
" GIT Integration
Plugin 'tpope/vim-fugitive'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Tagline
" sudo apt-get install ctags
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'slashmili/alchemist.vim'
" Command-t
" Plugin 'wincent/command-t'
" javascript jsx plugin
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" Vim ack.vim
Plugin 'mileszs/ack.vim'
" Vim GoLan
Plugin 'fatih/vim-go'
" Vim SHell
Plugin 'Shougo/vimshell.vim'
" Ruby Plugin
Plugin 'vim-ruby/vim-ruby'
" Rails Plugin
Plugin 'tpope/vim-rails'
" Elixir
Plugin 'elixir-editors/vim-elixir'
" Autocomplete plugin
" Plugin 'zxqfl/tabnine-vim'
" Multi curson
Plugin 'terryma/vim-multiple-cursors'
" Markdown
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Markdown Preview
Plugin 'JamshedVesuna/vim-markdown-preview'
" themes
Plugin 'ayu-theme/ayu-vim'

call vundle#end()            " required
filetype plugin indent on    " required

set clipboard=unnamed
set clipboard=unnamedplus


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
let mapleader = ","

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"" easier moving between tabs
map <C-i> <Esc>:tabprev<CR>
map <C-o> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>
map <C-q> <Esc>:tabo<CR>
map <leader>p  :tabo<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Trim white space from end
autocmd BufWritePre * :%s/\s\+$//e

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
filetype off
filetype plugin on
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=119   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Identifying white space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype ex setlocal ts=2 sw=2 expandtab
autocmd Filetype exs setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Javascript jsx settings
let g:javascript_plugin_jsdoc = 1
set foldmethod=syntax

" Set UTF-8
set encoding=utf-8

" Setting Syntastic
let python_highlight_all=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=5
syntax on

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" NERD Tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeMapOpenInTab='<ENTER>'
autocmd BufWinEnter * NERDTreeMirror
set mouse=a
let g:NERDTreeMouseMode=3
map <Leader>q :NERDTreeToggle<CR>
map <c-f> <c-f>:NERDTreeFind<CR>

" TAGBAR
map <Leader>w :TagbarToggle<CR>

"" Using Ag search (silver search)
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>f :Ack <cword><cr>

" CTAGS setting
set autochdir
set tags=./tags

let g:ycm_python_binary_path = 'python'

" Multi-Cursor settings custom
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Markdown Preview
let vim_markdown_preview_hotkey='<C-M>'
let vim_markdown_preview_github=1

" Ayu Theme
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" Vim large files
let g:LargeFile = 10
