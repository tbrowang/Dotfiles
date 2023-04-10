-- Options
vim.opt.encoding = "UTF-8"
vim.opt.number = true
-- vim.opt.mouse = "a" True chad don't use mouse
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.winbar = "%f %m"
vim.opt.wrap = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.colorcolumn = "81"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_version = "v9.5.0"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=" .. lazy_version, -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins")
