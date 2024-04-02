local linter_helper = require("helpers.lint")

local lint = require("lint")
lint.linters_by_ft = {
  javascript = {linter_helper.javascript.linter},
  javascriptx = {linter_helper.javascript.linter},
  typescript = {linter_helper.javascript.linter},
  typescriptx = {linter_helper.javascript.linter},
  vue = { "eslint_d", "stylelint" },
  scss = { "stylelint" },
  -- lua = { "luacheck" }
}

vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
