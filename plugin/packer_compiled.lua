-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jansmrcka/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?.lua;/Users/jansmrcka/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?/init.lua;/Users/jansmrcka/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?.lua;/Users/jansmrcka/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jansmrcka/.cache/nvim/packer_hererocks/2.1.1736781742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\næ\3\0\0\b\0\15\0A5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\5\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\v\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\f\0'\5\14\0\18\6\0\0B\1\5\1K\0\1\0R<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>\6v\n<C-/>\n<C-c>\fcurrent\rlinewise\vtoggle\16Comment.api\frequire\n<C-_>\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["image.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  mellow = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/mellow",
    url = "https://github.com/mellow-theme/mellow.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\nå\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\fbuftype\1\3\0\0\rterminal\rquickfix\abo\rfiletype\1\0\1\rfiletype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\4\19autoselect_one\2\24include_current_win\1\fbuftype\0\abo\0\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  osaka = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/osaka",
    url = "https://github.com/craftzdog/solarized-osaka.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tokyonight = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/Users/jansmrcka/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\nå\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\fbuftype\1\3\0\0\rterminal\rquickfix\abo\rfiletype\1\0\1\rfiletype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\4\19autoselect_one\2\24include_current_win\1\fbuftype\0\abo\0\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\næ\3\0\0\b\0\15\0A5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\6\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\5\n\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\5\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\v\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\r\0'\4\f\0'\5\14\0\18\6\0\0B\1\5\1K\0\1\0R<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>\6v\n<C-/>\n<C-c>\fcurrent\rlinewise\vtoggle\16Comment.api\frequire\n<C-_>\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
