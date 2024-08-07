-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--Funkcja ustawiająca colorscheme i colorcolumn w TTY
-- local function set_tty_colorscheme()
--   local status1, err1 = pcall(function()
--     vim.cmd("colorscheme vim")
--   end)
-- if not status1 then
--   print("Error setting colorscheme:", err1)
-- else
--   print("Colorscheme set to vim")
-- end

--   local status2, err2 = pcall(function()
--     vim.cmd("set colorcolumn=")
--   end)
--   if not status2 then
--     print("Error setting colorcolumn:", err2)
--   else
--     print("Colorcolumn set to empty")
--   end
-- end

-- Sprawdzenie czy Neovim działa w trybie tekstowym (TTY)
-- if not os.getenv("DISPLAY") then
--   vim.defer_fn(function()
--     set_tty_colorscheme()
--   end, 0)
-- end

-- vim.cmd("highlight Normal guifg=#DDDDDD")
-- vim.cmd("colorscheme vim")
--
local function set_syntax_on()
  vim.cmd("syntax on")
  -- vim.opt.colorcolumn = ""
end
-- Tworzenie autokomendy
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.leb",
  callback = set_syntax_on,
})

-- bg=#10131c
local function set_highlight_normal()
  vim.cmd("hi Normal ctermbg=black ctermfg=gray guibg=#10131c guifg=#adb3c7")
  vim.cmd("colorscheme tokyonight-day")
end
vim.defer_fn(function()
  set_highlight_normal()
end, 0)

-- Funkcja do sprawdzenia, czy bufor jest częścią repozytorium Git
local function is_git_repo(file)
  local cmd = "git -C " .. file .. " rev-parse --is-inside-work-tree 2>/dev/null"
  local handle = io.popen(cmd)
  if handle == nil then
    print("something's wrong")
  else
    local result = handle:read("*a")
    handle:close()
    return result:find("true") ~= nil
  end
end

-- Funkcja do sprawdzenia, czy plik został zmieniony
local function is_file_modified(file)
  local cmd = "git -C " .. file .. " status --porcelain 2>/dev/null"
  local handle = io.popen(cmd)
  if handle == nil then
    print("something's wrong")
  else
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end
end

-- Funkcja powiadomienia przy zamknięciu Neovim
local function notify_on_exit()
  -- Pobierz ścieżkę do bieżącego bufora
  local file = vim.fn.expand("%:p:h")
  if is_git_repo(file) and is_file_modified(file) then
    os.execute('notify-send "Neovim" "Plik z repozytorium Git został zmieniony!"')
  end
end

-- Ustawienie autokomendy, która uruchamia funkcję notify_on_exit przy zamknięciu Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = notify_on_exit,
})

vim.api.nvim_command("syntax on")
-- vim.cmd("syntax on")
vim.o.scrolloff = 0 -- one text line of previous screen
vim.o.autochdir = true
-- vim.o.textwidth = 80
vim.o.colorcolumn = "80"
vim.wo.wrap = true
vim.wo.linebreak = true
vim.o.relativenumber = false
vim.o.number = true
vim.opt.conceallevel = 1
vim.opt.tags = { "/home/peter/notes/tags" }

-- Po 5 sekundach ukryj komunikaty w command-line
vim.api.nvim_command("autocmd CmdlineLeave * lua vim.defer_fn(function() vim.cmd(\"echo ''\") end, 5000)")

-- Funkcja do otwierania istniejącego pliku lub tworzenia nowego
function Go_to_file_or_create()
  -- Pobierz nazwę pliku spod kursora
  local file_name = vim.fn.expand("<cfile>")

  -- Sprawdź, czy plik istnieje
  local file_exists = vim.fn.filereadable(file_name)

  -- Jeśli plik istnieje, otwórz go w nowym buforze
  if file_exists == 1 then
    vim.cmd("edit " .. file_name)
    print("Oto istniejący plik:" .. file_name)
  else
    -- Jeśli plik nie istnieje, utwórz nowy plik
    vim.cmd("edit " .. file_name)
    print("New file created: " .. file_name)
  end
end

-- Zmapuj gf bezpośrednio do polecenia, które wywoła funkcję Lua
vim.api.nvim_set_keymap("n", "gf", ":lua Go_to_file_or_create()<CR>", { noremap = true, silent = true })
