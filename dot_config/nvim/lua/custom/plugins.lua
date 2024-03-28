local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options




  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
        {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("custom.configs.null-ls") -- require your null-ls config here (example below)
    end,
},
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
  "folke/twilight.nvim",
  init = function()
    require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  },
  {
        "ray-x/sad.nvim",
        dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
        init = function()
          require("sad")
        end,
        config = function()
          require("sad").setup({
  debug = false, -- print debug info
  diff = 'delta', -- you can use `less`, `diff-so-fancy`
  ls_file = 'fd', -- also git ls-files
  exact = false, -- exact match
  vsplit = false, -- split sad window the screen vertically, when set to number
  -- it is a threadhold when window is larger than the threshold sad will split vertically,
  height_ratio = 0.6, -- height ratio of sad window when split horizontally
  width_ratio = 0.6, -- height ratio of sad window when split vertically
      })
        end
      },
    {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
  init = function()
    require("zen-mode")
  end
  },
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {"ntpeters/vim-better-whitespace"},
{
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    },
    cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
    }
},
  {
    'nvimdev/lspsaga.nvim',
    init = function()
        require('lspsaga').setup({})
    end,
}


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
