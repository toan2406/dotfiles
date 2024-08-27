return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_save_location = '~/Workspace/Playground/postgresql-tutorial'
    end,
  },

  {
    'tpope/vim-dadbod',
    lazy = true,
  },
}
