local MARK_LEN = 24

local function pad_right(str, len, char)
  char = char or ' '

  if str:len() >= len then
    return str
  end

  return str .. string.rep(char, len - str:len())
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  opts = {
    marks = {
      create_list_item = function(config)
        local Path = require('plenary.path')

        local mark = vim.fn.input('Enter mark: ')

        if mark == '' then
          return nil
        end

        if mark:len() > MARK_LEN then
          mark = mark:sub(1, MARK_LEN)
        end

        local current_buf = vim.api.nvim_get_current_buf()
        local full_path = vim.api.nvim_buf_get_name(current_buf)
        local relative_path = Path:new(full_path):make_relative(config.get_root_dir())

        if relative_path == '' then
          return nil
        end

        local current_line = vim.api.nvim_get_current_line()

        local pos = vim.api.nvim_win_get_cursor(0)

        local value = vim.fn.join({
          pad_right(mark, MARK_LEN),
          ' ',
          relative_path,
          ':',
          pos[1],
          ':',
          pos[2] + 1,
          ':',
          current_line,
        }, '')

        return {
          value = value,
          context = {
            row = pos[1],
            col = pos[2] + 1,
            path = relative_path,
          },
        }
      end,

      select = function(list_item)
        if list_item == nil then
          return
        end

        local bufnr = vim.fn.bufnr(list_item.context.path)

        if bufnr == -1 then
          bufnr = vim.fn.bufadd(list_item.context.path)
        end

        if not vim.api.nvim_buf_is_loaded(bufnr) then
          vim.fn.bufload(bufnr)
          vim.api.nvim_set_option_value('buflisted', true, {
            buf = bufnr,
          })
        end

        vim.api.nvim_set_current_buf(bufnr)

        vim.api.nvim_win_set_cursor(0, {
          list_item.context.row,
          list_item.context.col,
        })
      end
    },
  },
  keys = function()
    return {
      {
        '<leader>hm',
        function()
          require('harpoon'):list('marks'):add()
        end,
        desc = 'Harpoon Mark',
      },
      {
        '<leader>hh',
      },
      {
        '<leader>hc',
        function()
          require('harpoon'):list('marks'):clear()
        end,
        desc = 'Harpoon Clear',
      },
    }
  end,
  config = function(_, opts)
    local harpoon = require('harpoon')
    local fzf_lua = require('fzf-lua')

    harpoon.setup(opts)

    local function toggle_fzf()
      local fzf_contents = {}
      local harpoon_entries = {}

      for _, item in ipairs(harpoon:list('marks').items) do
        table.insert(fzf_contents, item.value)
        harpoon_entries[item.value] = item
      end

      local header = vim.fn.join({ pad_right('mark', MARK_LEN), 'file/text' })

      fzf_lua.fzf_exec(fzf_contents, {
        header = header,
        prompt = 'Select a mark> ',
        actions = {
          ['default'] = function(selected, fzf_opts)
            local harpoon_item = harpoon_entries[selected[1]]
            local file = vim.fn.join({
              harpoon_item.context.path,
              harpoon_item.context.row,
              harpoon_item.context.col
            }, ':')

            fzf_lua.actions.file_edit({ file }, fzf_opts)
          end
        },
      })
    end

    vim.keymap.set('n', '<leader>hh', toggle_fzf, { desc = 'Harpoon Quick Menu' })
  end,
}
