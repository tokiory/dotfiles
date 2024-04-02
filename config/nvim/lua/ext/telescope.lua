--[[
  File: telescope.lua
  Description: Telescope plugin configuration
  See: https://github.com/nvim-telescope/telescope.nvim
]]

local telescope = require("telescope")
telescope.setup({
  pickers = {
    oldfiles = {
      cwd_only = true,
    },
    -- find_files = {
    --   find_command = {
    --     "fd",
    --     ".",
    --     "--type",
    --     "file",
    --     "--hidden",
    --     "--strip-cwd-prefix"
    --   }
    -- }
  },
})

