return {
  "audibleblink/hackthebox.vim",
  config = function()
    vim.cmd([[colorscheme hackthebox]])
  end,
}

-- return {
--   "RRethy/base16-nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.edge_enable_italic = true
--     vim.cmd.colorscheme("base16-decaf")
--   end,
-- }
