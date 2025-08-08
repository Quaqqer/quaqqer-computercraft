vim.lsp.config('lua_ls', {
   settings = {
      Lua = {
         workspace = {
            library = { './misc/lua-libs/lua-ls-cc-tweaked/library' },
         },
      },
   },
})
