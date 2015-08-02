" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" do not store global and local values in a session
set ssop-=options
" do not store folds
set ssop-=folds

" avoid tilde files in working directory
set backupdir=~/.vim/backup
" avoid swap files in working directory
set directory=~/.vim/backup

" remove end of lines white spaces when saving
function! Bar()
    let line = line(".")
    exec 'v:^--\s*$:s:\s\+$::e'
    exec line
endfunction
autocmd BufWritePre * silent! call Bar()

" change colors when in diff
if &diff
    colorscheme murphy
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set tw=120
set fdm=marker
set expandtab

filetype plugin on
filetype indent on

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=vendor/cache/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ========================================
" Vim plugin configuration
" ========================================

let $PYTHONHOME='/usr/bin/python'
" DO THIS THE FIRST TIME :
" - git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" - vim +PluginInstall +qall

" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
let g:vundle_default_git_proto = 'git'
call vundle#begin()

" ================ START Bundle =======================

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" file navigator gutter
"Plugin 'scrooloose/nerdtree.git'

" Make it look amazing
Plugin 'altercation/vim-colors-solarized'

" Add a php debugger
Plugin 'joonty/vdebug.git'

" Better PHP syntax
Plugin 'StanAngeloff/php.vim.git'

" ================ END Bundle =======================

call vundle#end()
filetype plugin indent on     " required!

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ================ Plugins config ===================

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
color solarized

" Vdebug
"let g:vdebug_options['break_on_open'] = 0 " does not work?

" PHP syntax
let php_sql_query = 1
let php_html_in_strings = 1
let b:sql_type_override = 'mysql'
let g:sql_type_default = 'mysql'
let php_parent_error_close = 1

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" ================ Custom binds =====================
":imap ;; <Esc>
