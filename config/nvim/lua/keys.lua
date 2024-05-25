-- Licensed under MIT
-- 2024, Daniil Shilo (tokiory)

local map = vim.keymap.set
local telescope = require("telescope.builtin")

-- Normal mode keybinding setter
function nm(key, command) 
	map('n', key, command, {noremap = true})
end

-- Input mode keybinding setter
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- Visual mode keybinding setter
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- Terminal mode keybinding setter
function tm(key, command)
	map('t', key, command, {noremap = true})
end

-- Utility map
function um(mode, key, callback)
	vim.keymap.set(mode, 'lhs', callback, {noremap = true, expr = true})
end

-- Basic stuff 😡
im('jk', "<esc>")
nm("<leader><leader>", "<cmd>Telescope<cr>")
nm("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
nm("<leader>o", function ()
  local path = vim.loop.cwd() .. "/.git"
  local ok, _ = vim.loop.fs_stat(path)
  if ok then
    telescope.git_files()
  else
    telescope.find_files()
  end
end
)
nm("<leader>p", "<cmd>Telescope oldfiles<cr>")
nm("<leader>f", "<cmd>Telescope live_grep<cr>")
nm("<leader>v", "<cmd>Neotree left toggle<cr>")
nm("<leader><Tab>", "<cmd>Neotree buffers float toggle<cr>")


-- LSP 🤓
nm("gd", "<cmd>Trouble lsp_definitions<cr>");
nm('gr', "<cmd>Trouble lsp_references<cr>");
nm("ga", "<cmd>lua vim.lsp.buf.code_action()<cr>");
nm('<leader>x', "<cmd>TroubleToggle<cr>")
nm("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
nm("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
