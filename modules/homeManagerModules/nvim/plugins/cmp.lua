local cmp = require("cmp")

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

  -- configure lspkind for vs-code like pictograms in completion menu
})

