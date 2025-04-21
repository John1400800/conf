local opt = vim.opt
opt.lazyredraw = true
opt.clipboard = 'unnamedplus'
opt.wildoptions:append('fuzzy')
opt.relativenumber = true
opt.number = true
opt.numberwidth = 3
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.ignorecase = true
opt.smartcase = true
opt.shiftwidth = 4
opt.expandtab = true
opt.scrolloff = 5
opt.linebreak = true
opt.splitbelow = true
opt.splitright = true
opt.dictionary:append('~/download/russian.utf-8')
opt.langmap =
[=[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{},фисвуапршолдьтщзйкыегмцчнябюжэхъ;abcdefghijklmnopqrstuvwxyz\,.\;\'[]]=]

local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
local result = handle:read("*a")
handle:close()

if result:match("prefer%-dark") then
    opt.background = "dark"
elseif result:match("prefer%-light") then
    opt.background = "light"
else
    opt.background = "dark"  -- значение по умолчанию
end

opt.termguicolors = true
vim.cmd.colorscheme('pinky1')
vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })

local autocmd = vim.api.nvim_create_autocmd

autocmd('FileType', {
  pattern = { 'text', 'markdown', 'tex' },
  callback = function()
    opt.spell = true
    opt.spelllang = 'ru,en'
  end,
})
autocmd('FileType', {
  pattern = 'c',
  callback = function()
    opt.makeprg = 'gcc -Wall -Wextra -Wconversion -Wshadow %'
  end,
})
autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    opt.makeprg = 'g++ -g $CXXFLAG %'
  end,
})
autocmd('FileType', {
  pattern = 'python',
  callback = function()
    opt.makeprg = 'python %'
  end,
})
autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    opt.makeprg = 'tectonic %' -- 'latexmk -pdf -aux-directory=/tmp/ %'
  end,
})
autocmd('TermOpen', {
  callback = function()
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, buffer = true })
  end,
})

autocmd('FileType', {
  pattern = { 'lua', 'tex', 'kdl', 'css', 'html' },
  callback = function()
    opt.shiftwidth = 2
  end,
})

-- vim.lsp.config('*', {
--   capabilities = {
--     textDocument = {
--       semanticTokens = {
--         multilineTokenSupport = true,
--       },
--       completion = {
--         completionItem = {
--           snippetSupport = true,
--         }
--       }
--     }
--   },
--   root_markers = { '.git' },
-- })

vim.lsp.enable({'lua_ls', 'clangd', 'ruff', 'pylsp', 'sqls', 'texlab', 'rust_analyzer'})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function()
--     vim.diagnostic.config({
--       virtual_text = true
--     })
--   end,
-- })

require('supermaven-nvim').setup {}
require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "kdl", "lua", "python", "rust", "vim", "markdown", "toml" },
  sync_install = false,
  highlight = { enable = true, disable = { "latex", "vimdoc" } },
  indent = { enable = true },
  modules = {},          -- explicitly add an empty table for modules
  ignore_install = {},   -- explicitly add an empty table for ignore_install
  auto_install = true,   -- explicitly set auto_install to false
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "v",
      node_decremental = "V",
    },
  }
}

