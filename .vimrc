" How to open personal filetypes
"autocmd BufReadPost,FileReadPre *.lib set filetype=clipper
autocmd BufReadPost,FileReadPre .bash_* set filetype=sh

" Remember the history
set viminfo='50,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" close (delete) a buffer
noremap <C-z> :bd<CR>

map <F5> :set wrap!<CR>
map <F6> :set number!<CR>
map <F7> :set spell! spelllang=en<CR>
map <F8> :set spell! spelllang=pt_br<CR>

"setting tab options to 2 spaces
set tabstop=2 " set tab to 2 spaces
set shiftwidth=2 " indent width for autoindent
set softtabstop=2
set expandtab " expand tab to spaces
set autoindent
" Set dots to tab
set listchars=tab:>.,trail:.
set list

set noerrorbells " don't make noise


" =================================================================================================
" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw
set ttyfast

"set cursorcolumn " highlight the current column
"set cursorline " highlight current line


" =================================================================================================
" Barra de Status
"set statusline=%04l;%02v\ [l;c]\ %F%m%r%h%w
set statusline=%<%F%h%m%r%h%w\ %=\ %04l;%02v\ %P
set laststatus=2 " Sempre exibe a barra de status

"Setting search methods
set incsearch
set hlsearch

" Enable syntax
syntax enable
filetype plugin on

" adding parenthesis highlight
let g:HiMtchBrktOn=1

set number
set background=light

" Mapping tag commands
"noremap ] <C-]>
noremap ] g<C-]>
noremap [ <C-T>
noremap { :tp<CR>
noremap } :tn<CR>
noremap g<C-t> :!np_tags.pl -q . ..\common C:\EZchip\EZdesign_NP_3_6.20b\mcode\include<CR>
noremap g<C-f> :!ctags --recurse<CR>
noremap g<C-g> :!grep -rin --color --exclude=tags --exclude=syntax.vim --exclude=*.bak --exclude=MetroE_* <cword> *<CR>
noremap g<C-b> :!grep -rn --color --exclude=tags --exclude=syntax.vim --exclude=*.bak --exclude=MetroE_* <cword> *<CR>
noremap g<C-v> :vimgrep <cword> ./**/*<CR>:cope<CR>
noremap g<C-r> :!rawTable2npsl.pl -f "%:p"<CR>

noremap g<C-h> :!txt2tags --encoding iso8859-1 -t html --style ./style.css -i "%:p"<CR>
noremap g<C-w> :!txt2tags --encoding iso8859-1 -t wiki --style ./style.css -i "%:p"<CR>

noremap g<C-u> :set fileencoding=utf-8<CR>
noremap g<C-i> :set fileencoding=iso8859-1<CR>

noremap <C-e> :call LogicalInversion()<CR>
function LogicalInversion()
  if getline(".") =~ "^.*false.*$"
    :s/false/true/
    echo "false -> true"
  elseif getline(".") =~ "^.*true.*$"
    :s/true/false/
    echo "true -> false"
  endif
endfunction

" Remap s to go to next word or _
noremap s :set iskeyword=@,48-57,192-255<CR>w:set iskeyword=@,48-57,_,192-255<CR>
noremap S :set iskeyword=@,48-57,192-255<CR>b:set iskeyword=@,48-57,_,192-255<CR>
"noremap ds :set iskeyword=@,48-57,192-255<CR>dw:set iskeyword=@,48-57,_,192-255<CR>
"noremap ys :set iskeyword=@,48-57,192-255<CR>yw:set iskeyword=@,48-57,_,192-255<CR>
"noremap das :set iskeyword=@,48-57,192-255<CR>daw:set iskeyword=@,48-57,_,192-255<CR>
"noremap yas :set iskeyword=@,48-57,192-255<CR>yaw:set iskeyword=@,48-57,_,192-255<CR>

"Paste structures
nnoremap g<C-d> byeoprint("(<ESC>pa: =>"..<ESC>pa.."<=)");<ESC>j0

map <C-p>t i-----------------------------------------------------------------------------------------------------------------------------<CR>                                                                                                  Estevan.Vedovelli<ESC>0<C-p><S-s>
nnoremap <C-p><S-d> "=strftime("%d/%m/%Y")<CR>P
nnoremap <C-p>d "=strftime("%d/%m/%Y")<CR>p
nnoremap <C-p><S-s> "=strftime("%Y-%m-%d")<CR>P
nnoremap <C-p>s "=strftime("%Y-%m-%d")<CR>p
nnoremap <C-p><S-h> "=strftime("%H:%M:%S")<CR>P
nnoremap <C-p>h "=strftime("%H:%M:%S")<CR>p

"noremap <C-]> <C-W><C-]>

"Navigate in buffers
map ( :bp<CR>
map ) :bn<CR>
map <C-TAB> )
map <C-S-TAB> )
"Opens windows (vertical, horizontal)
map \v <C-W>v
map \s <C-W>s
"Distributes the windows vertically equal and maximum (top is buf. browser)
map `= <C-W>=<C-W>_
map `[ 10<C-W><
map `] 10<C-W>>
map ¬{ 10<C-W>-
map ¬} 10<C-W>+

"map num pad to resize window
map <S-up>    <C-W>+
map <S-down>  <C-W>-
map <S-left>  <c-w><
map <S-right> <c-w>><left> 

"map search with center cursor
map <C-n> nzz

"search commands
" search all lines with the word
map gs :g/\<<C-R><C-W>\>/#<CR>
" search for CVS conflict sessions
map gc /[<]\{7}.*\_.\{-}[=]\{7}\_.\{-}[>]\{7}.*<CR>
" search for next TODO marker
map gt /\<TODO\><CR>

"scroll around
noremap <C-l> zl
noremap <C-h> zh
noremap <C-k> <C-y>
noremap <C-j> <C-E>

" Change windows
map <C-up> <C-W>k
map \k <C-W>k
map <C-down> <C-W>j
map \j <C-W>j
map <C-left> <C-W>h
map \h <C-W>h
map <C-right> <C-W>l
map \l <C-W>l

map \v <C-W>v
map \s <C-W>s

"scroll two files simultaneosly
map <C-o> <C-E><C-W>l<C-E><C-W>h
map <C-i> <C-y><C-W>l<C-y><C-W>h

"Mapping tab to esc
"inoremap <TAB> <ESC>
"vnoremap <TAB> <ESC>
"noremap  <TAB> <ESC>

"map exit
"map <C-C> :qa<return>
"map Z :q<return>

colorscheme desert256
"colorscheme slate_improved
"colorscheme earendel
"colorscheme candycode
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

function FoldBrace()
    if getline(v:lnum+1)[0] == '{'
        return 1 
    endif
    if getline(v:lnum) =~ '{'
        return 1 
    endif
    if getline(v:lnum)[0] =~ '}'
        return '<1'
    endif
    return -1
endfunction


let g:wrapnowrapflag=1
function WrapNowrap()
  if g:wrapnowrapflag == 1
    set wrap
    let g:wrapnowrapflag = 0
    echo "set wrap"
  else
    set nowrap
    let g:wrapnowrapflag = 1
    echo "set nowrap"
  endif
endfunction

let g:numbernonumberflag=0
function NumberNonumber()
  if g:numbernonumberflag == 1
    set number
    let g:numbernonumberflag = 0
    echo "set number"
  else
    set nonumber
    let g:numbernonumberflag = 1
    echo "set nonumber"
  endif
endfunction

set nowrap

set tags=tags

" Extra stuff
set t_Co=256 " Sets vim mode to 256 colors
set bs=2 " Enables backspace to delete characters

"set smartindent " turns on smart indent

set scrolloff=4 " Number of lines that the cursor will be from the bottom and top of the buffer
set sidescrolloff=15 " Number of columns that the cursor will be from the left and right of the buffer
set sidescroll=1 " Number of columns to jump when the cursor reach the side of the screen

"Enable f12 to toggle in hexedit mode
"noremap <F12> :Hexmode<CR>
"source ~/hexedit.vim

" Using the script to search for help in the NP tutorial
noremap K :!help_xpdf.pl -mapFile C:/Projetos/DMlib/util/scripts/help_xpdf_EZchip_NP-3_manual_3_5.map -str <cword> &<CR>


" Setting the tmp dir as backup dir
set backup
set backupdir=~/tmp
set dir=~/tmp

" File Completion mode
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest " turn on wild mode huge list
"set wildmode=longest:full



" Removing the Menus and bars
"set guioptions-=m "Remove menu bar
set guioptions-=T "Remove tool bar

" Jump to dir where tags file is. (max 8 levels)
if filereadable("tags")
elseif filereadable("../tags")
  cd ..
elseif filereadable("../../tags")
  cd ../..
elseif filereadable("../../../tags")
  cd ../../..
elseif filereadable("../../../../tags")
  cd ../../../..
elseif filereadable("../../../../../tags")
  cd ../../../../..
elseif filereadable("../../../../../../tags")
  cd ../../../../../..
elseif filereadable("../../../../../../../tags")
  cd ../../../../../../..
elseif filereadable("../../../../../../../../tags")
  cd ../../../../../../../..
endif

" Fullscreen on NT Windows
if has("gui_win32")
  autocmd GUIEnter * :simalt ~x
endif


