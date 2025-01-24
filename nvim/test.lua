package.path = "./lua/?.lua;./lua/?/init.lua;" .. package.path

local split_and_zip = require("split_and_zip")


vim = {
    opt = {
        langmap = ""
    }
}

vim.opt.langmap =
[=[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{},фисвуапршолдьтщзйкыегмцчнябюж.эхъ;abcdefghijklmnopqrstuvwxyz\,.\;/\'[]]=]
-- local langmap_str = type(langmap) == "table" and table.concat(langmap, "") or langmap
-- local pairs = split_and_zip.split_string_and_process(string.gsub(langmap_str, "\\", ""))
-- for ru, en in pairs(langmap) do
--     print(string.format("%s -> %s", ru, en))
-- end


local langmap_str = type(vim.opt.langmap) == "table" and table.concat(vim.opt.langmap, "") or vim.opt.langmap
local langmap = split_and_zip.split_string_and_process(string.gsub(langmap_str, "\\", ""))
for ru, en in pairs(langmap) do
    print("<C-" .. ru .. ">", "<C-" .. en .. ">", string.byte(ru), string.byte(en))
end

local langmap2 = {
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
  ["ж"] = ";", ["э"] = "'", ["х"] = "[", ["ъ"] = "]"
}
print("\n\n")
for ru, en in pairs(langmap2) do
    print("<C-" .. ru .. ">", "<C-" .. en .. ">", string.byte(ru), string.byte(en))
end