-- Shahzad's NeoVim(nvim) Specific Plugins that can only be configured with Lua.

if vim.fn.has('nvim') == 1 then
    -------------------------------------------------------------------------------------------------DRESSING
    -- Nothing for now
    require("dressing")

    ------------------------------------------------------------------------------------------------TELESCOPE
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup {
        path_display = { "truncate " },

        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            }
        },

        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    }

    -- To get fzf loaded and working with telescope, we need to call load_extension, (after setup function).
    telescope.load_extension("fzf")

    -- set keymaps (global mappings set in: .vim/plug-manager/neo/mappings.vim)
    -- vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    -- vim.keymap.set("n", "<Leader>fr", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd live" })
    -- vim.keymap.set('n', '<Leader>fb', "<cmd>Telescope buffers<CR>", { desc = "Find in buffers" })
    -- vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    -- vim.keymap.set("n", "<Leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
    -- vim.keymap.set("c", "<C-p>", "Telescope command<CR>", { desc = "Find in previous command line mode history" })

    ------------------------------------------------------------------------------------------------------LSP

    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local lsputil = require "lspconfig/util"

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Diagnostic symbols in the sign column
    local signs = { Error = " ", Warn = " ", Hint = "?", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lspOptions = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
        lspOptions.buffer = bufnr

        -- key mappoings

        lspOptions.desc = "Show LSP references"
        vim.keymap.set("n", "<Space>rf", "<cmd>Telescope lsp_references<CR>", lspOptions)

        lspOptions.desc = "Show LSP definitions"
        vim.keymap.set("n", "<Space>d", "<cmd>Telescope lsp_definitions<CR>", lspOptions)

        lspOptions.desc = "Show LSP implementations"
        vim.keymap.set("n", "<Space>i", "<cmd>Telescope lsp_implementations<CR>", lspOptions)

        lspOptions.desc = "Show LSP type definitions"
        vim.keymap.set("n", "<Space>t", "<cmd>Telescope lsp_type_definitions<CR>", lspOptions)

        lspOptions.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<Space>e", "<cmd>Telescope diagnostics bufnr=0<CR>", lspOptions)

        lspOptions.desc = "Go to declaration"
        vim.keymap.set("n", "<Space>c", vim.lsp.buf.declaration, lspOptions)

        lspOptions.desc = "Smart rename"
        vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, lspOptions)

        lspOptions.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "<Space>k", vim.lsp.buf.hover, lspOptions)

        lspOptions.desc = "Show line diagnostics"
        vim.keymap.set("n", "<Space>l", vim.diagnostic.open_float, lspOptions)

        lspOptions.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "<Space>[", vim.diagnostic.goto_prev, lspOptions)

        lspOptions.desc = "Go to next diagnostic"
        vim.keymap.set("n", "<Space>]", vim.diagnostic.goto_next, lspOptions)

        lspOptions.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<Space>a", vim.lsp.buf.code_action, lspOptions)

        lspOptions.desc = "Restart LSP"
        vim.keymap.set("n", "<Space>res", ":LspRestart<CR>", lspOptions)
    end

    -------------------------------------------------------------------------------------------LSP-WITH-MASON
    require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

    require("mason-lspconfig").setup {

        -- A list of servers to automatically install if they're not already installed.
        -- Example: { "rust_analyzer@nightly", "lua_ls" }
        -- This setting has no relation with the `automatic_installation` setting.
        ---@type string[]
        ensure_installed = {
            "bashls",
            "gopls",
            "html",
            "lua_ls",
            "prismals",
            "pyright",
            "rust_analyzer",
            "svelte",
            "tailwindcss",
            "tsserver",
        },

        -- Whether servers that are set up (via lspconfig) should be automatically installed
        -- if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        --   - false: Servers are not automatically installed.
        --   - true: All servers set up via lspconfig are automatically installed.
        --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided
        --     in the list, are automatically installed.
        --     Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        ---@type boolean
        automatic_installation = true,

        -- See `:h mason-lspconfig.setup_handlers()` Look below we do this right after.
        ---@type table<string, fun(server_name: string)>?
        handlers = nil,
    }

    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            lspconfig[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end,

        -- Next, we can provide targeted overrides for specific servers.
        -- configure graphql language server

        ["gopls"] = function ()
            lspconfig.gopls.setup {
                capabilities = capabilities,
                on_attach = on_attach,

                -- custom setting, inaddtion to above.
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },

                root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },

            }
        end,

        ["graphql"] = function ()
            lspconfig.graphql.setup {
                capabilities = capabilities,
                on_attach = on_attach,

                -- custom setting, inaddtion to above.
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            }
        end,

        ["lua_ls"] = function ()
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,

                -- custom setting, inaddtion to above.
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            }
        end,
    }

    require("mason-tool-installer").setup({
            -- a list of all tools you want to ensure are installed upon start
            ensure_installed = {

                -- pin golangci-lint tool version
                { 'golangci-lint', version = 'v1.54.0' },

                -- always keep bash auto-update on.
                { 'bash-language-server', auto_update = true },

                "black",
                "eslint_d",
                "gopls",
                "isort",
                "prettier",
                "pylint",
                "stylua",
                'editorconfig-checker',
                'gofumpt',
                'golines',
                'gomodifytags',
                'gotests',
                'impl',
                'json-to-struct',
                'lua-language-server',
                'misspell',
                'revive',
                'shellcheck',
                'shfmt',
                'staticcheck',
                'stylua',
                'vim-language-server',
                'vint',
                'yamllint',
            },

            -- if set to true this will check each tool for updates. If updates
            -- are available the tool will be updated. This setting does not
            -- affect :MasonToolsUpdate or :MasonToolsInstall.
            -- Default: false
            auto_update = true,

            -- automatically install / update on startup. If set to false nothing
            -- will happen on startup. You can use :MasonToolsInstall or
            -- :MasonToolsUpdate to install tools and check for updates.
            -- Default: true
            run_on_start = true,
        })


    --------------------------------------------------------------------------------------------LSP-LENS.NVIM

    local SymbolKind = vim.lsp.protocol.SymbolKind
    require("lsp-lens").setup({
            enable = true,
            include_declaration = false, -- Reference include declaration
            sections = {                -- Enable / Disable specific request, formatter example looks 'Format Requests'
                definition = false,
                references = true,
                implements = true,
                git_authors = true,
            },
            ignore_filetype = {
                "prisma",
            },
            -- Target Symbol Kinds to show lens information
            target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
            -- Symbol Kinds that may have target symbol kinds as children
            wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
        })

    -----------------------------------------------------------------------------------------------CMP & SNIP

    -- nvim-cmp and luesnip setup
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    local lspkind = require("lspkind")
    local cmp = require("cmp")
    cmp.setup {
        completion = {
            completeopt = "menu,menuone,preview,noselect",
        },

        snippet = { -- configure how nvim-cmp interacts with snippet engine
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down

                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion

                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions

                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- select only if hit enter

                ["<C-e>"] = cmp.mapping.abort(), -- close completion window

                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

            ['<S-Tab>'] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

        }),

    -- sources for autocompletion
    sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
        }),

    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
        format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = "...",
            }),
    },

}


---------------------------------------------------------------------------------------------- SHADE.NVIM
--    require'shade'.setup({
--        overlay_opacity = 50,
--        opacity_step = 1,
--        keys = {
--            brightness_up    = '<C-Up>',
--            brightness_down  = '<C-Down>',
--            toggle           = '<Leader>sh',
--        }
--    })

    end
