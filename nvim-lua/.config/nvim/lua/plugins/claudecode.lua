return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    require('claudecode').setup({
      terminal = {
        provider = 'snacks',
        split_width_percentage = 0.40,
        snacks_win_opts = {
          wo = {
            winhighlight = 'Normal:Normal',
          },
          keys = {
            term_normal = {
              '<Esc>',
              function()
                vim.cmd('stopinsert')
              end,
              mode = 't',
            },
            left_win = {
              '<C-w>h',
              function()
                vim.cmd('wincmd h')
              end,
              mode = 't',
            },
            gf = function()
              local file = vim.fn.expand('<cfile>')

              vim.cmd('wincmd h')
              vim.cmd('edit ' .. vim.fn.fnameescape(file))
            end,
          },
        },
      },
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = false,
      },
    })

    vim.keymap.set('n', '<leader>ac', '<CMD>ClaudeCode<CR>', { desc = 'Toggle Claude' })
    vim.keymap.set('n', '<leader>as', '<CMD>ClaudeCodeAdd %<CR>', { desc = 'Add To Claude' })
    vim.keymap.set('v', '<leader>as', '<CMD>ClaudeCodeSend<CR>', { desc = 'Send To Claude' })
    vim.keymap.set('n', '<leader>aa', '<CMD>ClaudeCodeDiffAccept<CR>', { desc = 'Accept Diff' })
    vim.keymap.set('n', '<leader>ad', '<CMD>ClaudeCodeDiffDeny<CR>', { desc = 'Deny Diff' })
  end,
}
