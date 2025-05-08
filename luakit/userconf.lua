-- Use home row (and a bit) characters for generating labels
local select = require "select"
select.label_maker = function (s)
    return s.sort(s.reverse(s.charset("fjdksla;ghutnvir")))
end
-- Match only hint label text
local follow = require "follow"
follow.pattern_maker = follow.pattern_styles.match_label
--
--
--
--
local modes = require("modes")
-- local webview = require("webview")
--
modes.add_cmds({
    { ":tabfocus", "Focus the first tab whose title or URI matches the query.", {
        func = function (w, o)
            local query = o.arg and o.arg:lower() or ""
            if query == "" or not query:match("%S") then -- Check for empty or whitespace-only query
                w:error("No query provided or query is invalid")
                return
            end
            -- Iterate through all tabs
            for i, view in ipairs(w.tabs.children) do
                local title = view.title and view.title:lower() or ""
                local uri = view.uri and view.uri:lower() or ""
                -- Check if query is in title or URI
                if title:find(query, 1, true) or uri:find(query, 1, true) then
                    w.tabs:switch(i)
                    w:notify("Switched to tab: " .. (view.title or uri))
                    return
                end
            end
            w:error("No tab found matching: " .. query)
        end,
        format = "{opentabs}",
    }},
})
