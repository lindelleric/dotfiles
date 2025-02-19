local telescope = require('telescope')
telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}
telescope.load_extension('fzf')


local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>pf', function()
	builtin.find_files({
		find_command = {
			'rg',
			'--files',
			'-L', -- Allows rg to follow symlinks
		}
	})
end, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ search = vim.fn.input ("Grep > ")})
end)

vim.keymap.set('n', '<leader>pg', function ()
	builtin.live_grep()
end)

vim.keymap.set('n', '<leader>cr', function ()
    builtin.lsp_references({
        show_line = false
    })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ct', function ()
    builtin.lsp_type_definitions()
end)

vim.keymap.set('n', '<leader>cd', function ()
    builtin.lsp_definitions()
end)

vim.keymap.set('n', '<leader>ci', function ()
    builtin.lsp_implementations()
end)

vim.keymap.set('n', '<leader>gs', function ()
    builtin.git_status()
end)

vim.keymap.set('n', '<leader>pr', function ()
    builtin.resume();
end)

vim.keymap.set('n', '<leader>b', function ()
    builtin.buffers()
end)

