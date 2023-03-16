" プラグインが実際にインストールされるディレクトリ
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand("~/.config/nvim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
set number
" プログラミング言語に合わせて適切にインデントを自動挿入
set smartindent
" set autoindent   " 改行時の自動インデント
set tabstop=4    " タブの空白数
set shiftwidth=4 " 自動インデント時に入力する空白数
set splitright   " 画面を縦分割する際に右に開く 
set list
set listchars=eol:$,tab:>.,trail:_
set visualbell t_vb=
set showmatch	" 対応する括弧やブレースを表示
set title
set wildmode=list:longest " コマンドラインの補完
" バッファ内で扱う文字コードを指定
set encoding=utf-8
"読み込む文字コード(文字列のリスト) : この場合UTF-8を試し、だめならShift_JIS
set fileencodings=utf-8,cp932
set expandtab

inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>
syntax enable
hi QuickScopePrimary guifg=#ff0000
autocmd FileType r inoremap <buffer> > <Esc>:normal! a<Space>%>%<CR>a
autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a<Space>%>%<CR>a
autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a<Space>%>%<CR>a

" Set Leader Key
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"
let maplocalleader = ","

" python3
let g:python3_host_prog = "/usr/bin/python3"

" LanguageClient-neovim -----------------------------------------------
let g:LanguageClient_serverCommands = {'r': ['R', '--slave', '-e', 'languageserver::run()'], }
" LanguageClient-neovim -----------------------------------------------

let NERDTreeWinSize=20

" Nvim-R -------------------------------------------------------------$
let R_openpdf = 1
let R_rconsole_width = 70
" let R_rconsole_width = 0 " Rコンソールを常に下に表示$
" let R_enable_comment = 1
let R_assign_map = '<M-->'
" let R_assign = 2
" Nvim-R -------------------------------------------------------------$

" 検索系 -------------------------------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 検索系 -------------------------------------------------------------

" easy motion --------------------------------------------------------
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" easy motion --------------------------------------------------------


" LightLine.vim ------------------------------------------------------
set laststatus=2
" LightLine.vim ------------------------------------------------------

" NCM2 ---------------------------------------------------------------
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" NCM2 ---------------------------------------------------------------

