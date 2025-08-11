local fn = vim.fn
local start_time = fn.reltime()

require('general/settings')
require('general/mappings')
require('config.spellcheck')
require('config.lazy')

print('Loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(start_time))) .. ' seconds.')

-- Lua profiler
-- https://github.com/stevearc/profile.nvim

local should_profile = os.getenv('NVIM_PROFILE')

if should_profile then
  require('profile').instrument_autocmds()

  if should_profile:lower():match('^start') then
    require('profile').start('*')
  else
    require('profile').instrument('*')
  end
end

local function toggle_profile()
  local prof = require('profile')

  if prof.is_recording() then
    prof.stop()

    vim.ui.input({ prompt = 'Save profile to: ', completion = 'file', default = 'profile.json' }, function(filename)
      if filename then
        prof.export(filename)
        vim.notify(string.format('Wrote %s', filename))
      end
    end)
  else
    prof.start('*')
  end
end

vim.keymap.set('', '<C-\\>', toggle_profile)
