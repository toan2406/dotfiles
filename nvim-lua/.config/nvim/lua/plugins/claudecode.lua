return {
  'coder/claudecode.nvim',
  dependencies = {},
  config = function()
    require('claudecode').setup({
      terminal = {
        provider = 'none',
      },
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = false,
      },
    })

    vim.keymap.set('n', '<leader>aa', '<CMD>ClaudeCodeAdd %<CR>', { desc = 'Add To Claude' })
    vim.keymap.set('v', '<leader>as', '<CMD>ClaudeCodeSend<CR>', { desc = 'Send To Claude' })
    vim.keymap.set('n', '<leader>ac', '<CMD>ClaudeCodeDiffAccept<CR>', { desc = 'Accept Diff' })
    vim.keymap.set('n', '<leader>ad', '<CMD>ClaudeCodeDiffDeny<CR>', { desc = 'Deny Diff' })
  end,
}
