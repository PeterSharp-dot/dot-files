require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim', 'Snacks' }, -- pozwala na używanie np. 'vim.api'
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- opcjonalnie
      },
      telemetry = {
        enable = false,
      },
    }
  }
})
