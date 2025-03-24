require("no-neck-pain").setup({
    width = 150,
})

vim.keymap.set("n", "<leader>vv", ":NoNeckPain <cr>")
vim.keymap.set("n", "<leader>ve", ":NoNeckPainWidthUp <cr>")
vim.keymap.set("n", "<leader>vn", ":NoNeckPainWidthDown <cr>")

