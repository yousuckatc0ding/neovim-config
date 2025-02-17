return {
    -- Mason: Manage LSP, DAP, Linters, and Formatters
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason-LSPConfig: Bridge Mason and LSPConfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        automatic_installation = true, -- Automatically install missing servers
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {  "jedi_language_server", "lua_ls", "clangd", "rust_analyzer", "zls", "html", "marksman", "tailwindcss" }, -- List of servers to ensure installe
            })
        end,
    },

    -- LSPConfig: Language Server Configurations
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp" },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Extend LSP capabilities
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- List of servers to configure
            local servers = { "jedi_language_server", "lua_ls", "clangd", "rust_analyzer", "zls", "html", "marksman", "tailwindcss"}

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Keybindings for LSP
                        local opts = { noremap = true, silent = true, buffer = bufnr }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    end,
                })
            end
        end,
    },

    -- Autocompletion Setup
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion source
            "hrsh7th/cmp-buffer",   -- Buffer completion
            "hrsh7th/cmp-path",     -- File path completion
            "hrsh7th/cmp-cmdline",  -- Command-line completion
            "L3MON4D3/LuaSnip",     -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completions
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            require("luasnip").expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            require("luasnip").jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP source
                    { name = "luasnip" },  -- Snippet source
                }, {
                    { name = "buffer" },   -- Buffer source
                    { name = "path" },     -- Path source
                }),
            })

            -- Command-line completion
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },

    -- Snippet Engine
    { "L3MON4D3/LuaSnip" },
}
