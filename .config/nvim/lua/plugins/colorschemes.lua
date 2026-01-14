return {	
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true
  },
  {
    "oncomouse/lushwal.nvim",
    cmd = { "LushwalCompile" },
    dependencies = {
      { "rktjmp/lush.nvim" },
      { "rktjmp/shipwright.nvim" }
    },
    lazy = false,
    wal_path = vim.fn.expand("/home/Rory/.cache/wal/colors.json"),
    enabled = false,
  }
}
