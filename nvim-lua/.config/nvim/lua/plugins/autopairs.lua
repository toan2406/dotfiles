local npairs = require('nvim-autopairs')

npairs.setup()

npairs.get_rule("'"):with_pair(function()
  if vim.bo.filetype == 'reason' then
    return false
  end
end)

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true,
})

