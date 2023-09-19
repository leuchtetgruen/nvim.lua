--vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--  pattern = {"*.vue"},
--  command = "set ft=vue",
--})

-- vim.g.ale_linters = {php =  {'php', 'phpstan', 'phpmd'}}
-- vim.g.ale_php_phpstan_executable = './vendor/bin/phpstan'
-- vim.g.ale_completion_enabled = 0
-- vim.g.ale_fix_on_save = 1
-- vim.g.ale_linters = {c= {}}
--
-- vim.g.ale_fixers = {
--    php = {'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'},
-- }
--
-- vim.g.ale_php_phpcbf_standard='PSR2'
-- vim.g.ale_php_phpcs_standard='phpcs.xml.dist'
-- vim.g.ale_phpmd_ruleset='phpmd.xml'
--
-- vim.g.vim_vue_plugin_config = { 
--       syntax= {
--          template = {'html'},
--          script= {'javascript'},
--          style= {'css'},
--       },
--       full_syntax= {},
--       initial_indent= {},
--       attribute= 0,
--       keyword= 0,
--       foldexpr= 0,
--       debug= 0,
--     }



local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}


require("symbols-outline").setup()
require("nvim-tree").setup()
require'hop'.setup()
require('Comment').setup()
require"surround".setup {mappings_style = "sandwich"}
require("nvim-autopairs").setup {}
require("mason").setup()
require("mason-lspconfig").setup()
require('lualine').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "php", },
  highlight = { enable = true, disable = { "php" } },
}


require("telescope").setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
-- autocomplete
local cmp = require'cmp'
 cmp.setup({
   snippet = {
     -- REQUIRED - you must specify a snippet engine
     expand = function(args)
       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
     end,
   },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp',
      entry_filter = function(entry)
        return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
      end
      },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false

  -- need to do this for every language server 
  local languageservers = {"tsserver", "vuels", "solargraph", "html"}
  for i, name in  ipairs(languageservers) do
    require'lspconfig'[name].setup{
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities
    }
  end

  require'lspconfig'.phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_php_cs_fixer.enabled"] = true,
        ["symfony.enabled"] = true,
        ["language_server_psalm.enabled"] = false,
    },
    flags = lsp_flags,
    capabilities = capabilities
  }

  require 'lspconfig'.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

