return {
	"stevearc/conform.nvim",
	enable = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function ensure_newline()
			vim.fn.bufnr("%")
			print("is working?")
			local last_line = vim.fn.getline("$")
			if last_line ~= "" then
				print("yes, is working?")
				vim.fn.append(vim.fn.line("$"), "a")
			end
		end

		local format_opts = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
			callback = ensure_newline(),
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "htmlbeautifier" },
				css = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},

			format_on_save = format_opts,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fp", function()
			conform.format(format_opts)
		end, { desc = "[F]ormat [P]retty file or range (in visual mode)" })
	end,
}
