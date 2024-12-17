return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d", "sonarlint-language-server" },
			typescript = { "eslint_d", "sonarlint-language-server" },
			javascriptreact = { "eslint_d", "sonarlint-language-server" },
			typescriptreact = { "eslint_d", "sonarlint-language-server" },
			terraform = { "eslint_d", "sonarlint-language-server" },
			python = { "pylint", "sonarlint-language-server" },
			json = { "jsonlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
