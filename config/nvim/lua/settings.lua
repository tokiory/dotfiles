-- Licensed under MIT
-- 2024, Daniil Shilo (tokiory)

-- Set associating between turned on plugins and filetype
vim.cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Vim transparent window configuration
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Tabs {{{
vim.opt.expandtab = true                -- Use spaces by default
vim.opt.shiftwidth = 2                  -- Set amount of space characters, when we press "<" or ">"
vim.opt.tabstop = 2                     -- 1 tab equal 2 spaces
vim.opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
-- }}}

-- Clipboard {{{
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}

-- Folding {{{
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
-- }}}

-- Search {{{
vim.opt.ignorecase = true               -- Ignore case if all characters in lower case
vim.opt.joinspaces = false              -- Join multiple spaces in search
vim.opt.smartcase = true                -- When there is a one capital letter search for exact match
vim.opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
vim.opt.splitbelow = true               -- Put new windows below current
vim.opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
-- }}}

-- Swap {{{
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
-- }}}

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
