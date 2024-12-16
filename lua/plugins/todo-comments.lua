return {
    "folke/todo-comments.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local todo_comments = require("todo-comments")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, { desc = "Next todo comment" })

        keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, { desc = "Previous todo comment" })

        todo_comments.setup()
    end,
}
-- TODO:
-- PERF:
-- TEST:
-- NOTE:
-- WARN:
-- FIX:
-- BUG:

