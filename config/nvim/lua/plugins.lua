-- Licensed under MIT
-- 2024, Daniil Shilo (tokiory)

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

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
      })

      mason_lspconfig.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["volar"] = function ()
          lspconfig.volar.setup({
            filetypes = { "vue" },
            init_options = {
              vue = {
                hybridMode = false,
              },
              typescript = {
                tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
              },
            },
          })
        end
      }
    end
  },

  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  { 'wakatime/vim-wakatime', lazy = false },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      default_component_configs = {
        name = {
          trailing_slash = true,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      window = {
        width = 35,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        }
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
      },
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          },
        },
        pickers = {
          oldfiles = {
            cwd_only = true,
          },
        },
      })

      telescope.load_extension("ui-select")
    end
  },

  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup{
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body) -- Luasnip expand
          end,
        },

        -- Mappings for cmp
        mapping = {

          -- Autocompletion menu
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
          ['<CR>'] = cmp.config.disable,                      -- Turn off autocomplete on <CR>
          ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>

          -- Use <C-e> to abort autocomplete
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(), -- Abort completion
            c = cmp.mapping.close(), -- Close completion window
          }),

          -- Use <C-p> and <C-n> to navigate through completion variants
          ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
          ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        },

        sources = cmp.config.sources({
          -- { name = 'codeium', priority = 100 }, -- AI
          { name = 'nvim_lsp' },                -- LSP
          { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
          { name = 'nvim_lua' },                -- Lua Neovim API
          { name = 'luasnip' },                 -- Luasnip
          { name = 'buffer' },                  -- Buffers
          { name = 'path' },                    -- Paths
          { name = "emoji" },                   -- Emoji
        }, {
        }),
      }

      -- Add snippets from Friendly Snippets
      require("luasnip/loaders/from_vscode").lazy_load()
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align',
        delay = 1000,
        ignore_whitespace = false,
      },
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {}
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        },

        -- Needed parsers
        ensure_installed = {
          "lua",
          "typescript",
          "javascript",
          "go",
          "python",
        },

        -- Install all parsers synchronously
        sync_install = false,

        -- Подсветка
        highlight = {
          -- Enabling highlight for all files
          enable = true,
          disable = {},
        },

        indent = {
          -- Disabling indentation for all files
          enable = false,
          disable = {},
        }
      }    
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = "BufEnter",
  },

  { "folke/neodev.nvim",     opts = {} },

  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function ()
      local mini_surround = require("mini.surround")
      mini_surround.setup()

      -- Pairs
      -- URL: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
      local mini_pairs = require("mini.pairs")
      mini_pairs.setup()

      -- Highlight patterns
      -- TODO: Maybe I need to remove todo-comments.nvim plugin, and swap it with this plugin
      local mini_hipatterns = require('mini.hipatterns')
      mini_hipatterns.setup({
        highlighters = {
          fixme = { pattern = '%f[%w]()FIX()%f[%W]', group = 'DiagnosticError' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'DiagnosticWarn' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'DiagnosticInfo' },
          note = { pattern = '%f[%w]()HACK()%f[%W]', group = 'DiagnosticInfo' },
          info = { pattern = '%f[%w]()INFO()%f[%W]', group = 'DiagnosticInfo' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = mini_hipatterns.gen_highlighter.hex_color(),
        },
      })

      -- Comments
      local mini_comments = require("mini.comment")
      mini_comments.setup()
    end
  },

  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    config = function()
      require('vitesse').setup()
    end
  }
}
