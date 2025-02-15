return{
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",    -- Modo de visualização dos buffers
					numbers = "none",    -- Exibir números nos buffers (none, ordinal, etc.)
					close_command = "bdelete %d",  -- Comando para fechar um buffer
					right_mouse_command = "bdelete %d", -- Comando ao clicar com o botão direito
					left_mouse_command = "buffer %d", -- Comando ao clicar com o botão esquerdo
					indicator = { style = "icon", icon = "▎" }, -- Indicador de buffer ativo
					buffer_close_icon = "",  -- Ícone para fechar o buffer
					modified_icon = "●", -- Ícone para buffers modificados
					close_icon = "", -- Ícone para fechar
					left_trunc_marker = "", -- Ícone para truncar o lado esquerdo
					right_trunc_marker = "", -- Ícone para truncar o lado direito
					max_name_length = 18, -- Tamanho máximo do nome do buffer
					max_prefix_length = 15, -- Prefixo máximo do nome do buffer
					tab_size = 18, -- Tamanho do buffer na linha
					diagnostics = "nvim_lsp", -- Diagnósticos no buffer (opções: "nvim_lsp", "coc", "coc_lsp")
					diagnostics_update_in_insert = false,  -- Atualizar diagnósticos enquanto está em modo de inserção
					offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } }, -- Área de deslocamento, como no caso do NvimTree
					show_buffer_icons = true,  -- Exibir ícones no buffer
					show_buffer_close_icons = true, -- Exibir ícones de fechamento no buffer
					show_tab_indicators = true, -- Exibir indicadores de tabulação
					persist_buffer_sort = true, -- Persistir a ordenação dos buffers
					separator_style = "slant", -- Estilo de separador
				},
			})
			-- Defina atalhos para navegar entre os buffers
			vim.api.nvim_set_keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

		end,
	}
}
