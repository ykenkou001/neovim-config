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
    " call dein#add('Shougo/dein.Vim')

    if exists('g:vscode')
        " VSCode extension
        let s:vscode_file = fnamemodify(expand('<sfile>'), ':h').'/vscode.toml'
        call dein#load_toml(s:vscode_file)
    else
        " プラグイン読み込み＆キャッシュ作成
        let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
        call dein#load_toml(s:toml_file)

        " 不足プラグインの自動インストール
        if has('vim_starting') && dein#check_install()
            call dein#install()
        endif
    endif
    " Finish Dein initialization (required)
    call dein#end()
    call dein#save_state()
endif

