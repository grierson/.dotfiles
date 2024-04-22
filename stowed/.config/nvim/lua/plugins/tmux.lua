return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    require 'nvim-tmux-navigation'.setup {
      keybindings = {
        left = "<C-left>",
        down = "<C-down>",
        up = "<C-up>",
        right = "<C-right>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      }
    }
  end
}
