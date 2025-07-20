require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- "stevearc/aerial.nvim"
map("n", "<leader>a",   "<cmd>AerialToggle! left<CR>",    { desc = "toggle outline" })

-- "kkoomen/vim-doge"
map("n", "<leader>dg",  "<cmd>DogeGenerate<CR>",          { desc = "generate doxygen doc" })

-- "lewis6991/gitsigns.nvim"
map("n", "<leader>ga",  "<cmd>Gitsigns blame<CR>",        { desc = "gitsigns blame" })
map("n", "<leader>gb",  "<cmd>Gitsigns blame_line<CR>",   { desc = "gitsigns blame single line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
