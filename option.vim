" ################# 見た目 ##################################
set list listchars=tab:\▸\- " 不可視文字を可視化(タブが「▸-」と表示される)
set number                  " Row Number
set relativenumber          " カーソル位置からの相対的な行番号
set title                   " ターミナルのタブ名に現在編集中のファイル名を設定
set title                   " ウインドウのタイトルバーにファイルのパス情報等を表示する
" set cursorline              " 現在の行を強調表示
setlocal matchpairs+=<:>    " <>もハイライト

" ################# 検索系・置換 ##################################
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan   " 検索時に最後まで行ったら最初に戻る
set hlsearch   " 検索語をハイライト表示

" ################# インデント ##################################
set tabstop=4     " Tab文字の長さ
set shiftwidth=4  " <Enter>,1つのインデントのスペース数
set smartindent   " インデントはスマートインデント
set autoindent    " 改行した時にインデント
set expandtab     " インデントにスペースを使う

" ################# 補完 ##################################
set wildmode=list:longest   " コマンドラインの補完
set wildmenu                " コマンドの補完
set infercase               " 補完時に大文字小文字を区別しない
" set wildoptions=pum        " pum.vim。pop up windowを表示する
set wildoptions+=pum        " pum.vim。pop up windowを表示する

" ################# 操作 ##################################
set clipboard+=unnamedplus  " clipboardオプション
set splitbelow              " newWindowが下
set splitright              " newWindowが右
set backspace=indent,eol,start

" ################# ログ ##################################
set history=500 "保持するコマンド履歴の数
set noswapfile " swapファイルを保存しない
set noundofile " undoファイルを保存しない
set nobackup " backupを保存しない
set nowritebackup "writebackupを保存しない
set viminfo= " viminfoファイルに保存しない

" ################# ターミナル ##################################
autocmd TermOpen * :startinsert

" ################# その他 ##################################
set fenc=utf-8              " 文字コードをUTF-8に設定
set autoread                " 編集中のファイルが変更されたら自動で読み直す
set visualbell              " ビープ音を可視化

autocmd BufNewFile ~/*.cpp :0r ~/.config/nvim/template/c++ " c++用のテンプレ
autocmd BufNewFile makefile :0r ~/.config/nvim/template/makefile " makefile用のテンプレ
" main.cppが作成されたらどう階層にCMakeLists.txtを作成する
" augroup create_main_cpp
"   autocmd!
"   autocmd BufNewFile main.cpp call CreateCMakeLists()
" augroup END

