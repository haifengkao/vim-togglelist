" vim: fdm=marker:et:ts=4:sw=2:sts=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! togglelist#GetBufnrsList(...) " --------------------------------------------------------------------------{{{1
""
" Description: Returns a list of buffer numbers of type 'Location List' or 'Quickfix' type buffers
" Arguments: If no arguments are specified, returns a list of bufnrs obtained from :buffers
"   a:1 (str) : "Location List" - Return a list of "Location List" bufnrs
"             : "Quickfix"      - Return a list of "Quickfix" bufnrs
"
  redir => buflist
  silent! buffers
  redir END
  if (a:0 > 0)
    return map(filter(split(buflist, '\n'), 'v:val =~? a:1'), 'str2nr(matchstr(v:val, "\\d\\+"))')
  else
    return map(split(buflist, '\n'), 'str2nr(matchstr(v:val, "\\d\\+"))')
  endif
endfunction


function! togglelist#IsLocationListBuffer(...) " -------------------------------------------------------------------{{{1
""
" Description: Return 1 if the current buffer contains a Location List else return 0
" Arguments:   If no arguments are given, check current buffer. Else check the bufnr provided
"
  let bufnr = ( a:0 > 0 ? a:1 : bufnr('%'))
  return ( match(togglelist#GetBufnrsList("Location List"), bufnr) != -1 )
endfunction


function! togglelist#IsQuickfixBuffer(...) " -----------------------------------------------------------------------{{{1
""
" Description: Return 1 if the current buffer contains a Location List else return 0
" Arguments:   If no arguments are given, check current buffer. Else check the bufnr provided
"
  let bufnr = ( a:0 > 0 ? a:1 : bufnr('%'))
  return ( togglelist#GetBufnrsList("Quickfix")[0] == bufnr )
endfunction

function! togglelist#ToggleQuickfix()
  if togglelist#CloseBuffer()
    return
  endif
  if empty(togglelist#GetBufnrsList("Quickfix"))
    execute g:ToggleList.cmd.copen
  else
    execute g:ToggleList.cmd.cclose
  endif
endfunction

function! togglelist#CloseBuffer() " ------------------------------------------------------------------------{{{1
  echom &bt
  " If current buffer has &bt=quickfix, `lclose` and return
  " Note: If current buffer is a Quickfix and not Location List, then `lclose` has no effect
  if &bt ==? "quickfix"
    execute g:ToggleList.cmd.cclose
    execute g:ToggleList.cmd.lclose
    return 1
  endif

  if &bt ==? "nofile"
    execute g:ToggleList.cmd.close
    return 1
  endif

  if &bt ==? "nowrite"
    execute g:ToggleList.cmd.close
    return 1
  endif

  if &bt ==? "help"
    execute g:ToggleList.cmd.close
    return 1
  endif
  return 0
endfunction

function! togglelist#ToggleLocationList() " ------------------------------------------------------------------------{{{1
""
" Description: If a Location List is associated with current buffer, close it. Else, open one
"

  if togglelist#CloseBuffer()
    return
  endif

  " If current buffer is not a quickfix, we need to find it's associated Location List.
  " winnr() provides a number for all open buffers. This number is different from the buffer number.
  " The winnr() of a Location List is 1 more than that of the buffer it is associated with
  " Also, winbufnr() - Buffer number of the window
  "       bufwinnr() - Window number of the buffer
  " Thus, if the buffer having the next window number is valid and is a Location List, we `lclose`. Else, we `lopen`
  let currbufnr = bufnr('%')
  let nextbufnr = winbufnr(winnr()+1)
  if (  ( nextbufnr != -1 )
   \ && ( togglelist#IsLocationListBuffer(nextbufnr) )
   \ )
    execute g:ToggleList.cmd.lclose
  else
    if g:ToggleList.quiet
      silent! execute g:ToggleList.cmd.lopen
    else
      execute g:ToggleList.cmd.lopen
    endif
  endif
endfunction
