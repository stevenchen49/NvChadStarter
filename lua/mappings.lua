require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- 'stevearc/aerial.nvim',
map("n", "<leader>a", "<cmd>AerialToggle! left<CR>", { desc = "Toggle Outline" })

-- "kkoomen/vim-doge",
map("n", "<leader>dg", "<cmd>DogeGenerate<CR>", { desc = "Generate Doxygen Doc" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
