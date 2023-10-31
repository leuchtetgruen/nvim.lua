
-- Normal mode vim.keymap.setpings
vim.g.mapleader = ","
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>Q', ':q!<cr>')
vim.keymap.set('n', '<leader><leader>n', ':tabn<cr>')
vim.keymap.set('n', '<leader><leader>p', ':tabp<cr>')

vim.keymap.set('n', '<SPACE>', ':noh<CR><CR>') -- space removes search highlight

vim.keymap.set('n', '<leader>ul', 'VYpVr=') -- underline current line

vim.keymap.set('n', '<leader><cr>', 'i<cr><esc>k') -- insert empty line
vim.keymap.set('n', '<leader><leader><cr>', 'o<esc>') -- insert empty line

vim.keymap.set('n', '<leader>+', 'za')
vim.keymap.set('n', '<leader>-', 'zc')
vim.keymap.set('n', '<leader>/', 'zM')
vim.keymap.set('n', '<leader>*', 'zR')

-- NvimTree
vim.keymap.set('n', 't', ':NvimTreeToggle<cr>')

-- SymbolsOutline
vim.keymap.set('n', 'T', ':SymbolsOutline<cr>')

-- hop
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- Commenter
vim.api.nvim_set_keymap("n", "<leader>c<space>", "gcc", {noremap=false})

-- Jump to problems
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- Code actions
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Call Llm
vim.api.nvim_set_keymap('v', '<leader><leader>l', ':Llm<cr>', { noremap=true})

vim.cmd[[colorscheme gruvbox]]
