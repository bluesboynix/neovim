return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- Formatters
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        -- Go diagnostics
        null_ls.builtins.diagnostics.golangci_lint,
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })
  end,
}
