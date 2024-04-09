vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local lazy = require("lazy")
  lazy.setup("plugins")

-- NOTE: Vitesse with colorbuddy doesn't work, we can fix this by swapping bundled with colorbuddy theme to vitesse
-- FIX: I'll write my own implementation of vitesse based on https://github.com/navarasu/onedark.nvim🫡
vim.cmd.colorscheme('gruvbuddy')
vim.cmd.colorscheme('vitesse')

require("settings")
require("keybindings")


opt.grepprg="rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
