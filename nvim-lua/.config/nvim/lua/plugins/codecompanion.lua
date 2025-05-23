return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local function generate_slash_commands()
      local commands = {}

      for _, command in ipairs({ 'file', 'buffer' }) do
        commands[command] = {
          callback = 'strategies.chat.slash_commands.' .. command,
          description = 'Select a ' .. command .. ' using fzf',
          opts = {
            provider = 'fzf_lua',
            contains_code = true,
          },
        }
      end

      return commands
    end

    require('codecompanion').setup({
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                -- default = 'claude-3.7-sonnet-thought',
                default = 'gpt-4o',
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          slash_commands = generate_slash_commands(),
        },
        inline = {
          adapter = 'copilot',
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              description = 'Reject the suggested change',
            },
          },
        },
      },
      display = {
        chat = {
          show_header_separator = true,
          show_settings = true,
        },
        action_palette = {
          provider = 'default',
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
      prompt_library = {
        ['Code Expert'] = {
          strategy = 'chat',
          description = 'Get some special advice from an LLM',
          opts = {
            modes = { 'v' },
            short_name = 'expert',
            auto_submit = false,
            stop_context_insertion = true,
            user_prompt = false,
          },
          prompts = {
            {
              role = 'system',
              content = function(context)
                return 'I want you to act as a senior ' ..
                    context.filetype ..
                    ' developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples.'
              end,
            },
            {
              role = 'user',
              content = function(context)
                local text = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
                local filetype = context.filetype:gsub('react', '')

                return 'I have the following code:\n\n``` ' .. filetype .. '\n' .. text .. '\n```\n\n'
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>ac', '<CMD>CodeCompanionChat Toggle<CR>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<CMD>CodeCompanionActions<CR>', { noremap = true, silent = true })
    vim.keymap.set({ 'v' }, '<leader>ae', '<CMD>CodeCompanion /expert<CR>', { noremap = true, silent = true })

    vim.cmd([[cab cc CodeCompanion]])
  end,
}
