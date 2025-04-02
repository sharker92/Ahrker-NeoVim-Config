return {
	"nvim-tree/nvim-tree.lua",
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		local api = require("nvim-tree.api")
		local harpoon = require("harpoon")
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function my_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			api.config.mappings.default_on_attach(bufnr)
			-- vim.keymap.set("n", "<C-n>", "", opts("Disable <C-n>"))
			-- vim.keymap.set("n", "<C-e>", "", opts("Disable <C-e>"))
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-S-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
		end

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			sort = {
				sorter = "case_sensitive",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				group_empty = true,
			},
			filters = {
				custom = { ".DS_Store" },
			},
			on_attach = my_on_attach,
		})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>eo", "<cmd>NvimTreeOpen<CR>", { desc = "Open file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Open file explorer on current file" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<CR>", { desc = "Closes the tree" })
		keymap.set("n", "<leader>el", "<cmd>NvimTreeCollapse<CR>", { desc = "Co[l]lapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}

