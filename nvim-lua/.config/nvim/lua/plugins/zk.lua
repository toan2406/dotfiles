local zk = require('zk')
local util = require('zk.util')
local commands = require('zk.commands')

local opts = {noremap = true, silent = false}

-- brew install zk
zk.setup({
  picker = 'fzf',
  lsp = {
    config = {
      cmd = {'zk', 'lsp'},
      name = 'zk',
    },
    auto_attach = {
      enabled = true,
      filetypes = {'markdown'},
    },
  },
})

commands.add('ZkInsertLink', function(options)
  zk.pick_notes(options, {multi_select = false}, function(note)
    local link = '[' .. note.title .. '](' .. note.path .. ')'
    vim.cmd('norm! a' .. link)
  end)
end)

commands.add('ZkLinkSelection', function(options)
  local selected_range = util.get_selected_range()
  local selected_text = util.get_text_in_range(selected_range)
  local A = selected_range['start']
  local B = selected_range['end']

  assert(A.line == B.line, 'Invalid range')

  zk.pick_notes(options, {multi_select = false}, function(note)
    local link = '[' .. selected_text .. '](' .. note.path .. ')'
    vim.api.nvim_buf_set_text(0, A.line, A.character, B.line, B.character, {link})
  end)
end, {needs_selection = true})

vim.api.nvim_set_keymap('n', '<leader>zn', ":ZkNew {title = vim.fn.input('Title: ')}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>zo', ":ZkNotes {sort = {'modified'}}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>zt', ":ZkTags<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>zf', ":ZkNotes {sort = {'modified'}, match = {vim.fn.input('Search: ')}}<CR>", opts)
vim.api.nvim_set_keymap('v', '<leader>zf', ":'<,'>ZkMatch<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>zi', ":ZkInsertLink<CR>", opts)
vim.api.nvim_set_keymap('v', '<leader>zi', ":'<,'>ZkLinkSelection<CR>", opts)

