-- return {
--   "AlexvZyl/nordic.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nordic").load()
--   end,
-- }

-- return {
--   "audibleblink/hackthebox.vim",
--   config = function()
--     vim.cmd([[colorscheme hackthebox]])
--   end,
-- }
-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
--   config = function()
--     vim.cmd([[colorscheme onedark_dark]])
--   end,
-- }
--
-- return {
--   {
--     "HoNamDuong/hybrid.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd("colorscheme hybrid")
--     end,
--   },
-- }

-- return {
--   "Yazeed1s/minimal.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("minimal")
--   end,
-- }

-- return {
--   "kdheepak/monochrome.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("monochrome")
--   end,
-- }

return {
  "RRethy/base16-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.edge_enable_italic = true
    vim.cmd.colorscheme("base16-decaf")
  end,
}

-- return {
--   -- add dracula
--   { "Mofiqul/dracula.nvim" },
--
--   -- Configure LazyVim to load dracula
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "dracula",
--     },
--   },
-- }
