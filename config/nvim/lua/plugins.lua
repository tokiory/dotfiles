--[[
File: ext.lua
Description: This file needed for loading plugin list into lazy.nvim and loading ext
Info: Use <zo> and <zc> to open and close foldings
See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "ext.mason"
    end
  },

  {
    'folke/flash.nvim',
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "ext.neotree"
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "ext.telescope"
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
      require "ext.cmp"
    end
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup()
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "ext.gitsigns"
    end
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
      require "ext.treesitter"
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
      require "ext.mini"
    end
  },

  {
    'Yazeed1s/oh-lucy.nvim'
  },

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    config = function()
      require('bamboo').setup {}
    end,
  },

  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    config = function()
      require("vitesse").setup({
  comment_italics = true,
  transparent_background = true,
  transparent_float_background = true, -- aka pum(popup menu) background
  reverse_visual = false,
  dim_nc = false,
  cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
  -- if `transparent_float_background` false, make telescope border color same as float background
  telescope_border_follow_float_background = false,
  -- similar to above, but for lspsaga
  lspsaga_border_follow_float_background = false,
  -- diagnostic virtual text background, like error lens
  diagnostic_virtual_text_background = false,
      })
    end
  },

  {
    'kvrohit/rasmus.nvim'
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
