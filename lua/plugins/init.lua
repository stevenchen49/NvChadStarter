return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
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
        "bash", "c", "cpp", "cmake", "gitcommit",
        "json", "kconfig", "lua", "markdown",
        "python", "vim", "vimdoc",
      },

      highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "rust" },
      }
    },

    {
      "stevearc/aerial.nvim",
      opts = {},
      -- Optional dependencies
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
      },
      lazy = false,
      config = function()
        require("aerial").setup({
          -- Priority list of preferred backends for aerial.
          -- This can be a filetype map (see :help aerial-filetype-map)
          backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },

          -- Determines the default direction to open the aerial window. The 'prefer'
          -- options will open the window in the other direction *if* there is a
          -- different buffer in the way of the preferred direction
          -- Enum: prefer_right, prefer_left, right, left, float
          default_direction = "prefer_left",

          on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
          end
        })
      end
    },
  },

  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    ft = { "lua", "c", "cpp", "python" },
    init = function()
      -- must be set before plugin loads
      vim.g.doge_enable_mappings = 0
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    -- NOTE: part of the code in gisigns highlight.lua has been modified to
    --       accommodate a transparent background.
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
        },
      })
    end,
  }
}
