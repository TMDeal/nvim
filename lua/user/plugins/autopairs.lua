local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_ok then
    return
end

autopairs.setup {
    -- Use treesitter
    check_ts = true,

    ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
    },

    -- Disable autopairs when using Telescope
    disable_filetypes = { "TelescopePrompt" },

    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
}

-- Integrate with nvim-cmp to add closing braces at end of function calls and stuff
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
