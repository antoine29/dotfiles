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
    "kotlin_language_server",
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
    kotlin = {
      -- Add any specific Kotlin LSP settings here if needed
    }
  },
}

