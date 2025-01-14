return {
	"rest-nvim/rest.nvim",
	enabled = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		table.insert(opts.ensure_installed, "http")
	end,
	config = function()
		-- require("rest-nvim").setup({})
		vim.keymap.set("n", "<leader>hr", "<cmd>Rest run<CR>", { desc = "Run request under the cursor" })
		vim.keymap.set("n", "<leader>hl", "<cmd>Rest last<CR>", { desc = "Run last request" })
	end,
}
