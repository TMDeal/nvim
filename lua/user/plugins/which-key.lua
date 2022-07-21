local M = {}

local which_key_ok, wk = pcall(require, "which-key")
if not which_key_ok then
    return
end

wk.setup {
    plugins = {
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },

    key_labels = {
        ["<space>"] = "SPC"
    },

    triggers = { "<leader>", "`", "\"" }, -- input triggers

    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
}

wk.register({
    ["-"] = { "Split Window Horizontally" },
    ["\\"] = { "Split Window Vertically" }
}, { prefix = "<leader>" })


wk.register({
    t = {
        name = "Telescope",
        f = { "Find Files" },
        ["<space>"] = { "List Buffers" },
        l = { "Find in Current Buffer" },
        t = { "Tags" },
        ["?"] = { "Open Old Files" },
        g = {
            name = "Grep",
            c = { "Grep on Cursor" },
            s = { "Grep on Project" }
        },
        G = {
            name = "Git",
            c = { "Git Commits" },
            b = { "Git Branches" },
            s = { "Git Status" },
        },
        p = { "Projects" }
    }
}, { prefix = "<leader>" })


wk.register({
    T = {
        name = "Markdown Table Mode",
        m = { "Toggle" },
        t = { "Tableize Selection" },
        T = { "Tableize Selection with Delimeter" },
        r = { "Realign Columns" },
        ["?"] = { "Echo Cell Representation" },
        d = {
            name = "Delete",
            d = { "Delete Row" },
            c = { "Delete Column" }
        },
        i = {
            name = "Insert",
            C = { "Insert Column Before" },
            c = { "Insert Column After" }
        },
        f = {
            name = "Formulas",
            a = { "Add Formula" },
            e = { "Evaluate Formula" }
        },
        s = { "Sort Column" }
    }
}, { prefix = "<leader>" })

M.register_lsp = function(bufnr)
    wk.register({
        l = {
            name = "LSP",
            w = {
                name = "Workspaces",
                a = { "Add Workspace Folder" },
                r = { "Remove Workspace Folder" },
                l = { "List Workspace Folders" }
            },
            s = { "Signature Help" },
            d = { "Type Definition" },
            r = { "Rename" },
            c = { "Code Action" },
            e = { "Show Diagnostics Popup" },
            q = { "Set Loclist" },
            f = { "Format File" }
        }
    }, { prefix = "<leader>", buffer = bufnr })
end

return M
