require('config.options')
require('config.keymaps')
require('plugins.lazy')
require('plugins.keymaps')
require('plugins.options')

vim.cmd.highlight({ "Normal", "guibg=NONE", "ctermbg=NONE" })
vim.cmd.highlight({ "NonText", "guibg=NONE", "ctermbg=NONE" })
vim.cmd.highlight({ "SignColumn", "guibg=NONE", "ctermbg=NONE" })
