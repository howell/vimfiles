" Vim configuration file
" by Sam Caldwell

" disable vi compatibility mode
set nocompatible

" replace tabs with 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" enable 256 colors and set colorscheme
set t_Co=256
syntax on
colorscheme jellybeans

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set backspace=indent,eol,start
set number         " show line numbers
set relativenumber " relative numbering, vim >= 7.4 required to use relative and
                   " absoulute line numbers
set ruler       " show row,column at bottom
set encoding=utf-8
set autoread    " automatically load changes to file made outside of vim
set scrolloff=2 " number of lines to keep above & below cursor

" highlight text past 80 characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Setup cscope
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    command -nargs=0 Cscope cs add $VIMSRC/src/scope.out $VIMSRC/src
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " highlight trailing whitespace
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " save and restore views
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Setup pathogen
execute pathogen#infect()

" Figure out what this does
let g:syntastic_always_populate_loc_list = 1
" Setup syntastic checkers
"let g:syntastic_cpp_checkers = ['gcc', 'oclint']
"let g:syntastic_cpp_oclint_args = "* -- -c"
"let g:syntastic_c_checkers = ['gcc', 'oclint']
"let g:syntastic_c_oclint_args = "* -- -c"
"let g:syntastic_aggregate_errors = 1

" ycm configuration
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0    " don't ask before loading a conf file

