----------------------------------------------------------------------------
-- Utils
----------------------------------------------------------------------------

_G.home = os.getenv('HOME') .. '/'
vim.env.MYVIMRC = home .. ".config/nvim/init.lua"
-- _G: A global variable (not a function) that holds the global environment
-- (that is, `_G._G = _G`). Lua itself does not use this variable;
-- changing its value does not affect any environment, nor vice-versa.
-- (Use `setfenv` to change environments.)

-- Wrapper around the map function
function _G.map(mode, lhs, rhs, options)
    local default = { noremap = true }
    local options = options or default
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Do a hard reload of the config by changing the value
-- of the loaded lua file to nul
function _G.ReloadConfig()
    for name,_ in pairs(package.loaded) do
      if name:match('^plugins') then
        package.loaded[name] = false
      end
      if name:match('^config') then
        package.loaded[name] = false
      end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Config reloaded")
end

-- Wrapper around the require method
-- Allow to load plugin without an hard crash
-- function _G.load(path)
--   local loaded, response = pcall(require, path)
--   if not loaded then
--     print(path, ' ', 'was not loaded')
--     print('Stack: ', vim.inspect(response))
--   end
-- end
