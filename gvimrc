if hostname() == 'ubuntu'
    set guifont=Ubuntu\ Mono\ 12
elseif has("win32")
    set guifont=Consolas:h12
else
    set guifont=Monaco:h12
endif

set columns=84

set guioptions-=m   " menu bar
set guioptions-=T   " toolbar
set guioptions-=l   " disable left scrollbar
set guioptions-=L   " disable left scrollbar while vertical split (NERDTree)
set guioptions-=r   " disable right scrollbar
set guioptions-=b   " disable bottom scrollbar
