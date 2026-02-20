return {
  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },

        palette = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        -- NOTE: Highlight groups are extended (merged) by default. Disable this
        -- per group via `inherit = false`
        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- StatusLine = { fg = "love", bg = "love", blend = 15 },
          -- VertSplit = { fg = "muted", bg = "muted" },
          -- Visual = { fg = "base", bg = "text", inherit = false },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          if highlight.undercurl then highlight.undercurl = false end

          -- Change palette colour
          if highlight.fg == palette.pine then highlight.fg = palette.foam end
        end,
      }
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = 'wave', -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }
    end,
  },

  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- Set the background to be transparent
      vim.opt.background = 'dark'

      -- Configure Everforest options before loading
      vim.g.everforest_background = 'hard' -- Options: "soft", "medium", "hard"
      vim.g.everforest_better_performance = 1
      vim.g.everforest_transparent_background = 1 -- Enable transparency

      -- Additional transparency settings
      vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight FoldColumn guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
      highlight CursorLineNr guibg=NONE ctermbg=NONE
    ]]
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = 'hard', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
      vim.cmd 'colorscheme gruvbox'
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Options: "latte", "frappe", "macchiato", "mocha"
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = { 'italic' },
          functions = { 'italic' },
          keywords = { 'italic' },
          strings = {},
          variables = {},
          numbers = {},
          booleans = { 'bold' },
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = true,
          telescope = true,
          which_key = true,
          dashboard = true,
          mason = true,
          lsp_signature = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },
        },
      }

      -- Additional transparency settings for UI elements
      vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight FoldColumn guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
      highlight CursorLineNr guibg=NONE ctermbg=NONE
      highlight Folded guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
    ]]
    end,
  },

  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        diff = { mode = 'bg' }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
        borders = true, -- Enable the border between verticaly split windows visible
        errors = { mode = 'bg' }, -- Display mode for errors and diagnostics
        -- values : [bg|fg|none]
        search = { theme = 'vim' }, -- theme for highlighting search results
        -- values : [vim|vscode]
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = {},
          functions = {},
          variables = {},

          -- To customize lualine/bufferline
          bufferline = {
            current = {},
            modified = { italic = true },
          },

          lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
        },

        -- colorblind mode
        -- see https://github.com/EdenEast/nightfox.nvim#colorblind
        -- simulation mode has not been implemented yet.
        colorblind = {
          enable = false,
          preserve_background = false,
          severity = {
            protan = 0.0,
            deutan = 0.0,
            tritan = 0.0,
          },
        },

        -- Override the default colors
        ---@param colors Nord.Palette
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with all highlights and the colorScheme table
        ---@param colors Nord.Palette
        on_highlights = function(highlights, colors) end,
      }
    end,
  },
  install = {
    colorscheme = { 'nord' },
  },
}
