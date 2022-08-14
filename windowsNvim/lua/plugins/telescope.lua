---------------------------
-- Function declarations --
---------------------------

function Map(mode, shortcut, command)
  vim.api.nvim_set_keymap(
		mode,
		shortcut,
		command,
		{ noremap = true, silent = true }
	)
end

function Nmap(shortcut, command)
	Map(
		'n',
		shortcut,
		command
	)
end

function Nrmap(shortcut, command)
	vim.api.nvim_set_keymap(
		'n',
		shortcut,
		command,
		{ silent = true }
	)
end

function Imap(shortcut, command)
	Map(
		'i',
		shortcut,
		command
	)
end

function Vmap(shortcut, command)
	Map(
		'v',
		shortcut,
		command
	)
end

function Cmap(shortcut, command)
	Map(
		'c',
		shortcut,
		command
	)
end

-----------------
-- Keybindings --
-----------------

Nmap(
	'<leader>tf',
	':Telescope find_files<CR>'
)
Nmap(
	'<leader>tg',
	'<cmd>Telescope live_grep<cr>'
)
Nmap(
	'<leader>tb',
	'<cmd>Telescope buffers<cr>'
)
Nmap(
	'<leader>th',
	'<cmd>Telescope help_tags<cr>'
)
