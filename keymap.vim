let g:mapleader = "\<Space>"         " Leader Keyの設定
nmap <Esc><Esc> :nohlsearch<CR><Esc> " ESC連打でハイライト解除
inoremap <silent> jk <ESC>           " jkでinsert modeから抜ける
inoremap <silent> jj <ESC>           " jjでinsert modeから抜ける

" 画面分割時、hjklの方向ににカーソルを移動させる
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l

" 文章が画面の右端に到達すると折り返す設定をoption.vimで入れている
" hjklはデフォルトだと、折り返す前の表示で上下左右に移動できる
" つまり、折り返して表示した状態だと直感と実際のhjklの動作が違う
" これを修正するオプションがしたの4つ
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ターミナルモードのcインサートモードからノーマルモードをEscに
tnoremap <ESC> <C-\><C-n>
