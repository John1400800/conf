vim.opt.lazyredraw = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildoptions:append('fuzzy')
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 5

vim.api.nvim_set_keymap('n', '<F4>', ':nohlsearch<CR>', { noremap = true, silent = true })
