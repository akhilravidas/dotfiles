

set nocompatible
set autochdir

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" use haskell highlighting on hsc files
autocmd BufNewFile,BufRead *.hsc set ft=haskell
autocmd BufNewFile,BufRead *.cabal set ft=cabal
autocmd BufNewFile,BufRead *.txt set ft=text
autocmd BufNewFile,BufRead README set ft=text

" kill any trailing whitespace on save
autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text
  \ autocmd BufWritePre <buffer>
  \ :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"
" general
"
set nocompatible

" searching
set incsearch                 " incremental search
set hlsearch                  " highlighting when searching

set backspace=indent,eol,start

" display
set number                    " show/hide line numbers (nu/nonu)
set showcmd                   " show command in last line
set showmatch                 " flashes matching paren when one is typed
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show row, column

" other
set undolevels=10000          " number of undos stored
set cryptmethod=blowfish

" Splits 
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Ctags to new split mapping
map <C-\> :vsp<CR>:exec("tjump ".expand("<cword>"))<CR>
map <A-]> :split<CR>:exec("tjump ".expand("<cword>"))<CR>

" Open vertical splits on :diffsplit
set diffopt=filler,vertical

nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" bind "gb" to "git blame" for visual and normal mode.
:vmap gb :<C-U>!git blame % -L<C-R>=line("'<") <CR>,<C-R>=line("'>") <CR><CR>
:nmap gb :!git blame % <CR>
" bind "hb" to "hg blame" for visual and normal mode.
" TODO figure out line blame in hg
:vmap hb :!hg blame -cu % <CR>
:nmap hb :!hg blame -cu % <CR>

set modeline

" To handle :W to :w
cnoreabbrev W w
colorscheme darkblue

" Switch between headers and source
map <F5> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F6> :vsp<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" FIXME Improve
command Recent new +setl\ buftype=nofile | 0put =v:oldfiles | nnoremap <buffer> <CR> :e <C-r>=getline('.')<CR><CR>
" Shortcut to get full path
command Path echo expand('%:p')

syntax on
set autoindent

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
autocmd BufNewFile,BufRead *.cpp match OverLength /\%81v.\+/
autocmd BufNewFile,BufRead *.h match OverLength /\%81v.\+/
autocmd BufNewFile,BufRead *.php match OverLength /\%81v.\+/
autocmd BufNewFile,BufRead *.java match OverLength /\%101v.\+/

set rtp+=$GOROOT/misc/vim

execute pathogen#infect()
" Required:
filetype plugin indent on

set tags=tags;/
