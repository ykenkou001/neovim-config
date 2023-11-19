lua << EOF

local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
    --[[ rust_analyzer = function()  -- 個別に設定することもできる
         require('rust-tools').setup({})
     end,
     ]]
})

EOF
