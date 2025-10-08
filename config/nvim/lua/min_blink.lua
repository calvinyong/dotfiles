return {
  {
    -- Autocompletion
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
      },

      sources = {
        default = { "path", "buffer" },
      },

      -- Uncomment to use prebuilt recommended rust implementation
      -- See :h blink-cmp-config-fuzzy for more information
      -- fuzzy = { implementation = "prefer_rust_with_warning" }
      fuzzy = { implementation = "lua" },
    },
  },
}
