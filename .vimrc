set nocompatible            " 必ず最初に書く
"filetype off
filetype on

set ambiwidth=double
"set viminfo='20,<50,s10,h,! " YankRing用に!を追加
set lazyredraw              " マクロなどを実行中は描画を中断
colorscheme desert          " カラースキーム

set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab              " タブを空白文字に展開

set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions+=m           " 整形オプション，マルチバイト系を追加

set wildmenu           " コマンド補完を強化
set wildmode=list:full " リスト表示，最長マッチ

set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

set nobackup   " バックアップ取らない
set autoread   " 他で書き換えられたら自動で読み直す
set autoindent " 自動でインデント
set noswapfile " スワップファイル作らない
set hidden     " 編集中でも他のファイルを開けるようにする

set showmatch         " 括弧の対応をハイライト
set showcmd           " 入力中のコマンドを表示
set wrap              " 画面幅で折り返す
set list              " 不可視文字表示
set listchars=tab:>\  " 不可視文字の表示方法
set notitle           " タイトル書き換えない
set scrolloff=5       " 行送り
set nosmartindent

" ステータスライン関連
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" エンコーディング関連
set ffs=unix,dos,mac " 改行文字

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

" neocomplcache関係の設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

syntax on " シンタックスカラーリングオン
"filetype on
au BufNewFile,BufRead *.psgi set filetype=perl
au BufNewFile,BufRead *.cgi set filetype=perl
au BufNewFile,BufRead *.conf set filetype=conf
"au BufNewFile,BufRead *.slim set filetype=slim tabstop=2 shiftwidth=2 softtabstop=2
"au BufNewFile,BufRead *.slim set filetype=slim
"au BufNewFile,BufRead *.rb set tabstop=4 shiftwidth=4 softtabstop=0

set complete+=k    " 補完に辞書ファイル追加
"filetype indent on " ファイルタイプによるインデントを行う
filetype plugin on " ファイルタイプごとのプラグインを使う

"noremap j gj
"noremap k gk
"vnoremap j gj
"vnoremap k gk
" コメントアウトの自動挿入をやめる
autocmd FileType * setlocal formatoptions-=ro

"json
map <Leader>j !python -m json.tool<CR>

" ハイライト消す
"nmap <silent> gh :nohlsearch<CR>

"autocmd BufNewFile,BufRead *.tt set ft=xhtml fenc=utf-8

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"set nocompatible
"filetype off
" 
"if has('vim_starting')
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"    call neobundle#rc(expand('~/.vim/bundle/'))
"endif
"
"" 利用中のプラグインをNeoBundle
"NeoBundle 'http://github.com/Shougo/neocomplcache'
"NeoBundle 'http://github.com/Shougo/neosnippet'
""NeoBundle 'http://github.com/Shogo/unite.vim'
"NeoBundle 'http://github.com/scrooloose/nerdcommenter'
"NeoBundle 'http://github.com/tpope/vim-surround'
""NeoBundle 'http://github.com/thinca/vim-puickrun'
"NeoBundle 'http://github.com/thinca/vim-ref'
"NeoBundle 'http://github.com/kana/vim-fakeclip'
"
""ruby
"NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'tpope/vim-rails'
"NeoBundle 'tpope/vim-cucumber'
"
""haml
"NeoBundle 'https://github.com/tpope/vim-haml'
"
""slim
""NeoBundle "bbommarito/vim-slim.git"
"NeoBundle "slim-template/vim-slim"
"
""js
"NeoBundle 'pangloss/vim-javascript'
"
"" Color Scheme
""NeoBundle 'altercation/vim-colors-solarized'
" 
"filetype plugin on
"filetype indent on
"   
"" Color Scheme Configure:
""syntax enable
""set background=light
""let g:solarized_termcolors=256
""colorscheme solarized
