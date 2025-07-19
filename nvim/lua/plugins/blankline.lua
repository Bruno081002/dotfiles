return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "┆", highlight = "Comment" },
			scope = { enabled = true }, 		
			exclude = { filetypes = { "dashboard", "NvimTree", "help" } 
			}, 
		},
	},
}
 
