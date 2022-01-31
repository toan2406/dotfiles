command! -nargs=1 ZCapture lua require('obsidian').capture(<f-args>)

command! ZScreenshot lua require('obsidian').screenshot()

function! s:sink(selection, bang) abort
  if a:bang == 1
    exec "norm! a[[" . a:selection . "]]"
  else
    exec "norm! a" . a:selection
  endif
endfunction

function! s:get_source() abort
  let directory = luaeval("require('obsidian').config.directory")
  return "ls -1p " . directory . " | grep -v / | awk -F '.' '{print $1}'"
endfunction

command! -bang ZLinkNote call fzf#run({
      \ 'source': s:get_source(),
      \ 'sink': { selection -> s:sink(selection, <bang>0) },
      \ 'down': '50%'
      \ })
