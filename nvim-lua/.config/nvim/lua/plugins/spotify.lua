local term = require('FTerm.terminal')

local spotify_tui = term:new():setup({
  cmd = 'spt',
  dimensions = {
    height = 0.8,
    width = 0.7
  },
  border = 'single'
})

_G.__fterm_spotify_tui = function()
  spotify_tui:toggle()
end

vim.cmd [[
  command! Spotify call v:lua.__fterm_spotify_tui()
]]

