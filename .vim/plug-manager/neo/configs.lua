-- Shahzad's NeoVim(nvim) Specific Plugins that can only be configured with Lua.

if vim.fn.has('nvim') == 1 then

-----------------------------------------------------------------------------LSP-LENS.NVIM

local SymbolKind = vim.lsp.protocol.SymbolKind
require'lsp-lens'.setup({
  enable = true,
  include_declaration = true, -- Reference include declaration
  sections = {                -- Enable / Disable specific request, formatter example looks 'Format Requests'
    definition = true,
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


------------------------------------------------------------------------------- SHADE.NVIM
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
