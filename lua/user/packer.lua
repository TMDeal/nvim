local fn = vim.fn
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }

    vim.cmd[[packadd packer.nvim]]
end

-- Use protected call to avoid erroring out on first use
local ok, packer = pcall(require, "packer")
if not ok then
    return
end

-- Reload neovim whenever packer_init.lua is saved
autocmd("BufWritePost", {
    group = augroup("packer_user_config", { clear = true }),
    pattern = "packer.lua",
    callback = function()
        packer.sync()
    end
})

-- Make packer use a floating window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

-- Start Packer
packer.startup(function(use)
    -- Plugins go here

    -- Have packer manage itself
    use "wbthomason/packer.nvim"

    -- Implementation of popup api from vim in neovim
    use "nvim-lua/popup.nvim"

    -- Prerequisite for most lua plugins
    use "nvim-lua/plenary.nvim"

    -- Automatically setup everything after cloning packer.nvim
    -- This should be after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
