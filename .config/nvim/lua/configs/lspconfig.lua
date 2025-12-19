require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html", 
  "cssls",
  "ts_ls",           -- TypeScript/JavaScript
  "tailwindcss",     -- Tailwind CSS
  "biome",           -- Biome (formatter/linter)
  "eslint",          -- ESLint
}

vim.lsp.enable(servers)
