" ----------------------------------------------------------
"
" *****
"
" The Vi IMproved configuration file. 
"
" Config created by bosha.
" Some cool stuff i get from Derek Wyatt's configuration 
" file. You can find the original Derek's config at his
" site - http://www.derekwyatt.org
"
" Feel free to contact with me: thebosha[@]gmail.com
" Also visit my site for more cool stuff: http://the-bosha.ru
"
" *****
"
" ----------------------------------------------------------

" ----------------------------------------------------------
" " Some Global stuff
" ----------------------------------------------------------

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Automatically indent
set autoindent

" Remove unsed white spaces
set shiftround

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Make command line two lines high
set ch=2

" set no visual bell. 
set novisualbell

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Don't remove buffer when we switch to next
set hidden

" Don't update the display while executing macros
set lazyredraw

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=10

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Turn tabs into spaces
set expandtab

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Stop searching at the end of file
set nowrapscan

" Default encoding
set termencoding=utf-8

" I really don't need those stupid swap files
set noswapfile

" " Turn On Xclipboard
set clipboard+=unnamed  " On xclipboard
set virtualedit=all     " On Virtual Edit for all modes
set go+=a               " Vim select copy selected to clipboard 

" http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282 
set t_RV=               

" ----------------------------------------------------------
" " Stuff to make vim looks better
" ----------------------------------------------------------

" I really don't like default vim color scheme, so i 
" prefere xoria256
colorscheme xoria256

" Set the status line 
set statusline=%<%f%h%m%r%=\ %l,%c%V

" Always show status line
set laststatus=2

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Show cursor all the time
set ruler   

" Highlight the line where cursor
set cursorline

" Show uncompleted commands in status bar
set showcmd   

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"

" Set up the GVim window colors and size
if has("gui_running")
    "set guifont="Monaco \10"
    set guifont=UbuntuBetaMono\ 12
    colorscheme xoria256
    if !exists("g:vimrcloaded")
        winpos 0 0
        if ! &diff
            winsize 130 90
        else
            winsize 227 90
        endif
        let g:vimrcloaded = 1
    endif
endif
:nohls

" ----------------------------------------------------------
" " Mappings
" ----------------------------------------------------------

set keymap=russian-jcukenwin "Switch keys

let b:keymap_name='RU'
set iminsert=0 " Latin charset by default
set imsearch=0 " Latin charset by default in search mode

" Leader key
let mapleader = ","

" Turn off that stupid search highlights
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" F5 - List all buffers 
nmap <F5> <Esc>:BufExplorer<cr>

" F6 - Previous buffer
map <F6> :bp<cr>

" F7 - Next buffer
map <F7> :bn<cr>

" F8 - Marks list
nmap <F8> :MarksBrowser<cr>

" C-c and C-v - Copy/Paste using global clipboard
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Shift-Insert like xterm
map <S-Insert> <MiddleMouse> 

" NERDTree
map <F9> :NERDTreeToggle<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

" Zencoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" ----------------------------------------------------------
" " Some other stuff 
" ----------------------------------------------------------

" Wsudo to write save changes with root privilegies
command Wsudo set buftype=nowrite | silent execute ':%w !sudo tee %' | set buftype= | e! %
