" vim: fdm=marker:et:ts=4:sw=2:sts=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToggleList
"
" Original Creator - Donald Ephraim Curtis (2011)
" Adapted by       - Kartik Shenoy (2014)
"
" A plugin to toggle the Quickfix and LocationList
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("g:loaded_togglelist")
  finish
endif
let g:loaded_togglelist=1

if !exists('g:ToggleList'           ) | let g:ToggleList            = {}       | endif
if !exists('g:ToggleList.quiet'     ) | let g:ToggleList.quiet      = 1        | endif
if !exists('g:ToggleList.cmd'       ) | let g:ToggleList.cmd        = {}       | endif
if !exists('g:ToggleList.cmd.copen' ) | let g:ToggleList.cmd.copen  = "copen"  | endif
if !exists('g:ToggleList.cmd.cclose') | let g:ToggleList.cmd.cclose = "cclose" | endif
if !exists('g:ToggleList.cmd.lopen' ) | let g:ToggleList.cmd.lopen  = "lopen"  | endif
if !exists('g:ToggleList.cmd.lclose') | let g:ToggleList.cmd.lclose = "lclose" | endif

command! ToggleQF call togglelist#ToggleQuickfix()
command! ToggleLL call togglelist#ToggleLocationList()

""" Suggested mappings (in the spirit of unimpaired)
"nnoremap coL :ToggleLL<CR>
"nnoremap coQ :ToggleQF<CR>
