require "helpers/globals"
require "helpers/keyboard"
local telescope_helpers = require("helpers.telescope")

-- Basic stuff 😡
im('jk', "<esc>")
nm("<leader><leader>", "<cmd>Telescope<cr>")
nm("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
nm("<leader>o", telescope_helpers.open_file)
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
