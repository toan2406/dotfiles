local curl = require('plenary.curl')
local M = {}

M.search = function(string)
  local words = vim.split(string, '%s+')
  local language = table.remove(words, 1)
  local query = table.concat(words, '+')

  local loc = '/tmp/chtsh'
  vim.cmd [[new +:setl\ autoread /tmp/chtsh]]
  vim.cmd [[setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber]]

  curl.get('http://cheat.sh/' .. language .. '/' .. query .. '?T', {
    output = loc,
    callback = vim.schedule_wrap(function(res)
      vim.cmd [[edit]]
      vim.fn.delete(loc)
    end)
  })
end

return M
