return{
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = 'hyper',    -- theme is doom and hyper default is hyper
				disable_move,       -- default is false disable move keymap for hyper
				shortcut_type,      -- shortcut type 'letter' or 'number'
				shuffle_letter,     -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter
				letter_list,        -- default is a-z, excluding j and k
				change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
				config = {
					header = { 

						" ███████╗ ██████╗ ██████╗ ████████╗███████╗███████╗ ",
						" ██╔════╝██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝╚══███╔╝ ",
						" █████╗  ██║   ██║██████╔╝   ██║   █████╗    ███╔╝  ",
						" ██╔══╝  ██║   ██║██╔══██╗   ██║   ██╔══╝   ███╔╝   ",
						" ██║     ╚██████╔╝██║  ██║   ██║   ███████╗███████╗ ",
						" ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝ ",
					},
					week_header = {
						enable,  --boolean use a week header
						concat,  --concat string after time string line
						append,  --table append after time string line
					},
					disable_move,  -- boolean default is false disable move key
					shortcut = {
						{ desc = '󰊳 Lazy', group = '@property', action = 'Lazy', key = 'u'},
						{ desc = "󰝰  Files", action = 'Neotree toggle', key = 'e'},

					}

				},       -- config used for theme
				hide = {
					statusline,       -- hide statusline default is true
					tabline,          -- hide the tabline
					winbar,           -- hide winbar
				},
				preview = {
					command,          -- preview command
					file_path,        -- preview file path
					file_height,      -- preview file height
					file_width,       -- preview file width
				},
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	}
}
