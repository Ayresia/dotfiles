local servers = { 
    "rust_analyzer",
    "tsserver",
    "pyright",
    "tailwindcss",
    "jsonls",
    "html",
    "cssls",
    "omnisharp"
}

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end

            local capabilities = require("cmp_nvim_lsp")
                .default_capabilities(vim.lsp.protocol.make_client_capabilities())

            require("luasnip.loaders.from_vscode").lazy_load()

            for _, server in ipairs(servers) do 
                require("lspconfig")[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
            end
        end
    }
}