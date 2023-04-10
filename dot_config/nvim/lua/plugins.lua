local ensure_packer = function()

  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
use { "catppuccin/nvim", as = "catppuccin" }
use {"numToStr/FTerm.nvim", 
		config = function() 
		require'FTerm'.setup({
				border = 'double',
				dimensions  = {
						height = 0.9,
						width = 0.9,
				},
		})
		end}
use  'mbbill/undotree' 
use {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup {
    }
  end
}
use({
  "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
        markdown = { colorscheme = "gruvbox" },
        help = { colorscheme = "catppuccin-mocha", background = "dark" },
				yml = { colorscheme = "kanagawa-dragon", background = "dark"}
      },
    })
  end,
})

use 'Xuyuanp/scrollbar.nvim'
use {"lukas-reineke/indent-blankline.nvim",
	config = function() 
		require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
		}
	end}
use {"windwp/nvim-autopairs",
	config = function() 
		require("nvim-autopairs").setup {}
	end}
use {'terrortylor/nvim-comment',
	config = function()
		require('nvim_comment').setup()
	end}
  -- My plugins here
  use {"williamboman/mason.nvim",
  	config = function()
	require('mason').setup()
	end} 
use {'tpope/vim-surround'}
use {'tpope/vim-commentary'}

use {"williamboman/mason-lspconfig.nvim", config = function()
 require('mason-lspconfig').setup()
end
}
use {"neovim/nvim-lspconfig"}
use {"rebelot/kanagawa.nvim"}
use {
	"hrsh7th/nvim-cmp",
	requires = {
		"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
		'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
		'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
		'f3fora/cmp-spell', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-cmdline'
	}
}

use({
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  config = function()
    require("persistence").setup()
  end,
})

use {"folke/trouble.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		require("trouble").setup {}
	end}
use 'nvim-tree/nvim-web-devicons'
use {
	'goolord/alpha-nvim',
	requires = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		require'alpha'.setup(require'startify'.config)
	end
}

use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true},
	config = function()
		require('lualine').setup()
end
  }
use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
use {
	"kyazdani42/nvim-tree.lua",
	requires = "kyazdani42/nvim-web-devicons" ,
	wants = "nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup()
		require("nvim-tree").setup {
			hijack_cursor = true,
			view = {
				width = 40
			}
		}
	end
}
use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	end,
}
use 'nvim-treesitter/nvim-treesitter-context'
use {"CantoroMC/ayu-nvim"}
use {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	requires = { {'nvim-lua/plenary.nvim'} }
}
use {'Raimondi/delimitMate'}
use {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.setup {}
    wk.register({e = {name = 'tree',e = {name = 'toggle'}}})
    end
  }
use({
	"Pocco81/true-zen.nvim",
	config = function()
	 require("true-zen").setup {}
end,
})
 use {'nvim-pack/nvim-spectre',
 	config=function()
		require('spectre').setup()
	end}

use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}

use 'jose-elias-alvarez/null-ls.nvim'

if packer_bootstrap then
	require('packer').sync()
end
end)
