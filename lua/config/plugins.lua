vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use 'simrat39/symbols-outline.nvim'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'phaazon/hop.nvim'


    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    use {
      "ur4ltz/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "sandwich"}
      end
    }

    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- use "rafamadriz/friendly-snippets"

    -- use 'leafOfTree/vim-vue-plugin'
    use 'posva/vim-vue'

    use { "williamboman/mason.nvim" } -- for lsp plugin installation
    use { "williamboman/mason-lspconfig.nvim" } -- for lsp plugin installation

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'tpope/vim-rails'

    use {
      'andymass/vim-matchup',
      setup = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end
    }

    use 'RRethy/nvim-treesitter-endwise'

    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- use 'w0rp/ale'
    use 'aca/emmet-ls'

    use 'Rican7/php-doc-modded'

    use 'adoy/vim-php-refactoring-toolbox'

    -- ai 
    use 'David-Kunz/gen.nvim'

    -- renpy 
    use 'chaimleib/vim-renpy'

end)

