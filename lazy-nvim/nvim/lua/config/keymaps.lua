-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--vim.api.nvim_set_keymap("n", "<S-h>", "v  <          * <gv<Space>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<S-l>", "v  <          * <gv<Space>", { noremap = true, silent = true })

-- Definiowanie funkcji w Lua, która przesuwa kursor na dolny wiersz ekranu
function Move_cursor_to_bottom()
  vim.cmd("normal! L")
end
-- Mapowanie klawiszy Shift - l do funkcji Move_cursor_to_bottom w trybie normalnym
vim.api.nvim_set_keymap("n", "<S-l>", ":lua Move_cursor_to_bottom()<CR>", { noremap = true, silent = true })

function Move_cursor_to_head()
  vim.cmd("normal! H")
end
-- Mapowanie klawiszy Ctrl + J do funkcji Move_cursor_to_bottom w trybie normalnym
vim.api.nvim_set_keymap("n", "<S-h>", ":lua Move_cursor_to_head()<CR>", { noremap = true, silent = true })

-- Przypisanie strzałek do przewijania o jedną stronę w górę/dół
vim.api.nvim_set_keymap("n", "<Up>", "<C-b>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-f>", { noremap = true, silent = true })
