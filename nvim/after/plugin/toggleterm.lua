require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
  --direction = "float",
  direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

--function _G.set_terminal_keymaps()
  --local opts = {buffer = 0}
  --vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  --vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  --vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  --vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--end

---- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--function _G.set_terminal_keymaps()
  --local opts = {noremap = true}
  ---- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
--end

--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--local Terminal = require("toggleterm.terminal").Terminal
--local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

--function _LAZYGIT_TOGGLE()
	--lazygit:toggle()
--end

--local node = Terminal:new({ cmd = "node", hidden = true })

--function _NODE_TOGGLE()
	--node:toggle()
--end

--local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

--function _NCDU_TOGGLE()
	--ncdu:toggle()
--end

--local htop = Terminal:new({ cmd = "htop", hidden = true })

--function _HTOP_TOGGLE()
	--htop:toggle()
--end

--local python = Terminal:new({ cmd = "python", hidden = true })

--function _PYTHON_TOGGLE()
	--python:toggle()
--end