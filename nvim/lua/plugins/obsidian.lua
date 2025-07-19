return { 
	{
		"epwalsh/obsidian.nvim",
		version = "*", 
		lazy = true,
		ft = "markdown",
		dependencies = {"nvim-lua/plenary.nvim",},
		opts = {
			workspaces = {
				{
					name = "Fortezz",
					path = "~/Fortezz",
				},
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
