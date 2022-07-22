local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
    return
end

toggleterm.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    close_on_exit = true,
    shell = vim.o.shell,
    direction = "float",
    float_opts = {
        border = "rounded",
        winblend = 0
    }
}
