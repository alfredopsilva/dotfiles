-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- ~/.config/nvim/init.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x') -- Delete character without yanking it
keymap.set("n", "<C-a>", "gg<S-v>G$") -- Select all text

-- Save file and quit
keymap.set("n", "<Leader>W", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Change Theme
keymap.set("n", "<leader>tt", function()
  if _G.toggle_catppuccin_theme then
    _G.toggle_catppuccin_theme()
  else
    vim.notify("Catppuccin theme toggle function not available", vim.log.levels.WARN)
  end
end, { desc = "Toggle Catppuccin theme (Latte/Mocha)" })
