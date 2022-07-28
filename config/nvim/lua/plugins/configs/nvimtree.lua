nvimtree = require("nvim-tree")

nvimtree.setup {
  auto_close = true,
  hide_root_folder = true,
  view = {
    mappings = {
      list = {
        { key = "-", action = "" },
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}
