local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- language servers
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
  
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },

})

