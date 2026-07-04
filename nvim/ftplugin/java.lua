local jdtls = require('jdtls')
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local home = os.getenv("HOME")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. project_name

local launcher = vim.fn.glob(
  home .. "/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
)

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher,
    "-configuration", home .. "/.local/share/jdtls/config_linux",
    "-data", workspace_dir,
  },

  root_dir = require('jdtls.setup').find_root({
    'pom.xml',
    'build.gradle',
    'settings.gradle',
    '.git'
  }),

  capabilities = capabilities,

  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
    }
  },
}

jdtls.start_or_attach(config)

