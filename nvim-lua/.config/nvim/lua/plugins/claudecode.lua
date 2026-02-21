return {
  'coder/claudecode.nvim',
  dependencies = {},
  config = function()
    require('claudecode').setup({
      terminal = {
        provider = 'native',
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

    vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h')

    -- vim.keymap.set('n', 'gf', function()
    --   -- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/components/filename.lua
    --   if vim.fn.expand('%:t') ~= 'claude' then
    --     return vim.cmd('normal! gf')
    --   end

    --   local file = vim.fn.expand('<cfile>')

    --   vim.cmd('wincmd h')
    --   vim.cmd('edit ' .. vim.fn.fnameescape(file))
    -- end)

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'claude',
      callback = function(_)
        vim.keymap.set('n', 'gf', function()
          local file = vim.fn.expand('<cfile>')

          vim.cmd('wincmd h')
          vim.cmd('edit ' .. vim.fn.fnameescape(file))
        end, { buffer = true })
      end,
    })
  end,
}
