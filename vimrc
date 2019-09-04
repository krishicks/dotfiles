filetype plugin indent on
syntax on

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

" Split below and to the right
set splitright
set splitbelow

" 2 spaces for tabs
set expandtab
" set shiftwidth=2
" set softtabstop=2

" always assume bash when executing stuff
set shell=/bin/bash

" use rg for grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" highlight search terms
hi Search cterm=NONE ctermfg=white ctermbg=blue
set hlsearch

" don't mess with EOL
set nofixendofline
set noendofline

" fzf = Ctrl-P
nmap <silent> <C-p> :Files<cr>

" Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
