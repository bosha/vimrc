" ----------------------------------------------------------
"
" *****
"
" The Vi IMproved configuration file. 
"
" Config created by bosha.
"
" Feel free to contact with me: thebosha[@]gmail.com
"
" *****
"
" ----------------------------------------------------------
" " Vundle configuration
" ----------------------------------------------------------
 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
" ============================
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'mattn/zencoding-vim'
let g:user_zen_expandabbr_key = '<C-e>'

Bundle 'vim-scripts/TaskList.vim'

Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'ap/vim-css-color'

" NERDTree
Bundle 'scrooloose/nerdtree'
map <F9> :NERDTreeToggle<CR>

Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

" For syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" vim-scripts repos
" ============================
Bundle 'minibufexpl.vim'

Bundle 'Tagbar'
nmap <F8> :TagbarToggle<CR>

" tComment
Bundle "tComment"
nnoremap <silent> // :TComment<CR>
vnoremap <silent> // :TComment<CR>
" nnoremap <silent> <C-_> :TComment<CR>
" vnoremap <silent> <C-_> :TComment<CR>

" My favorite colorscheme
Bundle "xoria256.vim"
colorscheme xoria256

" Other plugins hosted on any other git hosting
" ============================
" Command-T
Bundle "git://git.wincent.com/command-t.git"
map <C-T> :CommandT<CR>
" let g:CommandTMatchWindowAtTop=1 " show window at top

filetype plugin indent on 

" ----------------------------------------------------------
" " Vim settings
" ----------------------------------------------------------
" Disable vi compatibility.
set nocompatible

" Switch on syntax highlighting.
syntax on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Turn tabs into spaces
set expandtab

" Automatically indent
set autoindent
" Remove unsed white spaces set shiftround

" set the search scan to wrap lines
set wrapscan

" Make command line two lines high
set ch=2

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=cesB$

" Show 'invisibles'
set list

" Set the status line 
set statusline=%<%f%h%m%r%=\ %l,%c%V

" Always show status line
set laststatus=2

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
" set scrolloff=8
set scrolloff=999

" Show cursor all the time
set ruler   

" Highlight the line where cursor set cursorline

" Show uncompleted commands in status bar
set showcmd   

" Don't remove buffer when we switch to next
set hidden

" Show the current mode
set showmode

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Incrementally match the search
set incsearch

" Stop searching at the end of file
set nowrapscan

" add some line space for easy reading
set linespace=1         

" Highlight 80 column
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    highlight CursorLine ctermbg=235 guibg=#2c2d27
    highlight CursorColumn ctermbg=235 guibg=#2c2d27
    let &colorcolumn=join(range(81,999),",")
else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

" Set width to 80 colums
set textwidth=80

" Turn on line wrap
set wrap

" Breaking lines without breaking them 
set linebreak           

" Default encoding
set termencoding=utf-8

" Default encoding
set encoding=utf8

" Turn On Xclipboard
set clipboard+=unnamed  " On xclipboard
set virtualedit=all     " On Virtual Edit for all modes
set go+=a               " Vim select copy selected to clipboard 

" Enable search highlighting
set hlsearch

" Show matching brackets.
set showmatch 

" Bracket blinking.
set matchtime=5

" Line numbers off
set nonumber 

" No blinking
set novisualbell 

" No noise.
set noerrorbells

" disable any beeps or flashes on error
set vb t_vb= 

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

" Turn off backup files
set nobackup 

" Turn off swap files
set noswapfile

" 256 colours
set t_Co=256

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

" Символ табуляции и конца строки
if has('multi_byte')

    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59

    if version >= 700
        " set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬
        set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
    else
        set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
    endif
endif

" Symbol before wrapped line
if has("linebreak")
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

" Set up the GVim window colors and size
if has("gui_running")
    set guifont=Ubuntu\Mono\ 14
    if !exists("g:vimrcloaded")
        winpos 0 0
        if ! &diff
            winsize 130 90
        else
            winsize 227 90
        endif
        let g:vimrcloaded = 1
    endif

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
endif

" ----------------------------------------------------------
" " Mappings
" ----------------------------------------------------------

" pressing ; will go into command mode
nnoremap ; :

" Leader key
let mapleader = ","

" Disable the F1 key (which normally opens help)
" coz I hit it accidentally.
noremap <F1> <nop>

" Ctrl-P \ Ctrl-N for next\prev buffers
nnoremap <silent> <C-P> :bp<cr>
nnoremap <silent> <C-N> :bn<cr>

" C-c and C-v - Copy/Paste using global clipboard
vmap <C-C> <esc> "+yi
imap <C-V> <esc>"+gPi

" Shift-Insert like xterm
map <S-Insert> <MiddleMouse> 

" show/Hide hidden Chars
" map <silent> <F12> :set invlist<CR> 
map <silent> ,i :set invlist<CR> 

 " ,r
" Find && Replace in all opened buffers
" http://vim.wikia.com/wiki/VimTip382
function! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
    :unlet! s:word
endfunction
map <Leader>r :call Replace()<CR>

" <Esc><Esc>
" Clear the search highlight in Normal mode
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" ,f
" Fast grep
" grep in current dir by word under cursor
map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>

" Moving in insert mode using Ctrl-h\j\k\l
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" 'Centered' search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Don't skip wrap lines
noremap j gj
noremap k gk
