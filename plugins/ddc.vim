" vim-lsp の設定
if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
endif

if executable('vim-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->['vim-language-server', '--stdio']},
        \ 'allowlist': ['vim'],
        \ })
endif

" call ddc_nvim_lsp_setup#setup()

" call lspconfig#denols#setup()

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'nvim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'nvim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#custom#patch_global('sourceParams', #{
      \   nvim-lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \   }
      \ })
 " \   'forceCompletionPattern': '\.|:|->|"\w+/*',

call ddc#enable()

