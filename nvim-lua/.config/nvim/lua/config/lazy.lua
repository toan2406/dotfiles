local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugins.colorscheme'),
  require('plugins.diffview'),
  require('plugins.cmp'),
  require('plugins.lsp'),
  require('plugins.treesitter'),
  require('plugins.vifm'),
  require('plugins.fzf'),
  require('plugins.harpoon'),
  require('plugins.ui'),
  require('plugins.editor'),
  require('plugins.git'),
  require('plugins.copilot'),
  require('plugins.dadbod'),
  require('plugins.lang'),
  require('plugins.extra'),

  -- Debug
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },

  -- Local plugins
  { dir = '~/.dotfiles/nvim-plugins/list-toggle.nvim', config = function() require('list-toggle') end },
  { dir = '~/.dotfiles/nvim-plugins/debug-helper.nvim' },
  { dir = '~/.dotfiles/nvim-plugins/obsidian.nvim' },
}, {
  defaults = {
    lazy = false,
  },
})
