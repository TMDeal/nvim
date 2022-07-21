local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    return
end

lualine.setup {
    options = {
        theme = 'nord',
        icons_enabled = false,
        section_separators = '',
        component_separators = ''
    }
}
