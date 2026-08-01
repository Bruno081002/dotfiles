return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"ts_ls",
						"pyright",
						"rust_analyzer",
						"html",
						"cssls",
						"tailwindcss",
						"eslint",
						"jsonls",
					},
					auto_install = true,
				})
			end,
		},
	},
	config = function()
		-- clangd (C++)
		vim.lsp.config("clangd", {
			cmd = { "clangd", "--background-index" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
			settings = { clangd = { extraArgs = { "--clang-tidy" } } },
		})

		-- TypeScript + TSX
		vim.lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" }, -- global npm install
			filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
			root_markers = { "package.json", "tsconfig.json", ".git" },
		})

		-- Enable other Mason-installed LSPs
		vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "clangd", "ts_ls" })
	end,
}

