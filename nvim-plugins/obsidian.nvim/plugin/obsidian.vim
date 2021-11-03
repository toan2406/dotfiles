command! -nargs=1 Capture lua require('obsidian').capture(<f-args>)

command! Screenshot lua require('obsidian').screenshot()

function! s:sink(selection) abort
  exec "norm! a[[" . a:selection . "]]"
endfunction

function! s:get_source() abort
  let directory = luaeval("require('obsidian').config.directory")
  return "ls -1p " . directory . " | grep -v / | awk -F '.' '{print $1}'"
endfunction

command! LinkNote call fzf#run({
      \ 'source': s:get_source(),
      \ 'sink': function('s:sink'),
      \ 'down': '50%'
      \ })
