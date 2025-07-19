
return {
	{
		"xiyaowong/nvim-cursorword",
		config = function()
			vim.g.cursorword_disable_filetypes = {} -- Desativa para certos filetypes (adicione aqui se quiser)
			vim.g.cursorword_disable_at_startup = false -- Não inicia automaticamente
			vim.g.cursorword_min_width = 3 -- Largura mínima da palavra
			vim.g.cursorword_max_width = 50 -- Largura máxima da palavra
		end,
	},
}

