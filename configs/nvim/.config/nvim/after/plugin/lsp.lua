vim.opt.completeopt = { "menuone", "noselect" }

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.confirm(),
        ["<C-e>"] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    })
})

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

require("lspconfig")["omnisharp"].setup({
    cmd = { "omnisharp" },
    on_attach = on_attach,
    capabilities = capabilities
});
