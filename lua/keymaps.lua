-- Fugitive GIT
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", ":Git add .<CR>") 

-- File Manager
vim.keymap.set("n", "<leader>fe", vim.cmd.NvimTreeToggle)

-- Editor
---- Moving selected text up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- ChatGpt
vim.keymap.set("n", "<leader>fb", ":ChatGPTRun fix_bugs<CR>")
vim.keymap.set("v", "<leader>fb", ":m ChatGPTRun fix_bugs<CR>")

-- Color Picker
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- Terminal
vim.keymap.set("n", "<C-\\>", "<cmd>split<CR><cmd>ter<CR><cmd>resize 7<CR>" )

