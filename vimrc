filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

" whitespace handling
set autoindent             " Indent according to previous line.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set shiftwidth  =2
set tabstop     =2
set expandtab              " Use spaces instead of tabs.

" keys
set backspace   =indent,eol,start  " Make backspace work across autoindent, begin/end of lines

" buffers
set hidden                 " Switch between buffers without having to save first.

" status
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected in last line.
set report      =0         " Always report changed lines.

" saner command history
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" saner ctrl-l
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" visual
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set lazyredraw             " Only redraw when necessary.
set cursorline             " Draw a horizontal line under the cursor's line
set synmaxcol   =200       " Only highlight the first 200 columns.

" disable cursorline in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set complete-=i            " disable scanning included files
set complete-=t            " disable searching tags

" windows
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup                                 " write a backup of each file
set backupdir   =$HOME/.vim/files/backup// " place to store backups
set backupext   =-vimbackup                " extension to give backup files
set backupskip  =                          " write backup for all file patterns
set directory   =$HOME/.vim/files/swap//   " swap directory
set updatecount =100                       " write swapfile after typing this many characters
set undofile                               " save undo history to file when writing buffer
set undodir     =$HOME/.vim/files/undo//   " place to store undofiles
set viminfo     ='100,n$HOME/.vim/files/info/viminfo " remember history when exiting vim and restarting

set shell=/bin/bash        " always assume bash when executing stuff

" use rg for grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" don't mess with EOL
set nofixendofline
set noendofline

" fzf = Ctrl-P
nnoremap <silent> <C-p> :Files<cr>

" Go
" let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
let g:go_auto_sameids = 1

" Mouse
set mouse=a

" Show line numbers
set number
