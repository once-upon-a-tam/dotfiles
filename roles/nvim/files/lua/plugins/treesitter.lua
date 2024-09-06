return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "comment",
          "bash",
          "dockerfile",
          "go",
          "css",
          "html",
          "jsdoc",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "lua",
          "make",
          "markdown",
          "vim",
          "go",
          "python",
          "hcl",
          "terraform",
          "yaml",
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autopairs = { enable = true },
      })
    end
  }
}
