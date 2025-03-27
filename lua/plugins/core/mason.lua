return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer",
		"hrsh7th/cmp-nvim-lsp",
		"jay-babu/mason-nvim-dap.nvim",
	},
	enabled = true,
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local mason_lspconfig = require("mason-lspconfig")
		local cmp_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"rust_analyzer",
				"eslint",
				"lua_ls",
				"pyright",
				"ruff",
				"yamlls",
				"html",
				"cssls",
				"tailwindcss",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		-- Linters and Formatters
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"jq",
				"prettierd",
				"stylua",
				"isort",
				"eslint_d",
				"htmlbeautifier",
				"sonarlint-language-server",
				"jsonlint",
			},
		})

		-- Debugger
		require("mason-nvim-dap").setup({
			ensure_installed = { "python", "js" }, -- List of DAP adapters to install
			automatic_installation = true, -- Automatically install adapters if not already installed
		})
	end,
}

