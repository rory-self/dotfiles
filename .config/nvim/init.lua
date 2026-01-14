require("config.lazy")

-- Global Options --
-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.linebreak = true
vim.o.smartindent = true

-- Other
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.signcolumn = "auto"
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('config') .. "/.undo"
vim.o.scrolloff = 8

-- Binds --
-- Floating error windows
vim.keymap.set('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Show diagnostic messages' })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

-- Harpoon
local harpoon = require('harpoon')
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- TODO: change these
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- LSP --
vim.lsp.enable('clangd')
vim.lsp.enable('zls')

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

-- Theme
vim.cmd('colorscheme gruvbox')

-- Cursor
vim.opt.guicursor = "c-i-ci:ver5-blinkoff1000-blinkon1000"
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor = "a:ver5-blinkoff1000-blinkon1000"
  end,
})
