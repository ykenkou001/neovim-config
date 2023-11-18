let g:deepl#endpoint = "https://api-free.deepl.com/v2/translate"
let g:deepl#auth_key = readfile(expand('~/.config/deepl.auth_key'))[0]

" replace a visual selection
vmap t<C-e> <Cmd>call deepl#v("EN")<CR>
vmap t<C-j> <Cmd>call deepl#v("JA")<CR>

" translate a current line and display on a new line
nmap t<C-e> yypV<Cmd>call deepl#v("EN")<CR>
nmap t<C-j> yypV<Cmd>call deepl#v("JA")<CR>

" specify the source language
" translate from FR to EN
nmap t<C-e> yypV<Cmd>call deepl#v("EN", "FR")<CR>
