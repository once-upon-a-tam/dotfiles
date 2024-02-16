-- Enable numbers and relative linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to 2 spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Disable text wrap
vim.opt.wrap = false

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch  = true

-- Ignore casing for improved search logic
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Pane splitting logic
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse interactions
vim.opt.mouse = "a"

-- Set completion behavior
--    noselect: doesn't select any option by default
--    menuone: displays the completion menu even if there is only one option
--    preview: displays additional information about the completion proposition
vim.opt.completeopt = { "menuone", "noselect", "preview" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Always display the sign column (prevents screen jumps)
vim.opt.signcolumn = "yes"

-- Enable access to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Set fold settings
-- See https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Always keep N lines above and below the cursor line unless at start/end of file
vim.opt.scrolloff = 8

-- Display column at 80 char
vim.opt.colorcolumn = "80"

-- Highlights the cursor line
vim.opt.cursorline = true

-- Prevents the cursor from blinking
vim.opt.guicursor = "a:block"


-- Set file encoding to UTF-8
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
