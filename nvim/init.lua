vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--  enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

require("nvim-tree").setup({
    filters = {
        git_ignored = false,
    },
})
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


require('nvim-web-devicons').setup {
  default = true;
}


require('lualine').setup({
    options = { theme = 'dracula' }
})


local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>f', function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = 'Telescope find files' })

require('telescope').setup()
require("lsp")


require('csvview').setup()

--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc="show diagnostic"})
-- Configuração opcional (antes de aplicar o tema)
-- Ativando o tema
vim.cmd[[colorscheme tokyonight-moon]]

-- keybinds
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- mr render
require('render-markdown').setup()
-- some ui confs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true


--vim.filetype.add({
--    extension = {
--        asm = "fasm",
--    },
--})

