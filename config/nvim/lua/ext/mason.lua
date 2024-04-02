--[[
File: mason.lua
Description: Mason plugin configuration (with lspconfig)
See: https://github.com/williamboman/mason.nvim
]]

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  ["tsserver"] = function ()
    lspconfig.tsserver.setup {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/Users/tokiory/.asdf/installs/nodejs/20.9.0/lib/node_modules/@vue/typescript-plugin",
            languages = {"javascript", "typescript", "vue"},
          },
        }
      },
      filetypes = {
        "vue",
        "javascript",
        "typescript",
      },
    }
  end,
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
}

mason.setup()
mason_lspconfig.setup({
  handlers = handlers,
  ensure_installed = {
    "lua_ls",             -- LSP for Lua language
    "tsserver",           -- LSP for Typescript and Javascript
    "emmet_ls",           -- LSP for Emmet (Vue, HTML, CSS)
    "cssls",              -- LSP for CSS
    "pyright",            -- LSP for Python
    "volar",              -- LSP for Vue
    "gopls",              -- LSP for Go
  }
});

mason_lspconfig.setup_handlers(handlers)
