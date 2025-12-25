-- desativa o file manager padra do nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--  enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

require("nvim-tree").setup()
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


require('nvim-web-devicons').setup {
  default = true;
}


require("lsp")
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc="show diagnostic"})
-- Configuração opcional (antes de aplicar o tema)
-- Ativando o tema
vim.cmd[[colorscheme tokyonight-moon]]

-- keybinds
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- coisa de debugacao
-- nvim-dap config
local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/sbin/lldb-dap', -- Confirma se esse bin existe
  name = 'lldb'
}

dap.configurations.c = {
  {
    name = "Launch C app",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}


-- nvim-dap-ui config
local dapui = require("dapui")
dapui.setup()

-- Auto abrir/fechar UI
require("dap").listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
--require("dap").listeners.before.event_terminated["dapui_config"] = function()
  --dapui.close()
--end
--require("dap").listeners.before.event_exited["dapui_config"] = function()
  --dapui.close()
--end


vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)
vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end)
vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end)
vim.keymap.set('n', '<F12>', function() require'dap'.step_out() end)
vim.keymap.set('n', '<Leader>b', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>lp', function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require'dap'.repl.open() end)
vim.keymap.set('n', '<Leader>du', function() require'dapui'.toggle() end)

-- some ui confs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

