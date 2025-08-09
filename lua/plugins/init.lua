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
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = false,
      vertical_bar_cursor_insert_mode = false,
      distance_stop_animating_vertical_bar = false,

      -- Smear cursor detail settings      -- Default  Range
      -- stiffness = 0.8,                      -- 0.6      [0, 1]
      -- trailing_stiffness = 0.5,             -- 0.4      [0, 1]
      -- stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
      -- trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      -- damping = 0.8,                        -- 0.65     [0, 1]
      -- damping_insert_mode = 0.8,            -- 0.7      [0, 1]
      -- distance_stop_animating = 0.5,        -- 0.1      > 0

      -- Fire hazard
      -- cursor_color = "#ff8800",
      -- stiffness = 0.3,
      -- trailing_stiffness = 0.1,
      -- damping = 0.5,
      -- trailing_exponent = 5,
      -- never_draw_over_target = true,
      -- hide_target_hack = true,
      -- gamma = 1,
    },
    lazy = false
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          process = { enabled = false },
          hover = { enabled = false },
          signature = { enabled = false },
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,     -- use a classic bottom cmdline for search
          command_palette = true,   -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,       -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,   -- add a border to hover docs and signature help
        },
        messages = { enabled = false, },
        popupmenu = { enabled = true, },
        notify = { enabled = false, },
      })
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            prompt_position = "bottom"
          }
        }
      })
    end,
  }
}
