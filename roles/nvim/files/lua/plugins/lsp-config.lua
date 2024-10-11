return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_installation = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "dockerls",     -- Docker
          "gopls",        -- Go
          "lua_ls",       -- Lua
          "html",         -- HTML
          "ltex",         -- Latex
          "biome",        -- Typescript
          "ansiblels",    -- Ansible
          "terraformls",  -- Terraform
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      lspconfig.html.setup({
        capabilities = capabilities
      })

      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      vim.diagnostic.config({
        signs = true,
        underline = true,
        virtual_text = false,
        float = {
          source = "always",
          border = "solid",
          focusable = false,
        },
      })
      vim.keymap.set("n", "K", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
