" This is my vim configuration which has been used from 2010.
" NOTE: if unix error with ^M, try to convert CRLF by:
" :set ff=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
set clipboard+=unnamed
set nobackup
set tabstop=4
set shiftwidth=4
set tw=0
" set cc=73
set wrap
set noundofile
set expandtab
set splitbelow
set splitright
retab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" Bootstrap for starting with Vundle
if has("win32")
  let $HOME='C:/Users/'.$USERNAME
" elseif has('mac')
"   set rtp+=~/.vim_home/Vundle.vim
"   set rtp+=/usr/local/opt/fzf
"   call vundle#begin("~/.vim_home")
else
  " let s:uname = system("uname -s")
  " if s:uname == "Darwin\n"
      " mac terminal
      set rtp+=/usr/localsopt/fzf
      " set ttymouse=xterm2
  " else
      "linux
  " endif
endif

" gui special
if has("gui_running")
  " Gvim
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
  elseif has("gui_win32")
    " Win32/64 GVim
  elseif has("gui_macvim")
    " MacVim
    " https://stackoverflow.com/questions/2842078/how-do-i-detect-os-x-in-my-vimrc-file-so-certain-configurations-will-only-appl
    nnoremap <D-r> <C-r>
    nnoremap <D-[> <Esc>
    nnoremap <D-w> <C-w>
    nnoremap <D-p> <C-p>
    nnoremap <D-e> <C-e>
    nnoremap <D-u> <C-u>
    nnoremap <D-d> <C-d>
    
    inoremap <D-r> <C-r>
    inoremap <D-[> <Esc>
    inoremap <D-w> <C-w>
    inoremap <D-p> <C-p>
    inoremap <D-e> <C-e>
    inoremap <D-u> <C-u>
    inoremap <D-d> <C-d>
    
    vnoremap <D-r> <C-r>
    vnoremap <D-[> <Esc>
    vnoremap <D-w> <C-w>
    vnoremap <D-p> <C-p>
    vnoremap <D-e> <C-e>
    vnoremap <D-u> <C-u>
    vnoremap <D-d> <C-d>
  else
    echo "Unknown GUI system!!!!"
  endif
else
  " Terminal vim
endif

call plug#begin('~/.vim/plugged')

" plugin in Github
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'bsdelf/bufferhint'
Plug 'hsitz/VimOrganizer'
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-vinegar'

" note: this plugin supports editorConfig already
Plug 'maksimr/vim-jsbeautify'

" fuzzy finder
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" syntax highlight
Plug 'nblock/vim-dokuwiki'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'octol/vim-cpp-enhanced-highlight'

" theme
Plug 'mbbill/desertEx'
Plug 'morhetz/gruvbox'
Plug 'ajh17/Spacegray.vim'
Plug 'tomasr/molokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'

" plugin in http://vim-scripts.org/vim/scripts.html
Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/largeFile'
Plug 'vim-scripts/revolutions.vim'

" Plug 'yuttie/comfortable-motion.vim'

" All of your Plugins must be added before the following line
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts and Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set ambiwidth=double
set guifont=FiraMono_Nerd_Font:h16
set guifontwide=FiraMono_Nerd_Font:h16

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Remapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader key
let mapleader = " "



" Remap <ESC> to <C-[>
"nnoremap <C-[> <Esc>
" nnoremap <C-[> <Esc>
" vnoremap <C-[> <Esc>gV
" onoremap <C-[> <Esc>
" inoremap <C-[> <Esc>`^

" Remap buffer switch 
" nmap <silent> <leader>l :wincmd l<CR>
" nmap <silent> <leader>h :wincmd h<CR>
" nmap <silent> <leader>k :wincmd k<CR>
" nmap <silent> <leader>j :wincmd j<CR>
" nmap <silent> <C-x>t :tabnew<CR>
nmap <silent> <leader>wd :hide<CR>
nmap <silent> <leader>wm :only<CR>
nmap <silent> <leader>ws :sp<CR>
nmap <silent> <leader>wv :vsp<CR>

" Move cursor at input mode
" inoremap <M-h> <C-o>h
" inoremap <M-j> <C-o>j
" inoremap <M-k> <C-o>k
" inoremap <M-l> <C-o>l
" inoremap <M-b> <C-o>b
" inoremap <M-f> <C-o>w

nmap <silent> J 20j
nmap <silent> K 20k

" Diable mouse middle button paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Sync mapping with Firefox
nnoremap t :tabnew<space>

" redo
" nnoremap <leader>r r
" nmap r <c-r>

" copy current path
nmap <silent> Y :let @+ = expand("%:p")<CR>
" inoremap <Leader>p <ESC>pa
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufferhint
let g:bufferhint_MaxWidth = 50
let g:bufferhint_BufferName = '~buffers~'
nnoremap <silent> . :call bufferhint#Popup()<CR>

" ctags
set tags=tags,$ROOT/tags;
" set autochdir
map <silent> <F12> :silent! execute "!ctags -R ".$ROOT."/src"<CR><CR>

" fzf
let $FZF_DEFAULT_COMMAND='fd -a -j 4'
nnoremap <silent> <C-p> :Files<CR>

" fzf for Fd command - origin file is not that good
function! FdHandler(line)
  execute 'e '. s:escape(a:line)
  normal! zz
endfunction

command! -nargs=* Fd call fzf#run({
  \ 'source': 'fd -a -j 4 <args>',
  \ 'sink': function('FdHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
\ })

" fzf for qw command
" Also an example for all other open pattern
function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! QwHandler(line)
  let parts = split(a:line, '(')
  let [fn, rest_part] = parts[0 : 1]
  let parts = split(rest_part, ')')
  let [lno, rest_part] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

command! -nargs=+ Qw call fzf#run({
  \ 'source': 'qw "<args>"',
  \ 'sink': function('QwHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
\ })

" fzf for qwhere command
command! -nargs=+ Qwhere call fzf#run({
  \ 'source': 'qwhere "<args>"',
  \ 'sink': function('FdHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
\ })

" fzf for qtype command
function! QtypeHandler(line)
  let parts = split(a:line, ' ')
  let [fn, rest_part] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  normal! zz
endfunction

command! -nargs=+ Qtype call fzf#run({
  \ 'source': 'qtype "<args>"',
  \ 'sink': function('QtypeHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
\ })

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" tagbar
"let g:tagbar_ctags_bin = 'D:\workdir\TOOLBOX\wntx64\Ctags\5.8\ctags.exe'
map <silent> <F9> :TagbarToggle<cr> 

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" large file
let g:LargeFile = 2000

" NERDTree config
nnoremap <silent> , :NERDTreeToggle<CR>
" map <A-,> :NERDTreeToggle<CR>
" Open nerd tree as side bar and empty main panel
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open nerd tree as main
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | q | endif


" dokuwiki
let dokuwiki_comment=1
let g:dokuwiki_fenced_languages = ['ruby', 'xml', 'sh', 'c', 'perl' ]
au BufRead,BufNewFile *.dokuwiki set filetype=dokuwiki
set foldlevel=2

" VimOrganizer
if has("win32")
    let g:org_command_for_emacsclient = 'C:\msys64\usr\bin\emacsclient.exe'
else
    " Looks emacs is not required for common use case
    let g:org_command_for_emacsclient = '/usr/bin/emacsclient'
endif
let g:org_todo_setup='TODO WAIT | DONE CANCELED'

let g:ft_ignore_pat = '\.org'
filetype plugin indent on
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()
syntax on

" Ale
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'json':       ['jsonlint'],
\}

" Enable completion where available.
let g:ale_completion_enabled = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-e> <Plug>(ale_next_wrap)

" This is regular lightline configuration, we just added
" 'linter_warnings', 'linter_errors' and 'linter_ok' to
" the active right panel. Feel free to move it anywhere.
" `component_expand' and `component_type' are required.
"
" For more info on how this works, see lightline documentation.
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Singleton VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" note: work with my gvim.bat
" command -nargs=* -complete=custom,GetServerList Mt :call MoveTabToInstance(<f-args>)
" function MoveTabToInstance(var1)
"   let filename = expand('%:p')
"   set ro
"   call remote_send(a:var1, '<ESC>|<ESC>|:tabnew ' . filename . '<CR>')
"   execute 'wq!'
" endfunction
" 
" " Helper function to get application (server) list
" function GetServerList(ArgLead, CmdLine, CursorPos)
"   return serverlist()
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Toggle Menu and Toolbar
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=m
set showtabline=0
map <silent> <F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


" Display Setting
"" theme in conEmu
if !has("gui_running")
"    highlight Comment cterm=italic
"    highlight Comment term=italic

    " NOTE: Only for conEmu and non-cygwin case
    if !empty($ConEmuHWND) && empty($MSYSTEM) && !has('win32unix')
      set term=xterm
      set t_Co=256
      let &t_AB="\e[48;5;%dm"
      let &t_AF="\e[38;5;%dm"

      " map arrow key for conEmu 180626
      map [A <UP>
      map [B <DOWN>
      map [D <LEFT>
      map [C <RIGHT>
    endif   

"    forget why we need below, maybe is arrow key? it will delay the Esc
"    nmap <ESC>oA k
"    nmap <ESC>oB j
"    nmap <ESC>oC l
"    nmap <ESC>oD h    
"
"    imap <ESC>oA <C-o>k
"    imap <ESC>oB <C-o>j
"    imap <ESC>oC <C-o>l
"    imap <ESC>oD <C-o>h    
"    vnoremap <ESC><ESC> <ESC>

    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
    set mouse=a
endif

set nu
" let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
set bg=dark
colorscheme onedark
" unsued color config
" let g:gruvbox_contrast_dark='hard'
" hi Normal ctermfg=252 ctermbg=234 guifg=#ebdbb2 guibg=#1B1D1E
hi Normal ctermfg=none ctermbg=none guifg=#ABB2BF guibg=#282C34
" hi Normal ctermfg=252 ctermbg=234  guifg=#F8F8F2 guibg=#1c1c1c
" hi Visual term=reverse ctermbg=238 guibg=#686868

" auto-complete
set completeopt=longest,menu


" Disable HL for folded
hi Folded guibg=NONE ctermbg=NONE

" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
" CSI Ps SP q
"    Set cursor style (DECSCUSR, VT520).
"    Ps = 0  -> blinking block.
"    Ps = 1  -> blinking block (default).
"    Ps = 2  -> steady block.
"    Ps = 3  -> blinking underline.
"    Ps = 4  -> steady underline.
"    Ps = 5  -> blinking bar (xterm).
"    Ps = 6  -> steady bar (xterm).
if &term =~? "xterm" || &term =~? "rxvt"
    " cursor in insert mode
    let &t_SI = "\e[5 q"
    let &t_SR = "\e[3 q"
    let &t_EI = "\e[1 q"
    " let &t_SI = "\<Esc>[5 q"
    " let &t_SR = "\<Esc>[3 q"
    " let &t_EI = "\<Esc>[1 q"
     
    " optional reset cursor on start:
    augroup ResetCursorShape
    au!
    " autocmd VimEnter * silent !echo -ne "\e[1 q"
    autocmd VimEnter * :normal :startinsert :stopinsert 
    augroup END
endif

"
"     "autocmd VimEnter * let &t_me .= "\<Esc>[2 q"
"     " blinking vertical bar
"     let &t_SI = "\<Esc>[6 q"
"     " blinking block
"     let &t_EI = "\<Esc>[4 q"
"     " restore cursor
"     " TODO save instead of hard coding
"     autocmd VimLeave * let &t_me = "\<Esc>[4 q"
" endif

" scroll
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OOTB Vim config for vimdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction
" 

