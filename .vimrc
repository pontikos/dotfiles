" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'} 
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'altercation/vim-colors-solarized'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch' 
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'topfunky/PeepOpen'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic.git'
" Bundle 'vim-scripts/Vim-R-plugin'
Bundle 'mmai/vim-zenmode'
Bundle 'junegunn/goyo.vim'
Bundle 'gioele/vim-autoswap'
Bundle 'carlobaldassi/ConqueTerm'


" Some settings to enable the theme:
" " All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
"
let g:rspec_command = "Dispatch rspec {spec}" 
"set number        " Show line numbers
syntax enable     " Use syntax highlighting
"set background=dark
let g:solarized_termcolors=256
"colorscheme solarized


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set clipboard=unnamed

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" i don't care if was compiled with vms, stop creating annoying tilde files
" please!
set nobackup

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd! bufwritepost .vimrc source %
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " au FileType python source ~/python.vim
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else 

endif " has("autocmd")

" On OSX press Alt and click
set mouse=a
"--------------------------------------------------
" I don't undestand this
"-------------------------------------------------- 
map <M-Esc>[62~ <MouseDown>
map! <M-Esc>[62~ <MouseDown>
map <M-Esc>[63~ <MouseUp>
map! <M-Esc>[63~ <MouseUp>
map <M-Esc>[64~ <S-MouseDown>
map! <M-Esc>[64~ <S-MouseDown>
map <M-Esc>[65~ <S-MouseUp>
map! <M-Esc>[65~ <S-MouseUp>

"--------------------------------------------------
" I would have bound this to <C-q> but for some strange reason it doesn't work.
"-------------------------------------------------- 
map <C-x> :q<cr> 
map <C-s> :q<cr> 
map <C-s> :w<cr> 
if has("gui_running")
	  " If the current buffer has never been saved, it will have no name,
	  "   " call the file browser to save it, otherwise just save it.
	  :map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
  endif 
"--------------------------------------------------
" Saving in insert mode without returning to insert mode
"-------------------------------------------------- 
imap <c-s> <esc><c-s>

"--------------------------------------------------
" C support stuff
"-------------------------------------------------- 
let g:C_AuthorName      = 'Nikolas Pontikos'     
let g:C_AuthorRef       = ''                         
let g:C_Email           = 'n.pontikos@ucl.ac.uk'            
let g:C_Company         = 'UCL'    


set list
set listchars:tab:``

set expandtab
set ts=4
set sw=4


set autoindent    " always set autoindenting on
map <;-j> echo 'blahhhhhhh'
set nohlsearch
set scrolloff=4

"
" R support
"
au BufNewFile,BufRead *.R     setf r
au BufNewFile,BufRead *.R     set syntax=r 
let vimrplugin_r_path = "/usr/bin/R"


" template for filetype
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

"
" I don't know who is responsible for setting
" these imaps but they obviously don't work so
" well with latex
"
"iunmap \c
"iunmap \x

" disable annoying visual bell sounds
"set visualbell t_vb=   
set vb t_vb=

map Y y$

" my prefered colorscheme
" colorscheme desert
set guifont=Menlo:h9

"--------------------------------------------------
" Tab key bindings
"-------------------------------------------------- 
"map <C-right> :tabnext<cr> 
map <C-l> :tabnext<cr> 
"map <C-left> :tabprevious<cr> 
map <C-h> :tabprevious<cr> 
map <C-n> :tabnew<cr> 

" for copy/pasting to sytem clipboard
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>

:command! W w
"vnoremap <NUL> <F9><cr>
"nnoremap <NUL> <F9><cr>



