-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function set_highlight_normal()
  vim.cmd("hi Normal guifg=#8288a1")
end
vim.defer_fn(function()
  set_highlight_normal()
end, 0)

vim.o.scrolloff = 0 -- one text line of previous screen
vim.o.autochdir = true
-- vim.o.textwidth = 80
vim.o.colorcolumn = "80"
vim.wo.wrap = true
vim.wo.linebreak = true
vim.o.relativenumber = false
vim.o.number = true
vim.opt.conceallevel = 1
vim.cmd("syntax enable")
vim.opt.tags = { "/home/peter/notes/tags" }

-- Funkcja do sprawdzenia, czy bufor jest częścią repozytorium Git
local function is_git_repo()
  local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result:find("true") ~= nil
end

-- Funkcja do sprawdzenia, czy plik został zmieniony
local function is_file_modified()
  local handle = io.popen("git status --porcelain 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

-- Funkcja powiadomienia przy zamknięciu Neovim
local function notify_on_exit()
  if is_git_repo() and is_file_modified() then
    os.execute('notify-send "Neovim" "Plik z repozytorium Git został zmieniony!"')
  end
end

-- Ustawienie autokomendy, która uruchamia funkcję notify_on_exit przy zamknięciu Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = notify_on_exit,
})

-- Funkcja do otwierania istniejącego pliku lub tworzenia nowego
function Go_to_file_or_create()
  -- Pobierz nazwę pliku spod kursora
  local file_name = vim.fn.expand("<cfile>")

  -- Sprawdź, czy plik istnieje
  local file_exists = vim.fn.filereadable(file_name)

  -- Jeśli plik istnieje, otwórz go w nowym buforze
  if file_exists == 1 then
    vim.cmd("edit " .. file_name)
  else
    -- Jeśli plik nie istnieje, utwórz nowy plik
    vim.cmd("edit " .. file_name)
    print("New file created: " .. file_name)
  end
end

-- Zmapuj gf bezpośrednio do polecenia, które wywoła funkcję Lua
vim.api.nvim_set_keymap("n", "gf", ":lua Go_to_file_or_create()<CR>", { noremap = true, silent = true })

-- Po 5 sekundach ukryj komunikaty w command-line
vim.api.nvim_command("autocmd CmdlineLeave * lua vim.defer_fn(function() vim.cmd(\"echo ''\") end, 5000)")
