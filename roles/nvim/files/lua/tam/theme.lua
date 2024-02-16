require('gruvbox').setup({
  bold = true,
  contrast = 'hard',
  transparent_mode = true,
})

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.guicursor = 'a:block'
vim.api.nvim_command('colorscheme gruvbox')
