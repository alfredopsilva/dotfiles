-- ~/.config/nvim/lua/plugins/highlight-colors.lua

return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require("nvim-highlight-colors").setup({
      -- Configuration options here, or leave empty to use defaults
      render = "foreground",
      enable_named_colors = false,
    })
  end,
}
