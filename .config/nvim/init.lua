-- tab settings
vim.opt.tabstop = 4   
vim.opt.shiftwidth = 4 
vim.opt.softtabstop = 4 
vim.opt.autoindent = true
vim.opt.expandtab = true   

-- general stuff
vim.cmd("syntax on")
vim.opt.mouse = "a" -- Enable mouse support always
vim.opt.history = 1000
vim.opt.clipboard = "unnamedplus" -- sys clipboard

-- search stuff
vim.opt.hlsearch = true 
vim.opt.incsearch = true 
vim.opt.ignorecase = true 
vim.opt.smartcase = true 

-- visuals
vim.opt.showmatch = true
vim.opt.cursorline = true 
vim.opt.laststatus = 2 
vim.opt.wrap = false

-- weird color settings
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- keybinds things
local keymap = vim.keymap.set

-- move 5 characters right or left
keymap("n", "L", "5l", { noremap = true, silent = true })
keymap("n", "H", "5h", { noremap = true, silent = true })

-- move 5 lines down or up
keymap("n", "J", "5j", { noremap = true, silent = true })
keymap("n", "K", "5k", { noremap = true, silent = true })


-- gotta admit some of the rest of this is vibecoded because i dont understand this
-- i cba to learn about lua and this complicated config and it wouldnt just work :sob:


-- transparent background and color stuff
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

-- run to setup color scheme right
transparent_background()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = transparent_background,
})

-- show line numbers
vim.opt.number = true

-- delete whole word
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Delete word backward" })


-- text wrap if text file:
-- create an autocommand group for wrapping preferences
local wrap_group = vim.api.nvim_create_augroup("WrapPreferences", { clear = true })

-- enable wrap for text and markdown files
vim.api.nvim_create_autocmd("FileType", {
  group = wrap_group,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    -- Fixes navigation for visual lines while writing
    vim.keymap.set("n", "j", "gj", { buffer = true, silent = true })
    vim.keymap.set("n", "k", "gk", { buffer = true, silent = true })
  end,
})

-- explicitly disable wrap for coding languages
vim.api.nvim_create_autocmd("FileType", {
  group = wrap_group,
  pattern = { "lua", "python", "javascript", "typescript", "c", "cpp", "go", "rust" },
  callback = function()
    vim.opt_local.wrap = false
  end,
})

