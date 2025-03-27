return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("telescope").setup({
			defaults = require("telescope.themes").get_ivy(),
			extensions = {
				fzf = {},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files in cwd" })
		vim.keymap.set("n", "<leader>te", function()
			builtin.find_files({ search_file = ".env" })
		end, { desc = "Telescope find .env files in cwd" })
		vim.keymap.set("n", "<leader>tr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>ti", builtin.git_files, { desc = "Telescope find git files" })
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		vim.keymap.set("n", "<leader>ts", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set({ "n", "v" }, "<leader>tw", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		vim.keymap.set("n", "<leader>tgd", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Telescope grep double string find" })
		-- Shorcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>tn", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Telescope find Neovim files" })
		vim.keymap.set("n", "<leader>tp", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("data") .. "/lazy",
			})
		end, { desc = "Find lazy packages" })

		require("plugins.telescope.multigrep").setup()
	end,
}

