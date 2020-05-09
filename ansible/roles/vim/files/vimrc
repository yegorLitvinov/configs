set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

set number
set history=1000

 " Uncomment the following to have Vim jump to the last position when
 " reopening a file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 endif
 
" Command to find using ripgrep
:nmap <c-f> :Rg 
:imap <c-f> <Esc>:Rg

" CTRL-S to save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
" CTRL-P to fzf
set rtp+=~/.fzf
:nmap <c-p> :FZF<CR>
:imap <c-p> <Esc>:FZF<CR>

" Infinite history
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Plugin Manger
call plug#begin('~/.vim/plugged')
Plug '~/.fzf'
Plug 'jremmen/vim-ripgrep'
call plug#end()
