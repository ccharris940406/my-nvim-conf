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

