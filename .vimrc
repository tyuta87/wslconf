" behave Vi-compatible as much as possible
set nocompatible
" print the line number in front of each line
set number
" use spaces when <Tab> is inserted
set expandtab
" number of spaces that <Tab> in file uses
set tabstop=2
" number of spaces to use for (auto)indent step
set shiftwidth=2
" take indent for new line from previous line
set autoindent
" smart autoindenting for C programs
set smartindent
" how backspace works at start of line
set backspace=indent,eol,start
" highlight matches with last search pattern
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" briefly jump to matching bracket if insert one
set showmatch
" tells when last window has status lines
set laststatus=2
" custom format for the status line
set statusline=[%n]
set statusline+=%<%F
set statusline+=%m
set statusline+=%r
set statusline+=[%{&fileformat}]
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set statusline+=[row=%l/%L]
set statusline+=[col=%c/%{col('$')-1}]
" syntax to be loaded for current buffer
set syntax=on
" left-right movements don't wrap
set whichwrap=b,s,[,],<,>
" when to use virtual editing
set virtualedit=block
" what to do with Unicode chars of ambiguous width 
set ambiwidth=double
" show <Tab> and <EOL>
set list
" characters for displaying in list mode
set listchars=tab:>.,trail:-,eol:~,extends:>,precedes:<,nbsp:%
" don't unload buffer when it is YXXYabandon|ed
set hidden
" let Vim set the title of the window
set title
" string to use for the Vim window title
set titlestring=vim\ -\ %F
" show (partial) command in status line
set showcmd
" minimum nr. of lines above and below cursor
set scrolloff=8

if has('mouse')
  " enable the use of mouse clicks
  set mouse=a
  " type of mouse codes generated
  set ttymouse=xterm2
endif

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

