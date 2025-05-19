-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi Pmenu guibg=NONE ctermbg=NONE
    ]]
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      hi CursorLine guibg=#222222 guifg=NONE ctermbg=NONE ctermfg=NONE
    ]]
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      hi StatusLine guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
      hi WinBar guibg=NONE ctermbg=NONE
      hi WinBarNC guibg=NONE ctermbg=NONE
      hi TabLine guibg=NONE ctermbg=NONE
      hi TabLineFill guibg=NONE ctermbg=NONE
      hi TabLineSel guibg=NONE ctermbg=NONE
    ]]
  end,
})

vim.opt.laststatus = 0
vim.opt.showtabline = 0
vim.opt.winbar = ""

require "lazy_setup"
require "polish"
