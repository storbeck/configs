-- LSP setup
local lspconfig = require("lspconfig")

-- Enable LSP servers
local servers = {
  ts_ls = {},    -- Typescript
  gopls = {},    -- Go
  html = {},     -- HTML
  cssls = {},    -- CSS
  jsonls = {},   -- JSON
  marksman = {}, -- Markdown
}

for name, config in pairs(servers) do
  lspconfig[name].setup(vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }, config))
end

-- Autocomplete setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

