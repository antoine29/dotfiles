return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  		  "vim", "lua", "vimdoc",
        "html", "css",
        "go",
        "python",
        "dockerfile",
        "markdown", "markdown_inline",
        "json", "yaml",
        "bash", "regex",
        "javascript", "typescript",
        "kotlin"
  		},
  	},
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      -- { "github/copilot.vim" }, -- commenting this disables the automatic suggestions. chat should keep available though. uncomment and run Copilot auth to setup copilot login
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    event = "VimEnter", -- This will load the plugin when Vim starts
    opts = {
      -- See Configuration section for options
      model = "claude-3.5-sonnet",
    },
    sticky = {'#buffers', '#files:*'},
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "obsidian",
          path = "/mnt/c/Users/florea79/obsidian",
        }
      },
    },
  },

  require("configs.debug"),
}

