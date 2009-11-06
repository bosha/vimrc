"-------------------------
"" Basic Settings
"-------------------------
" " For vim outliner
filetype plugin indent on

" disable the welcome screen
set shortmess+=I        

" " Set encoding for autocompetition
set fileencodings=utf-8,cp1251,koi8-r,cp866

" " More pretty colors 
set t_Co=256

" " Setting up colorscheme
colorscheme xoria256

" " Set the reversal of lines according
set wrap
set linebreak

" " I am not really now why i add this line
set virtualedit=all

" " Cool stuff to view word which changes now
set cpoptions=ces$

" " Turning off capability with vi
set nocompatible

" " Show cursor all the time
set ruler  

" " Show uncompleted commands in status bar
set showcmd  

" " Switch on line numbering 
set nu

" " Folding on indentation
set foldmethod=manual

" " Search as you type
set incsearch

" " Stop the search at the end of file
set nowrapscan

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться
" в режиме редактирования
set scrolljump=7

" " Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" опуститься в режиме редактирования
set scrolloff=7

" " Set visual bell off
set novisualbell
set t_vb=   

" " Mouse support
" set mouse=a
" set mousemodel=popup

" " Default encoding
set termencoding=utf-8

" " Don't remove current buffer, when we switch to next.
set hidden

" " make command line height in one line
set ch=1

" " Hide mouse pointer when typing
set mousehide

" " Set autoindent
set autoindent

" " Syntax lighting
syntax on

" " Say to vim, that the background is black.
" " That give us more beauty colors :)
" set background=dark

" " Turn off backup files
set nobackup

" " Turn off swap files
set noswapfile

" " Conversion tab to spaces.
set expandtab

" " set default tab size
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

set cursorline

" " Paren mode 
" :let loaded_matchparen = 1
set showmatch

" " Status line format
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2

" " Set "smart" indent
set smartindent

" " Session option
set sessionoptions=curdir,buffers,tabpages

"-------------------------
"" Hotkeys
"-------------------------

" " Space in normal mode list pages
nmap <Space> <PageDown>

" CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" " C-c and C-v - Copy/Paste using "Global clipboard"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" " Shitf-Insert like xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" " Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
"
" " Quick Save by F2
"nmap <F2> :w<cr>
"vmap <F2> <esc>:w<cr>i
"imap <F2> <esc>:w<cr>i

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" " F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" " F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" " F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" " F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" " F10 - удалить буфер
" map <F10> :bd<cr>
" vmap <F10> <esc>:bd<cr>
" imap <F10> <esc>:bd<cr>

" " < & > - делаем отступы для блоков
" vmap < <gv
" vmap > >gv

" " Клавиши быстрого редактирования строки, в режиме вставки
" imap <C-J> <Left>
" imap <C-K> <Right>
" imap <C-L> <Del>

" " И командной строке
" cmap <C-K> <Right>
" cmap <C-J> <Left>
" cmap <C-L> <Del>

" " Moving the lines easily.
nmap <c-j> mz:m+<CR>`z==
nmap <c-k> mz:m-2<CR>`z==
imap <c-j> <Esc>:m+<CR>==gi
imap <c-k> <Esc>:m-2<CR>==gi
vmap <c-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <c-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z


" " Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" " Редко когда надо [ без пары =)
" imap [ []<LEFT>
" " Аналогично и для {
" imap {<CR> {<CR>}<Esc>O

" " С-q -  Quit vim ;)
map <C-Q> <Esc>:qa<cr>

" " Autocomplete by tab key
function InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
  return "\<tab>"
 else
  return "\<c-p>"
 endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>
         
 " " Where we put words to complete
set complete=""
 " From current Buffer
set complete+=.
 " " From dicts
set complete+=k
 " " From other buffers
set complete+=b
 " " From tags
set complete+=t

" Switches spelling

setlocal spell spelllang=ru,en
set wildmenu
set wcm=<Tab>
menu Spl.next ]s
menu Spl.prev [s
menu Spl.word_good zg
menu Spl.word_wrong zw
menu Spl.word_ignore zG
imap <F2> <Esc>:set spell!<CR>
nmap <F2> :set spell!<CR>
imap <C-F2> <Esc>:emenu Spl.<TAB>
nmap <C-F2> :emenu Spl.<TAB>

" " For snippet plugin
filetype plugin on

au BufRead,BufNewFile *.phps    set filetype=php
au BufRead,BufNewFile *.thtml    set filetype=php

" " If file head have #!/bin/ then chmod +x to file
" au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x | endif | endif

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" " Настройки для Tlist (показвать только текущий файл в окне навигации по
" коду)
" let g:Tlist_Show_One_File = 1
" 
" set completeopt-=preview
" set completeopt+=longest
" set mps-=[:]

" " Переключение раскладки, и индикация текущей
" function MyKeyMapHighlight()
"     if &iminsert == 0
"         hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
"     else
"         hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
"     endif
" endfunction

" " Вызываем функцию, что бы установила цвета при запуске вима
" call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки

" au WinEnter * :call MyKeyMapHighlight()

" cmap <silent> <C-F> <C-^>
" imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
" nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
" vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

" " if you need to save file with root permission, just type :Wsudo to save.
" command Wsudo set buftype=nowrite | silent execute ':%w !sudo tee %' | set buftype= | e! %

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
" cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" " VimCommander
noremap <silent> <F11> :cal VimCommanderToggle()<CR> 
