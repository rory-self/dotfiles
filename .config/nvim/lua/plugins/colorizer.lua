return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local configs = require("colorizer")
    configs.setup()
  end,
}
