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
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.dictionary:append("~/download/russian.utf-8")
vim.opt.langmap =
[=[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{},фисвуапршолдьтщзйкыегмцчнябюж.эхъ;abcdefghijklmnopqrstuvwxyz\,.\;/\'[]]=]

-- package.path = "./lua/?.lua;./lua/?/init.lua;" .. package.path
-- local split_and_zip = require("split_and_zip")
-- local langmap_str = type(vim.opt.langmap) == "table" and table.concat(vim.opt.langmap, "") or vim.opt.langmap
-- local langmap = split_and_zip.split_string_and_process(string.gsub(langmap_str, "\\", ""))
local langmap = {
  ["Ф"] = "A", ["И"] = "B", ["С"] = "C", ["В"] = "D", ["У"] = "E",
  ["А"] = "F", ["П"] = "G", ["Р"] = "H", ["Ш"] = "I", ["О"] = "J",
  ["Л"] = "K", ["Д"] = "L", ["Ь"] = "M", ["Т"] = "N", ["Щ"] = "O",
  ["З"] = "P", ["Й"] = "Q", ["К"] = "R", ["Ы"] = "S", ["Е"] = "T",
  ["Г"] = "U", ["М"] = "V", ["Ц"] = "W", ["Ч"] = "X", ["Н"] = "Y",
  ["Я"] = "Z", ["Б"] = "<", ["Ю"] = ">", ["Ж"] = ":", ["Э"] = "\"",
  ["Х"] = "{", ["Ъ"] = "}", ["ф"] = "a", ["и"] = "b", ["с"] = "c",
  ["в"] = "d", ["у"] = "e", ["а"] = "f", ["п"] = "g", ["р"] = "h",
  ["ш"] = "i", ["о"] = "j", ["л"] = "k", ["д"] = "l", ["ь"] = "m",
  ["т"] = "n", ["щ"] = "o", ["з"] = "p", ["й"] = "q", ["к"] = "r",
  ["ы"] = "s", ["е"] = "t", ["г"] = "u", ["м"] = "v", ["ц"] = "w",
  ["ч"] = "x", ["н"] = "y", ["я"] = "z", ["б"] = ",", ["ю"] = ".",
  ["ж"] = ";", ["э"] = "'", ["х"] = "[", ["ъ"] = "]", [","] = "?",
  ["."] = "/"
}

-- Global flag to toggle Russian mode
_G.russian_mode = false

-- Global function to toggle Russian mode
_G.toggle_russian_mode = function()
  _G.russian_mode = not _G.russian_mode
  if _G.russian_mode then
    print("Russian mode ON")
    for rus, eng in pairs(langmap) do
      vim.api.nvim_set_keymap("i", eng, rus, { noremap = true, silent = true })
    end
  else
    print("Russian mode OFF")
    for rus, eng in pairs(langmap) do
      vim.api.nvim_del_keymap("i", eng)
    end
  end
end

-- Map toggle to a key (e.g., F2)
vim.api.nvim_set_keymap("n", "<F2>", ":lua toggle_russian_mode()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F2>", "<Esc>:lua toggle_russian_mode()<CR>a", { noremap = true, silent = true })

-- Don't work
-- for ru, en in pairs(langmap) do
--     for _, mode in ipairs({ 'n', 'i', 'c', 'v' }) do
--         vim.api.nvim_set_keymap(mode, "<C-" .. ru .. ">", "<C-" .. en .. ">", { noremap = true, silent = true })
--     end
--     vim.api.nvim_set_keymap('i', '<C-ч><C-' .. ru .. '>', '<C-x><C-' .. en .. '>', { noremap = true, silent = true })
-- end

vim.api.nvim_set_keymap('n', '<F4>', ': nohlsearch<CR>', { noremap = true, silent = true })
for _, mode in ipairs({ 'n', 'v' }) do
    vim.api.nvim_set_keymap(mode, '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })
end
-- vim.api.nvim_set_keymap('n', '<C-;>', ':lua ToggleFullScreen()<CR>', { noremap = true, silent = true })

vim.cmd.colorscheme 'pinky1'
vim.opt.background = 'light'

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "tex", "markdown" },
    callback = function()
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "ru,en"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.makeprg = "gcc -Wall -Wextra -Wconversion -Wshadow %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.makeprg = "python %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.opt_local.makeprg = "g++ -g $CXXFLAG %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.opt_local.makeprg = "rustc %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.opt_local.makeprg = "latexmk -aux-directory=/tmp/ -pdf %"
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = {"*", "markdown"},
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})
