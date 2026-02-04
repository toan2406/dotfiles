return {
  'coder/claudecode.nvim',
  dependencies = {},
  config = function()
    require('claudecode').setup({
      terminal = {
        provider = 'none',
      },
    })

    vim.keymap.set('n', '<leader>aa', '<CMD>ClaudeCodeAdd %<CR>', { desc = 'Add To Claude' })
    vim.keymap.set('v', '<leader>as', '<CMD>ClaudeCodeSend<CR>', { desc = 'Send To Claude' })
    vim.keymap.set('n', '<leader>ac', '<CMD>ClaudeCodeDiffAccept<CR>', { desc = 'Accept Diff' })
    vim.keymap.set('n', '<leader>ad', '<CMD>ClaudeCodeDiffDeny<CR>', { desc = 'Deny Diff' })
  end,
}
