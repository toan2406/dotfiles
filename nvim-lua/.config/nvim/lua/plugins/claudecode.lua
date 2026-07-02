return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    require('claudecode').setup({
      terminal = {
        provider = 'native', -- or snacks
        split_width_percentage = 0.40,
        auto_insert = false,
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

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'claude',
      callback = function(_)
        vim.keymap.set('n', 'gf', function()
          local file = vim.fn.expand('<cfile>')

          vim.cmd('wincmd h')
          vim.cmd('edit ' .. vim.fn.fnameescape(file))
        end, { buffer = true })

        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = true })
        vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', { buffer = true })
      end,
    })

    vim.keymap.set('n', '<leader>ac', '<CMD>ClaudeCode<CR>', { desc = 'Toggle Claude' })
    vim.keymap.set('n', '<leader>as', '<CMD>ClaudeCodeAdd %<CR>', { desc = 'Add To Claude' })
    vim.keymap.set('v', '<leader>as', '<CMD>ClaudeCodeSend<CR>', { desc = 'Send To Claude' })
    vim.keymap.set('n', '<leader>aa', '<CMD>ClaudeCodeDiffAccept<CR>', { desc = 'Accept Diff' })
    vim.keymap.set('n', '<leader>ad', '<CMD>ClaudeCodeDiffDeny<CR>', { desc = 'Deny Diff' })
  end,
}
