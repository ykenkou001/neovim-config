" 下記参考にdein.vimをinstall
" https://qiita.com/MickeyOoh/items/b47ab0b8b5fbbbad3793

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" 外部ファイルの読み込み
runtime! option.vim
runtime! keymap.vim
runtime! myfunction.vim " myfunction.vimの呼び出し
runtime! dein.vim

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
