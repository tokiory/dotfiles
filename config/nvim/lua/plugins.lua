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
    require('bamboo').load()
  end,
},

  {
    'kvrohit/rasmus.nvim'
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
