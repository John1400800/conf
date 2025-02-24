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
[=[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{},фисвуапршолдьтщзйкыегмцчнябюж.эхъ;abcdefghijklmnopqrstuvwxyz\,.\;/\'[]]=]
opt.background = 'light'
vim.cmd.colorscheme('pinky1')
vim.g.mapleader = ' '

local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    }
  }
}
lspconfig.pylsp.setup {}
lspconfig.ruff.setup {}
lspconfig.sqls.setup {}
lspconfig.texlab.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>;', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.document_symbol, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "Перейти к определению" }))
    vim.keymap.set('n', '<C-w>d', function()
      vim.cmd('split')
      vim.lsp.buf.definition()
    end, vim.tbl_extend('force', opts, { desc = "Открыть определение в вертикальном сплите" }))
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  callback = function(args)
    local bufnr = args.buf
    local keymaps = {
      '<leader>;', '<leader>d', '<leader>D', '<leader>a',
      '<leader>s', '<leader>r', 'gd', '<C-w>d'
    }
    for _, key in ipairs(keymaps) do
      pcall(vim.api.nvim_buf_del_keymap, bufnr, 'n', key)
    end
  end,
})

require('supermaven-nvim').setup {}
require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "kdl", "lua", "python", "rust", "vim", "markdown", "toml" },
  sync_install = false,
  highlight = { enable = true, disable = { "latex" } },
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

vim.keymap.set({ 'n', 'v' }, '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('FileTypeSettings', { clear = true })
-- autocmd('FileType', {
--   group = 'FileTypeSettings',
--   pattern = {'kdl', 'cpp'},
--   callback = function(args)
--     vim.treesitter.start(args.buf, vim.bo[args.buf].filetype)
--     vim.bo[args.buf].commentstring = '// %s'
--   end
-- })

autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = { 'text', 'markdown', 'tex' },
  callback = function()
    opt.spell = true
    opt.spelllang = 'ru,en'
  end,
})
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = 'c',
  callback = function()
    opt.makeprg = 'gcc -Wall -Wextra -Wconversion -Wshadow %'
  end,
})
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = 'cpp',
  callback = function()
    opt.makeprg = 'g++ -g $CXXFLAG %'
  end,
})
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = 'python',
  callback = function()
    opt.makeprg = 'python %'
  end,
})
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = 'tex',
  callback = function()
    opt.makeprg = 'tectonic %' -- 'latexmk -pdf -aux-directory=/tmp/ %'
  end,
})

augroup('TerminalSettings', { clear = true })
autocmd('TermOpen', {
  group = 'TerminalSettings',
  pattern = { '*', 'markdown' },
  callback = function()
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, buffer = true })
    opt.number = false
    opt.relativenumber = false
  end,
})

autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = { 'lua', 'tex' },
  callback = function()
    opt.shiftwidth = 2
  end,
})
