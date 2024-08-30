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

  -- Debug
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },

  -- Terminal
  'numtostr/FTerm.nvim',

  -- Misc
  'numToStr/Navigator.nvim',
  -- 'tversteeg/registers.nvim',
  { 'ellisonleao/glow.nvim', branch = 'main' },
  { 'chrisgrieser/nvim-spider', lazy = true },
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require('duck').hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require('duck').cook() end, {})
    end
  },

  -- Org mode
  { 'nvim-neorg/neorg', ft = 'norg', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-orgmode/orgmode', ft = 'org' },

  -- Local plugins
  { dir = '~/.dotfiles/nvim-plugins/list-toggle.nvim', config = function() require('list-toggle') end },
  { dir = '~/.dotfiles/nvim-plugins/debug-helper.nvim' },
  { dir = '~/.dotfiles/nvim-plugins/obsidian.nvim' },
}, {
  defaults = {
    lazy = false,
  },
})
