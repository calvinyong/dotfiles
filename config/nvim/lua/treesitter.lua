return {
  -- Highlight, edit, and navigate code
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    opts = {
      -- These can be installed via pacman
      -- Uncomment if no pacman
      -- ensure_installed = {
      --   "bash",
      --   "c",
      --   "javascript",
      --   "lua",
      --   "markdown",
      --   "python",
      --   "query",
      --   "rust",
      --   "vim",
      --   "vimdoc",
      -- },
      --ensure_installed = { "astro", "html" },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
