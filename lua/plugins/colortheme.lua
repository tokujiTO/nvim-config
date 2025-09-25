return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  -- A chave 'opts' não é necessária se você usar 'config' para isso
  config = function()
    -- O comando para definir o tema DEVE estar aqui dentro
    vim.cmd.colorscheme 'tokyonight-storm'
  end,
}
