local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight  = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable= {},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { "#FF79C6", "#A4FFFF", "#50fa7b", "#FFFFA5", "#FF92DF", "#5e81ac", "#b48ead",},
    max_file_lines = nil,
  },
additional_vim_regex_highlighting = false,
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "astro",
    "markdown_inline",
  }

}
