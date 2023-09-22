-- Return a function that calls the require, instead of calling the require directly.
-- This is for "lazy-loading" so we only require it when we need it.
local telescope = function(f)
    return function()
        require('telescope.builtin')[f]()
    end
end

local teletable = { ff = 'find_files', fg = 'live_grep', fb = 'buffers', fh = 'grep_string' }

for k, v in pairs(teletable) do
    vim.keymap.set('n', '<leader>' .. k, telescope(v))
end
