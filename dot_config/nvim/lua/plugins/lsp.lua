-- Per-server overrides passed to vim.lsp.config(). Servers installed via Mason but
-- not listed here are still enabled by mason-lspconfig with default settings.
local servers = {
  cssls = {
    settings = {
      css = { validate = true },
      less = { validate = true },
      scss = { validate = true },
    },
  },
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        linksInHover = false,
        codelenses = {
          generate = true,
          gc_details = true,
          regenerate_cgo = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        usePlaceholders = true,
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false },
      },
    },
  },
  rust_analyzer = {},
  ts_ls = {
    init_options = {
      hostInfo = "neovim",
    },
  },
  elixirls = {},
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["http://json.schemastore.org/kustomization"] = "*/kustomize/*",
        },
      },
    },
  },
  marksman = {},
}

-- Buffer-local keymaps for every LSP client, including gopls
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local nmap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", function() require("telescope.builtin").lsp_references() end, "[G]oto [R]eferences")
    nmap("gI", function() require("telescope.builtin").lsp_implementations() end, "[G]oto [I]mplementation")
    nmap("<leader>D", function() require("telescope.builtin").lsp_type_definitions() end, "Type [D]efinition")
    nmap("<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, "[D]ocument [S]ymbols")
    nmap("<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "[W]orkspace [S]ymbols")
    -- See `:help K` for why this keymap
    nmap("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover Documentation")
    nmap("<C-p>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, "Signature Documentation")
    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "j-hui/fidget.nvim",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("fidget").setup()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
    end,
  },
  {
    -- Neovim runtime + plugin types for lua_ls, only when editing Lua
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
      end

      -- Installs the servers above and enables every Mason-installed server
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
    end,
  },
}
