return {
  "lfv89/vim-interestingwords",
  -- keys will overwrite default keymaps
  keys = {
    { "<leader>k", ":call InterestingWords('n')<cr>", desc = "InterestingWords"},
    { "<leader>K", ":call UncolorAllWords()<cr>", desc = "UncolorAllWords" }
  }
}
