table.unpack = table.unpack or unpack

return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  event = 'BufRead',
  config = function()
    local lazy = require('diffview.lazy')
    local lib = lazy.require('diffview.lib')
    local fzf_lua = require('fzf-lua')

    require('diffview').setup({
      enhanced_diff_hl = true,
      use_icons = false,
      keymaps = {
        file_history_panel = {
          { 'n', 'gb', function()
            local view = lib.get_current_view()
            local item = view.panel:get_item_at_cursor()
            vim.cmd('GBrowse ' .. item.commit.hash)
            -- vim.cmd('GBrowse ' .. item.commit.hash .. ':' .. item.files[1].path)
          end, { desc = 'Browse commit' } }
        }
      }
    })

    local git_log_cmd = 'git log --color --pretty=format:"%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset"'

    local function diff_commit_range()
      fzf_lua.fzf_exec(git_log_cmd, {
        prompt = 'Select commits> ',
        fzf_opts = {
          ['--multi'] = '2',
        },
        actions = {
          ['default'] = function(selected)
            local commit_1, commit_2 = table.unpack(selected)
            local commit_1_hash = commit_1:match('(%w+)')

            if commit_2 ~= nil then
              local commit_2_hash = commit_2:match('(%w+)')

              vim.cmd('DiffviewOpen ' .. commit_1_hash .. '..' .. commit_2_hash)
            else
              vim.cmd('DiffviewOpen ' .. commit_1_hash)
            end
          end,
        },
      })
    end

    vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory %<CR>')
    vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory %<CR>', { desc = 'Diffview file history' })
    vim.keymap.set('n', '<leader>dd', diff_commit_range, { desc = 'Diffview commit range' })
  end,
}
