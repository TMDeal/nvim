local treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
    return
end

configs.setup {
    -- Ensure these parsers are always installed
    ensure_installed = {},

    -- Automatically install relevant parser when opening file
    auto_install = true,

    -- Install parsers asynchronously
    sync_install = false,

    -- Do not install these parsers
    ignore_install = {},

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
        -- May slow things down, apparently
        additional_vim_regex_highlighting = false
    },

    indent = {
        enable = true,
        disable = { "yaml" }
    }
}
