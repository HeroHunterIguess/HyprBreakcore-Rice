-- Tab settings
vim.opt.tabstop = 4   
vim.opt.shiftwidth = 4 
vim.opt.softtabstop = 4 
vim.opt.autoindent = true
vim.opt.expandtab = true   

-- General stuff
vim.cmd("syntax on")
vim.opt.mouse = "a" -- Enable mouse support always
vim.opt.history = 1000
vim.opt.clipboard = "unnamedplus" -- sys clipboard

-- Search stuff
vim.opt.hlsearch = true 
vim.opt.incsearch = true 
vim.opt.ignorecase = true 
vim.opt.smartcase = true 

-- Visuals
vim.opt.showmatch = true
vim.opt.cursorline = true 
vim.opt.laststatus = 2 
vim.opt.wrap = false

-- Weird color settings
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- Keymaps (Navigation Boost)
local keymap = vim.keymap.set

-- Move 5 characters right or left
keymap("n", "L", "5l", { noremap = true, silent = true })
keymap("n", "H", "5h", { noremap = true, silent = true })

-- Move 5 lines down or up
keymap("n", "J", "5j", { noremap = true, silent = true })
keymap("n", "K", "5k", { noremap = true, silent = true })

-- Transparent background and color stuff 
local function transparent_background()
  local ui_groups = { 
    "Normal", "NormalNC", "LineNr", "CursorLineNr", 
    "SignColumn", "FoldColumn", "EndOfBuffer",
    "StatusLine", "StatusLineNC", "VertSplit", "WinSeparator" 
  }
  
  for _, group in ipairs(ui_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end
end

-- Run to setup color scheme right 
transparent_background()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = transparent_background,
})

-- Show line numbers
vim.opt.number = true

-- Delete whole word
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Delete word backward" })

