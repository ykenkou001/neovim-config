" inoremap <silent><expr> <TAB>
"       \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
"       \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"       \ '<TAB>' : ddc#map#manual_complete()
inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" +++++++++++++++++ Settings +++++++++++++++++
let g:pum#max_horizontal_items = 15 " max_horizontal_items

