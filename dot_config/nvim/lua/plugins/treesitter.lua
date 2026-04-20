return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install({
        "c",
        "cpp",
        "go",
        "lua",
        "vim",
        "python",
        "rust",
        "typescript",
        "hcl",
        "javascript",
        "ruby",
        "dockerfile",
        "c_sharp",
        "markdown",
        "comment",
        "json",
        "yaml",
        "make",
        "elixir",
        "bash",
        "vimdoc",
      })

      -- Disable treesitter for .tmpl files
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = "*.tmpl",
        callback = function(args)
          vim.treesitter.stop(args.buf)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      })

      -- Select
      local select_fn = function(query)
        return function()
          require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
        end
      end
      vim.keymap.set({ "x", "o" }, "aa", select_fn("@parameter.outer"))
      vim.keymap.set({ "x", "o" }, "ia", select_fn("@parameter.inner"))
      vim.keymap.set({ "x", "o" }, "af", select_fn("@function.outer"))
      vim.keymap.set({ "x", "o" }, "if", select_fn("@function.inner"))
      vim.keymap.set({ "x", "o" }, "ac", select_fn("@class.outer"))
      vim.keymap.set({ "x", "o" }, "ic", select_fn("@class.inner"))

      -- Move
      local move = require("nvim-treesitter-textobjects.move")
      local move_fn = function(fn, query)
        return function()
          fn(query, "textobjects")
        end
      end
      vim.keymap.set({ "n", "x", "o" }, "]m", move_fn(move.goto_next_start, "@function.outer"))
      vim.keymap.set({ "n", "x", "o" }, "]]", move_fn(move.goto_next_start, "@class.outer"))
      vim.keymap.set({ "n", "x", "o" }, "]M", move_fn(move.goto_next_end, "@function.outer"))
      vim.keymap.set({ "n", "x", "o" }, "][", move_fn(move.goto_next_end, "@class.outer"))
      vim.keymap.set({ "n", "x", "o" }, "[m", move_fn(move.goto_previous_start, "@function.outer"))
      vim.keymap.set({ "n", "x", "o" }, "[[", move_fn(move.goto_previous_start, "@class.outer"))
      vim.keymap.set({ "n", "x", "o" }, "[M", move_fn(move.goto_previous_end, "@function.outer"))
      vim.keymap.set({ "n", "x", "o" }, "[]", move_fn(move.goto_previous_end, "@class.outer"))

      -- Swap
      vim.keymap.set("n", "<leader>a", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end)
      vim.keymap.set("n", "<leader>A", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
      end)
    end,
  },
}
