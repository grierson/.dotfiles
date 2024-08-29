vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Editor
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Line
vim.opt.laststatus = 3

-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
