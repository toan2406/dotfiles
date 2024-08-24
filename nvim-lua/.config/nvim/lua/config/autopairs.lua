local npairs = require('nvim-autopairs')

npairs.setup()

npairs.get_rule("'")[1]:with_pair(function()
  if vim.bo.filetype == 'reason' then
    return false
  end
end)

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- Insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))

