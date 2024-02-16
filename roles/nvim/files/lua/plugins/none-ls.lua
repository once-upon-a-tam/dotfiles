return {
  {
    "nvimtools/none-ls.nvim",
    config = function ()
      -- the package is still referenced as "null-ls" even though it's none-ls.
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- github actions
          null_ls.builtins.diagnostics.actionlint,

          -- ansible
          null_ls.builtins.diagnostics.ansiblelint,

          -- terraform
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.diagnostics.tfsec,

          -- latex
          null_ls.builtins.diagnostics.chktex,

          -- common spelling mistakes
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.formatting.codespell,

          -- lua
          null_ls.builtins.formatting.stylua,

          -- go
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.gofmt,

          -- javascript
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d,

          --css
          null_ls.builtins.formatting.stylelint,
        },
      })

      vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, {})
    end
  },
}
