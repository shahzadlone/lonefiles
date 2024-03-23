# Extra Stuff

## Technically coc-settings.json should be either under:
    - .vim/coc-settings.json
    - .config/nvim/coc-settings.json

I moved it here from `.config/nvim/coc-settings.json` while moving to native
neovim LSP support, I would have kept it in `.vim/coc-settings.json` but coc
is no longer supported on normal vim (non-neovim) so decided to keep it here
for tracebility, atleast until my new LSP server config is fully migrated.

Would have loved to put the above note directly in coc-settings.json but sadly
JSON files don't support comments :,)
