-- [[ keymaps.lua ]]

vim.g.mapleader = " "
vim.g.localleader = " "

vim.keymap.set("i", "<S-Tab>", "<C-d>")

vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>")
vim.keymap.set("n", "<S-ScrollWheelUp>", "<ScrollWheelLeft>")
vim.keymap.set("n", "<S-ScrollWheelDown>", "<ScrollWheelRight>")
