local lsp = require('lsp-zero')

lsp.preset('recommended')

-- I uninstalled deno so that it wouldn't clash with TS. Moving forward I can run MasonInstall deno if I start working deno again.
lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'eslint',
})

-- Might need to manually configure the godot editor to point to the correct port
lsp.configure('gdscript', {
  force_setup = true
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['Tab'] = cmp.mapping.select_prev_item(cmp_select),
  ['Shift+Tab'] = cmp.mapping.select_next_item(cmp_select),
  -- Don't know why I need this on my personal machine when I don't need it anywhere else
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["Space"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "L", function() vim.diagnostic.open_float() end, opts)
end)

lsp.setup()
