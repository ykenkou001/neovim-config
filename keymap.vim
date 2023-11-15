let g:mapleader = "\<Space>"         " Leader Keyの設定
map <Esc><Esc> :nohlsearch<CR><Esc> " ESC連打でハイライト解除
inoremap <silent> jk <ESC>
inoremap <silent> jj <ESC>

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

" 括弧やクォーテーションの自動補完 -------------------------------
" 括弧の自動補完
inoremap <expr> { InputParentheses("{")
inoremap <expr> [ InputParentheses("[")
inoremap <expr> ( InputParentheses("(")
" inoremap <expr> < InputParentheses("<")
" 閉じ括弧の入力
inoremap <expr> } InputCloseParenthesis("}")
inoremap <expr> ] InputCloseParenthesis("]")
inoremap <expr> ) InputCloseParenthesis(")")
" inoremap <expr> > InputCloseParenthesis(">")
" クォーテーションの入力
inoremap <expr> ' InputQuot("\'")
inoremap <expr> " InputQuot("\"")
inoremap <expr> ` InputQuot("\`")
" 改行の入力
inoremap <expr> <CR> InputCR()
" バックスペースの入力
inoremap <expr> <BS> InputBS()
