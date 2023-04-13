local lazy = require('diffview.lazy')
local lib = lazy.require('diffview.lib')

require('diffview').setup({
  enhanced_diff_hl = true,
  use_icons = false,
  keymaps = {
    file_history_panel = {
      {'n', 'gb', function()
        local view = lib.get_current_view()
        local item = view.panel:get_item_at_cursor()
        vim.cmd('GBrowse ' .. item.commit.hash)
        -- vim.cmd('GBrowse ' .. item.commit.hash .. ':' .. item.files[1].path)
      end, {desc = 'Browse commit'}}
    }
  }
})

vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory %<CR>')

