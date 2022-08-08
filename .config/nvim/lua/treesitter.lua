-- Treesitter is a high-performance parser for providing IDE-like features in Neovim.
-- Results in things like
--
--   1. Faster and more accurate syntax highlighting
--   2. Smart-select (incremental selection based on AST nodes)

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "bash",
    "bibtex",
    "c", 
    "clojure",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "haskell",
    "html",
    "java",
    "javascript",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "perl",
    "proto",
    "python",
    "rust",
    "sql",
    "vim",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = { enable = true },
  indent = {
    enable = true,
    disable = {
      -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1136
      "python",
    }, 
  },

  incremental_selection = { 
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "<c-k>",
      scope_incremental = "<enter>",
      node_decremental = "<c-j>",
    },
  },

  -- Provided by nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["a#"] = "@comment.outer",
        ["i#"] = "@comment.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]b"] = "@block.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]B"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[b"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[B"] = "@class.outer",
      },
    },
  },
} 


-- Disable vimtex's syntax highlighting, so it can be handled by Treesitter.
-- Cf. https://github.com/lervag/vimtex/commit/dfaca59bbbf0079ab1b4f159337ae7f17d1b5289
vim.g.vimtex_syntax_enabled = 0
