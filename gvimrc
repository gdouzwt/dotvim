"============================================================================
" applicable to gVim
"============================================================================
set guifont=Jetbrains_Mono:h14:cANSI
set lines=60 columns=120 linespace=1
if has('gui_win32')
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
  au GUIEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0) "fullscreen on startup
  set guioptions-=m  "remove menu bar
  set guioptions-=T  " no toolbar
  set guioptions-=L  " no left scroll bar
  set guioptions-=r  " no left scroll bar
  set guioptions+=aA  " no visual mode
endif
