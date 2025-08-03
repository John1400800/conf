vim.o.lazyredraw = true
vim.o.clipboard = 'unnamedplus'
vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 3
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.scrolloff = 5
vim.o.linebreak = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.langmap =
[=[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{},фисвуапршолдьтщзйкыегмцчнябюжэхъ;abcdefghijklmnopqrstuvwxyz\,.\;\'[]]=]
vim.opt.wildoptions:append('fuzzy')
vim.opt.guicursor:append('t:block-blinkon0-blinkoff0')
vim.opt.dictionary:append('~/download/russian.utf-8')

local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
if handle ~= nil then
    result = handle:read("*a")
    handle:close()
end

if result:match("prefer%-light") then
    vim.o.background = "light"
else
    vim.o.background = "dark"
end

vim.o.termguicolors = true
vim.cmd.colorscheme('gruv1')
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'text', 'markdown', 'tex' },
    callback = function()
        vim.o.spell = true
        vim.o.spelllang = 'ru,en'
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        local filename = vim.fn.expand('%')
        local output = vim.fn.expand('%:r') .. '.pdf'
        vim.o.makeprg = 'pandoc --read=markdown+tex_math_dollars+tex_math_single_backslash ' ..
            filename .. ' -o ' .. output ..
            ' --pdf-engine=tectonic -V mainfont="Liberation Serif"'
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        vim.o.makeprg = 'gcc -Wall -Wextra -Wconversion -Wshadow %'
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    callback = function()
        vim.o.makeprg = 'g++ -g $CXXFLAG %'
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        vim.o.makeprg = 'python %'
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        vim.o.makeprg = 'tectonic %' -- 'latexmk -pdf -aux-directory=/tmp/ %'
    end,
})
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, buffer = true })
    end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'lua', 'tex', 'kdl', 'css', 'html' },
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})

vim.api.nvim_create_user_command("Pager", function()
    vim.o.number = false
    vim.o.relativenumber = false
    local orig = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(orig, 0, -1, false)
    local text = table.concat(lines, '\r\n') .. '\r\n'
    vim.cmd('enew') -- create a new buffer
    local chan = vim.api.nvim_open_term(0, {})
    vim.api.nvim_chan_send(chan, text)
    vim.api.nvim_buf_delete(orig, { force = true })
end, {})

vim.lsp.enable({ 'lua_ls', 'clangd', 'pylsp', 'ruff', 'ty', 'sqls', 'texlab', 'rust_analyzer' })

vim.g.adwaita_darker = true

require('supermaven-nvim').setup {}

require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "kdl", "lua", "python", "rust", "vim", "markdown", "toml" },
    sync_install = false,
    highlight = { enable = true, disable = { "latex", "vimdoc" } },
    indent = { enable = true },
    modules = {},      -- explicitly add an empty table for modules
    ignore_install = {}, -- explicitly add an empty table for ignore_install
    auto_install = true, -- explicitly set auto_install to false
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "v",
            node_decremental = "V",
        },
    }
}
