local treesitter_ok, _ = pcall(require, "nvim-treesitter")
if not treesitter_ok then
    return
end

local configs = require("nvim-treesitter.configs")

configs.setup {
    -- Ensure these parsers are always installed
    ensure_installed = "all",

    -- Automatically install relevant parser when opening file
    auto_install = false,

    -- Install parsers asynchronously
    sync_install = false,

    autopairs = {
        enable = true
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },

    highlight = {
        enable = true,
        disable = {},

        -- Also will use vims default method of syntax highlighting
        additional_vim_regex_highlighting = true
    },

    indent = {
        enable = true,
        disable = { "yaml" }
    }
}
