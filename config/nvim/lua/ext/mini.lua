-- Surround
-- URL: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
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
    -- fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    -- hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    -- todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    -- note  = { pattern = '%f[%w]()INFO()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = mini_hipatterns.gen_highlighter.hex_color(),
  },
})

-- Comments
local mini_comments = require("mini.comment")
mini_comments.setup()
