--[[
-- Resources:
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
--
--
-- Other plugins:
--
-- https://github.com/max397574/startup.nvim
-- https://github.com/Darazaki/indent-o-matic
--]]

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- There is a slight difference between vim.o and vim.opt
-- See :help lua-options
--     :help lua-guide-options
--
-- vim.opt will be removed in the future
-- https://github.com/neovim/neovim/issues/30383#issuecomment-2351519326

-- Line numbers
vim.o.nu = true
vim.o.rnu = true

-- Show whitespace
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Break at convenient points rather than last character
vim.o.linebreak = true

-- Case insensitive searching unless there are
-- capital letters in the search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tabs = 4 spaces
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Disable showmode since we have lualine
vim.o.showmode = false

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Disable neovim perl provider
vim.g.loaded_perl_provider = 0

--vim.opt.scrolloff = 1
--vim.opt.smoothscroll = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Colorschemes
    --"arcticicestudio/nord-vim",

    { "gbprod/nord.nvim" },

    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        style = "night",
        styles = {
          -- Disable italics in comments/keywords
          comments = { italic = false },
          keywords = { italic = false },
        },
      },
    },

    {
      "echasnovski/mini.pairs",
      version = false,
      event = "VeryLazy",
      opts = { modes = { insert = true, command = true, terminal = false }, markdown = true },
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = { variant = "dark", color_icons = false } },
      },
      --opts = { theme = "tokyonight-night" },
      opts = {},
    },

    -- { "windwp/nvim-ts-autotag", opts = {} },
    -- { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      },
    },

    -- Autoformatter
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      keys = {
        {
          "<leader>f",
          function()
            require("conform").format({ async = true })
          end,
          mode = "",
          desc = "[F]ormat buffer",
        },
      },
      -- This will provide type hinting with LuaLS
      ---@module "conform"
      ---@type conform.setupOpts
      opts = {
        --notify_on_error = false,
        formatters_by_ft = {
          ["_"] = { "trim_whitespace", "trim_newlines" },
          lua = { "stylua" },
          python = { "ruff_organize_imports", "ruff_format" },
          rust = { "rustfmt" },
          html = { "prettier" },
          sh = { "shfmt" },
          -- You can use 'stop_after_first' to run the first available formatter from the list
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          rustfmt = {
            options = {
              default_edition = 2024,
            },
          },
        },
        format_on_save = {
          timeout_ms = 500,
          formatters = { "trim_whitespace", "trim_newlines" },
        },
      },
    },

    {
      "lervag/vimtex",
      lazy = false, -- we don't want to lazy load VimTeX
      -- tag = "v2.15", -- uncomment to pin to a specific release
      init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
      end,
    },

    -- Automatic indentation detection
    {
      "Darazaki/indent-o-matic",
      opts = {
        -- Defaults to 2048
        max_lines = 500,
      },
    },

    --{ import = "min_blink" },
    { import = "lsp" },
    -- Consistent syntax highlighting
    { import = "treesitter" },
  },

  -- Color scheme for Lazy
  install = { colorscheme = { "tokyonight-night" } },
  --install = { colorscheme = { "nord" } },

  -- Disable checking for plugin updates on startup
  checker = { enabled = false },

  -- For silencing the checkhealth warning
  rocks = { enabled = false },
})

--vim.cmd([[colorscheme nord]])
vim.cmd([[colorscheme tokyonight]])
