-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't change buffer to the newly deleted text after pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Avoid accidents with registers
vim.keymap.set("n", "Q", "<nop>")

-- make typst file
vim.keymap.set("n", "<c-T>", ":make <Enter><Enter>")

-- Open typstfile.pdf with okular
vim.keymap.set("n", "<c-F>", ":! okular %:r.pdf &<Enter><Enter>")

-- New line in normal mode
vim.keymap.set("n", "<Enter>", "o<Esc>")

-- Yank into system clipboard so that I can copy from nvim to terminal etc.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Replace word on cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
