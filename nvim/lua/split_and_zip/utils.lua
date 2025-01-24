local Utf8Util = {}

function Utf8Util.sub(s, i, j)
    return string.sub(s, utf8.offset(s, i), utf8.offset(s, j + 1) - 1)
end

function Utf8Util.zipStrings(str1, str2)
    local result = {}
    local len1, len2 = utf8.len(str1), utf8.len(str2)
    for i = 1, math.max(len1, len2) do
        local sub1 = i <= len1 and Utf8Util.sub(str1, i, i) or nil
        local sub2 = i <= len2 and Utf8Util.sub(str2, i, i) or nil
        table.insert(result, { sub1, sub2 })
    end
    return result
end

local function split_string_and_process(input_str)
    local result = {}
    local parts = { input_str:match("([^,]+),(.+)") }
    for _, s1 in ipairs(parts) do
        local first, second = s1:match("([^;]+);(.+)")
        local zipped = Utf8Util.zipStrings(first, second)
        for _, pair in ipairs(zipped) do
            result[pair[1]] = pair[2]
        end
    end
    return result
end

return {
    Utf8Util = Utf8Util,
    split_string_and_process = split_string_and_process,
}
