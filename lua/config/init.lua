local cmd = vim.cmd

--require('mappings')
cmd[[colorscheme gruvbox]]

require('config.mappings')
require('config.settings')
require('config.plugins')
require('config.plugin_config')

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  tree_docs = {
    enable = true
  }
}
