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
opt.list = true
opt.listchars = 'space:⋅'
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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local buf_set_keymap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
    end
    buf_set_keymap('n', '<leader>;', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'Toggle Inlay Hints')
    buf_set_keymap('n', '<leader>d', vim.diagnostic.open_float, 'Set diagnostics to loclist')
    buf_set_keymap('n', '<leader>D', vim.diagnostic.setloclist, 'Set diagnostics to loclist')
    buf_set_keymap('n', '<leader>a', vim.lsp.buf.code_action, 'LSP Code Action')
    buf_set_keymap('n', '<leader>s', vim.lsp.buf.document_symbol, 'Document Symbols')
    buf_set_keymap('n', '<leader>r', vim.lsp.buf.rename, 'Rename Symbol')
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Перейти к определению' })
    vim.keymap.set('n', '<C-w>d', function()
        vim.cmd('split')
        vim.lsp.buf.definition()
      end,
      { noremap = true, silent = true, desc = 'Открыть определение в вертикальном сплите' })
  end,
})

require('supermaven-nvim').setup {}


vim.keymap.set({ 'n', 'v' }, '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('FileTypeSettings', { clear = true })
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = 'kdl',
  callback = function(args)
    vim.treesitter.start(args.buf, 'kdl')
    opt.commentstring = '// %s'
  end
})
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = { 'text', 'markdown' },
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
    opt.makeprg = 'latexmk -aux-directory=/tmp/ -pdf %'
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
  pattern = 'lua',
  callback = function()
    opt.shiftwidth = 2
  end,
})
