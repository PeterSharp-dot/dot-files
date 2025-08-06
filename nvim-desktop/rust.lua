require('lspconfig').rust_analyzer.setup({
  cmd = { "/home/peter/.cargo/bin/rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    }
  }
})
