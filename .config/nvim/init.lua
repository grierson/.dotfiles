vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

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
