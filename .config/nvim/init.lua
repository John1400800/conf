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
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.api.nvim_set_keymap('n', '<F4>', ':nohlsearch<CR>', { noremap = true, silent = true })

vim.cmd.colorscheme 'pinky1'
vim.opt.background = 'light'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.makeprg = "gcc %"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.makeprg = "g++ %"
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
