local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.api.nvim_set_keymap

local remember_last_position = augroup("remember_last_position_group", { clear = true })
local yank_highlight = augroup("yank_highlight", { clear = true })
local terminal = augroup("terminal", { clear = true })

-- Remeber where the curser was when reopening a file
autocmd("BufReadPost", {
    group = remember_last_position,
    callback = function()
        local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
        local end_line = vim.fn.line("$")
        if row ~= 0 and row <= end_line then
            vim.api.nvim_win_set_cursor(0, {row, col})
        end
    end
})

--Remap escape to leave terminal mode
autocmd("TermOpen", {
    group = terminal,
    callback = function()
        keymap("t", "<ESC>", "<c-\\><c-n>", { noremap = true })
    end
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = yank_highlight,
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Change settings for markdown
autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.b.wrap = true
        vim.b.spell = true
    end
})
