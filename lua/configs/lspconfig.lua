require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup {
    ensure_installed = { 
        "gopls",
        "dockerls",
        "marksman",
        "pyright",
    },
}

local lspconfig = require("lspconfig")
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}