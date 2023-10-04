" 下記参考にdein.vimをinstall
" https://qiita.com/MickeyOoh/items/b47ab0b8b5fbbbad3793

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
" let s:dein_base = '/home/ykenkou07/.cache/dein'
" Set Dein source path (required)
" let s:dein_src = '/home/ykenkou07/.cache/dein/repos/github.com/Shougo/dein.vim'
" Set Dein runtime path (required)
" execute 'set runtimepath+=' . s:dein_src

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)

    " Call Dein initialization (required)
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')

    if exists('g:vscode') " VSCode extension

        call dein#add('unblevable/quick-scope')
        highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

        call dein#add('asvetliakov/vim-easymotion')
        map <Leader> <Plug>(easymotion-prefix)
        " let g:EasyMotion_do_mapping = 0
        " let mapleader = "\<Space>"      " Leader Keyの設定
        let g:mapleader = ","      " Leader Keyの設定
        " <Leader>f{char} to move to {char}
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

        call dein#add('tpope/vim-commentary')
        xmap gc  <Plug>VSCodeCommentary
        nmap gc  <Plug>VSCodeCommentary
        omap gc  <Plug>VSCodeCommentary
        nmap gcc <Plug>VSCodeCommentaryLine

    else                  " ordinary Neovim
        " プラグイン読み込み＆キャッシュ作成
        let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
        call dein#load_toml(s:toml_file)
    endif
    
    " 不足プラグインの自動インストール
    if has('vim_starting') && dein#check_install()
        call dein#install()
    endif

    " Finish Dein initialization (required)
    call dein#end()
    call dein#save_state()
endif


" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  synta on
endif

" ################# Settings ##################################
" let g:mapleader = "\<Space>"      " Leader Keyの設定
set number                 " Row Number
inoremap <silent> jk <ESC> " jkでinsert modeから抜ける
inoremap <silent> jj <ESC> " jjでinsert modeから抜ける
set fenc=utf-8             " 文字コードをUTF-8に設定
set autoread               " 編集中のファイルが変更されたら自動で読み直す
" set cursorline             " 現在の行を強調表示
set smartindent            " インデントはスマートインデント
set visualbell             " ビープ音を可視化
set wildmode=list:longest  " コマンドラインの補完
" set autoindent            " 改行した時にインデント
set expandtab              " インデントにスペースを使う
set clipboard+=unnamedplus " clipboardオプション

" Tab系 --------------------------------------------------------
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" インデントにスペースを使う
set expandtab
" Tab文字の長さ
set tabstop=4
" 1つのインデントのスペース数
set shiftwidth=4

" 検索系 --------------------------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
" set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
map <Leader> <Plug>(easymotion-prefix)

