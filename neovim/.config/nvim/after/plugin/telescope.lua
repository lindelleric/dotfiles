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

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

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

vim.keymap.set("n", "<leader>pg", live_multigrep)

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


