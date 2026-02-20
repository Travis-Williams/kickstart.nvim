return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, bufnr) return vim.startswith(name, '.') end,
      is_always_hidden = function(name, bufnr) return name == '..' or name == '.DS_Store' or name == '.git' or name == '.github' end,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
