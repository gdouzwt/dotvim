set nocompatible
set nobackup
set noswapfile
set nowritebackup
set nu
set ts=4
set sw=4
set enc=utf-8
set fenc=utf-8
"behave mswin

if !exists("g:syntax_on")
	syntax enable
  	colorscheme dracula
endif

set diffexpr=MyDiff()
"============================================================================
" Define custom diff function
"============================================================================
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

    "Only apply to .txt files...
    augroup HelpInTabs
        autocmd!
        autocmd BufEnter  *.txt   call HelpInNewTab()
    augroup END

    "Only apply to help files...
    function! HelpInNewTab ()
        if &buftype == 'help'
            "Convert the help window to a tab...
            execute "normal \<C-W>T"
        endif
    endfunction

"============================================================================
" applicable to gVim
"============================================================================
if has('gui_running')
  au GUIEnter * simalt ~x "maximize window on startup
  set guioptions-=T  " no toolbar
  if has('gui_win32')
    set nobackup
    set guioptions-=m  "remove menu bar
    set guioptions-=T  " no toolbar
    set guioptions+=r  " no left scroll bar
    set guioptions+=aA  " no visual mode
    set guifont=Jetbrains_Mono:h14:cANSI
    set linespace=0
  else
    set guifont=Jetbrains_Mono:h14:cANSI
  endif
endif
