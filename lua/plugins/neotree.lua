return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        -- Configuração para mostrar arquivos ocultos por padrão (Opção 1)
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false, -- <== MUDE ISTO PARA 'false'
            hide_gitignored = true,
          },
        },
        -- Você pode adicionar outras configurações do neo-tree aqui
      })

      -- Atalho para abrir/fechar o neo-tree (exemplo)
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
        desc = "Toggle Neo-tree",
        silent = true,
      })

      -- Atalho para mostrar/esconder arquivos ocultos (Opção 2 - RECOMENDADO)
      vim.keymap.set("n", "<leader>h", ":Neotree toggle_hidden<CR>", {
        desc = "[H]ide/Show hidden files in Neo-tree",
        silent = true,
      })
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { noremap = true, silent = true })
    end,
  },
}
