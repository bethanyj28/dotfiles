-- [[ Basic Keymaps ]]
-- Set , as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
-- [[ Setting options ]]
-- See `:help vim.o`

-- Raise a dialog when quitting without saving
vim.o.confirm = true

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Tab things
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Easier window switching
vim.keymap.set('n', '<C-h>', '<C-W>h', {silent = true, noremap = true})
vim.keymap.set('n', '<C-j>', '<C-W>j', {silent = true, noremap = true})
vim.keymap.set('n', '<C-k>', '<C-W>k', {silent = true, noremap = true})
vim.keymap.set('n', '<C-l>', '<C-W>l', {silent = true, noremap = true})

-- use jk as ESC in insert mode
vim.keymap.set('i', 'jk', '<ESC>', {silent = true, noremap = true})

-- pair programming mode
vim.keymap.set('n', 'pp', ':set relativenumber!<CR>')

-- easier copy/paste from clipboard
vim.keymap.set('n', '<Leader>y', '"+y', {silent = true, noremap = true})
vim.keymap.set('n', '<Leader>p', '"+p', {silent = true, noremap = true})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
