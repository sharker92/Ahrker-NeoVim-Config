--vim.keymap.set('n', '<leader>p.', vim.cmd.Ex)

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })


vim.keymap.set("n", "J", "mzJ`z", { desc = "Join the current line with the next line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center cursor" })
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP server" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Delete selected text and paste without modifying unnamed register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc = "Delete text to black hole register" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Use Ctrl+C as Esc" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code using LSP" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next item in quickfix list and center cursor" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous item in quickfix list and center cursor" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next item in location list and center cursor" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous item in location list and center cursor" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

vim.keymap.set("n", "<leader>.pp", "<cmd>e ~/.config/nvim/lua/sharker/lazy.lua<CR>", { desc = "Open lazy.lua configuration file" })
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Run CellularAutomaton make_it_rain" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })

