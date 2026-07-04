-- AUTO COMPLETE
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- LSP
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)

-- Lua
vim.lsp.config.lua_ls = {
  capabilities = capabilities,
}

-- Go
vim.lsp.config.gopls = {
  capabilities = capabilities,
}


-- C/C++
vim.lsp.config.clangd = {
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- Html
vim.lsp.config.html= {
  capabilities = capabilities,
}

-- js
vim.lsp.config.tsserver = {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" }
}

vim.lsp.config.cssls = {
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" }
}

vim.lsp.pyright = {
  capabilities = capabilities,
}

vim.lsp.ols = {
  capabilities = capabilities,
}

vim.lsp.rust_analyzer = {
    cmd = {"rust-analyzer"},
    capabilities = capabilities,
}
-- servidores ativos
vim.lsp.enable({
  "lua_ls",
  "gopls",
  "clangd",
  "html",
  "tsserver",
  "cssls",
  "pyright",
  "rust_analyzer",
  "ols"
})

