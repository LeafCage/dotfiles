" vim: set fdm=marker sw=2 sts=2 cms="%s :


"=============================================================================

" スタートアップ
"==============
" scriptencodingと、このファイルのエンコードが一致するよう注意！
  " scriptencodingは、vimの内部エンコードと同じにすると問題が起きにくい。
  " 改行コードは set fileformat=unix に設定するとunixでも使えます。
    scriptencoding cp932


" システム設定{{{1
"=============
"\.vimや\vimfilesを$CFGHOMEと定義する: unix,win32でのpathの違いを吸収"{{{
  "$CFGHOMEはユーザーランタイムディレクトリを示す。
  "ランタイムパスを通す必要のあるプラグインを使用する場合、
  "$CFGHOMEを使用すると Windows/Linuxで切り分ける必要が無くなる。
  "例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合。
  "set runtimepath+=$CFGHOME/qfixapp
    if has('unix')
      let $CFGHOME=$HOME.'/.vim'
    else
      let $CFGHOME=$VIM.'\vimfiles'
      "let $CFGHOME=$VIM.'\.vim'
    endif"}}}

" 環境変数HOMEがないときは$VIM/HOMEを$HOMEにする
  if !exists("$HOME")
    let $HOME=$VIM/HOME
  endif

" UTF-8化を_vimrcで行う場合以下を有効にしてね。
  "source $CFGHOME/pluginjp/encode.vim
" _vimrcでscriptencodingと異なる内部エンコーディングに変更する場合、変更後に改めてscriptencodingを指定しておくと問題が起きにくくなります。
  "scriptencoding cp932

" マウスを有効にする。
  if has('mouse')
    set mouse=a
  endif


" バックアップ関係"{{{
  "ファイルの上書きの前にバックアップを作る/作らない
    "set writebackupを指定してもオプション 'backup' がオンでない限り、バックアップは上書きに成功した後に削除される。
      set nowritebackup
  "バックアップ/スワップファイルを作成する/しない。
    set nobackup
    "set noswapfile

    "set backup  " バックアップを有効にする
    set backupext=.bcu  " バックアップファイルの拡張子
  "バックアップファイルを作るディレクトリ
    set backupdir=~/auBcu/,~/yobi/,.	"バックアップを/auBcuかまたは編集されたファイルと同じディレクトリに取る
    set directory=~/vimswap/,. "スワップファイルswapfileの作成場所
    "let &directory = &backupdir  " スワップファイル（クラッシュ時に復元用）をバックアップディレクトリに作成

    if version >= 703
      "再読込、vim終了後も継続するアンドゥ(7.3)
       set undofile
      "アンドゥの保存場所(7.3)
       set undodir=~/auBcu/,.
    endif

  " viminfoを作成しない。
    "set viminfo=

  " ※フラグ解説：'マーク,<レジスタ行,sレジスタ(kb),h'hlsearch'無効,rリムーバルメディア,%バッファリストの保存復元
    set viminfo='20,<50,s10,h,ra:,rb:,% "viminfo-fileに保存される内容
    set viminfo+=n$VIM/.viminfo "viminfoを作成する場所
"}}} }}}1


" 環境・入力"{{{
"=========
" 設定
  set winaltkeys =no  "メニューバーと<M->が被ったときに、メニューバーにアクセスしない
  set virtualedit=block "Visual blockモードでフリーカーソル(仮想編集:文字のない場所にもカーソルを置ける)を有効にする
  set nrformats-=octal "+ 8進数を無効にする。<C-a>,<C-x>（加算と減算）などに影響する。
  set clipboard=


  set modeline  "モードライン（ファイルのヘッダ、フッタに書かれたvi用オプション）を有効にする
  set formatoptions& formatoptions+=mM "日本語の行の連結時には空白を入力しない。テキスト挿入中の自動折り返しを日本語に対応させる

  set completeopt=menu,menuone,longest,preview  " 補完機能を有効にする
  set browsedir=buffer   " ファイルブラウザ開始時の初期ディレクトリ （last 前回にファイルブラウザでファイルを選択したディレクトリ buffer バッファで開いているファイルのディレクトリ current カレントディレクトリ）
  "set wildmode=list:full " コマンドラインで、リスト表示，最長マッチモード（要wildchr）

  "イベントハンドラ
    set confirm  " バッファへの変更を保存しないで終了するとき、確認する
    set autoread   " 他で書き換えられたら自動で読み直す

"windows版gvimで、勝手にimeがon状態で始まるのを是正
  "set iminsert=0
  "set imsearch=-1

  "エンコーディング"{{{
    setglobal fileencoding=cp932 " +新規作成されるファイルエンコードをcp932にしたい
    "setglobal fileencoding=japan " +新規作成されるファイルエンコードをcp932にしたい
    set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,default,latin "読み込みで文字コード認識間違いをなるべく減らす
    set fileformats=dos,unix,mac " +改行コードの自動認識（新規作成されるファイルフォーマットをdosにしたい）
    set termencoding=utf-8 "vimshellに送る入力"}}}

  "タブ文字や空白文字、インデントの扱い"{{{
    set expandtab "タブを使わず、空白で代行（タブを入力するときはc-v<TAB>）
    set foldmethod=marker "+折り畳みの種類
    set tabstop=2  " いわゆる^Iの見かけのタブ幅。ファイル内の <tab>
    set shiftwidth=2  "cindentやautoindent時や>>をタイプしたときに挿入されるタブの幅（tabstopと揃えておくといい）
    "set shiftwidth=4  "cindentやautoindent時や>>をタイプしたときに挿入されるタブの幅（tabstopと揃えておくといい）
    set softtabstop=2 "<Tab>の挿入や<BS>の使用などの編集操作をするときの<Tab>が対応する空白の数
    "set softtabstop=4 "<Tab>の挿入や<BS>の使用などの編集操作をするときの<Tab>が対応する空白の数
    set autoindent  " 新しい行を挿入したとき、現在行と同じインデントを適用する(noautoindent:インデントしない)
    set cindent  " cプログラムファイルの自動インデントを行う
    set cinoptions& cinoptions+=:0  "Cインデントの設定(:h cinoptions-values参照)"}}}

  set timeoutlen=3500  "キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)。キータイプのタイムアウト時間
  set history=50  " : によるコマンドと以前に使った検索パターンの履歴ヒストリの保存数

"ここにカンマ区切りで登録されたパスに置かれたファイルは、ファイル名のみでアクセスできる。
  ""let &path +=$VIM/siic/settings,$VIMRUNTIME/plugin/myinstallplugin
  set path& path +=$VIM/siic/settings/

  set whichwrap=b,s,[,],<,>,h,l "以下のフラグで指定した移動コマンドでキャレットが行の端まで来たら次／前の行に
"}}}
set commentstring=%s

" 表示設定"{{{
"=========
" ※gvimの色テーマは.gvimrcで指定する。

" 基本設定
  set wrap  " 行を折り返す
  set textwidth=0 "規定文字数を越えると自動で改行されるのをやめさせる（なぜか78になってた）今でも78にされてる

  " マクロ実行中などの画面再描画を行わない。
    "set lazyredraw

" ウィンドウサイズ・レイアウト"{{{
  set lines=40  " ウィンドウサイズ縦幅　デフォルトは24
  set columns=100  " ウィンドウサイズ横幅　デフォルトは80
  "set helpheight=20  "ヘルプファイルを開いたときのウィンドウの高さ(デフォルト値=20）
  set scrolloff=2  " カーソルの上または下には、最低でもこのオプションに指定した数の行が表示される
  set winwidth=90 "ウィンドウ分割時カレントウィンドウのデフォルト幅
  "set splitbelow "窓分割で窓を常に下部に作る
  "}}}

" 情報表示（インフォメーション）
  set shm=filmnrwxToO "<C-g>などで、表示される情報のフォーマット
  set shm+=I "Vim開始時にメッセージを表示しない
  set foldcolumn=5 "左端に折り畳みの階層を表示
  se fcs=vert:\|  "空白を埋める文字

" 視覚情報
  set list  "不可視文字(Tabや空白)を表示する。
  set listchars=tab:>-,trail:_,extends:>,precedes:<,eol:$ " 不可視文字の表示方法¶
  set showmatch matchtime=1  "括弧の対応表示時間

  set foldtext=FoldCCtext()  "折り畳みテキスト生成で使う関数


"}}}


" 検索"{{{
"=======
  set wrapscan  "検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
  set hlsearch  "検索文字の強調(ハイライト)表示
  set tags=./tags,tags,../tags  "tagsファイルの読み込み先


" w,bの移動で認識する文字
  "set iskeyword=a-z,A-Z,48-57,_,.,-,>
"grepコマンドで使うプログラムを何にするか
  "set grepprg=internal  " vimgrep をデフォルトのgrepとする場合internal
  "set grepprg=D:/bnr/cmd/cygwingrep/bin/cyggrep.exe\ -nH ""-n;:行番表示-H;:ファイル名表示
  set grepprg=jvgrep ""-n;:行番表示-H;:ファイル名表示
  "set grepprg=cyggrep.exe\ -nH

" diffの設定"{{{
  if has('win32') || has('win64')"{{{
    set diffexpr=MyDiff()
    function! MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '""' . $VIMRUNTIME . '\diff"'
          let eq = '"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
  endif"}}}

" difforig（バッファと元ファイルでの更新を比較・変更箇所表示）を使用可能にする。
  command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
  command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
" パッチコマンド
  set patchexpr=MyPatch()
  function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
  endfunction
"}}}"}}}


" 単純なスクリプト"{{{
"==============
" ファイルを開いたら前回のカーソル位置へ移動
  augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line('$') |
      \   exe "normal! g`\"" |
      \ endif
  augroup END



"grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する。
  "if exists('+autochdir')
    ""autochdirがある場合カレントディレクトリを移動
    "set autochdir
  "else
    ""autochdirが存在しないが、カレントディレクトリを移動したい場合
    "au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
  "endif
"}}}

" 特殊ファイルの取り込み
"======================
source $VIM/vimfiles/vimrc/privacy.vim

"表示設定：その他見栄え・statuslineなど
source $VIM/vimfiles/vimrc/colorCstm.vim

let maplocalleader = ','
" キーマップ"{{{
"==========
  " <Leader>および、<LocalLeader>に使うキーを決める
    let mapleader = '\'
  "sを独自キーおよび<LocalLeader>にする（sを使いたいときはcl使えばいいよ）
    "nnoremap s <nop>
    nnoremap S <nop>
    "nnoremap <C-h> s

"設定・fixに近い"{{{
  "カーソル移動を直感的なgjgkに変える
    nnoremap j gj|nnoremap k gk|vnoremap j gj|vnoremap k gk
    nnoremap gj j|nnoremap gk k|vnoremap gj j|vnoremap gk k
  "インサートモードでの削除コマンドにundoを有効化させる
    inoremap <c-h> <c-g>u<c-h>
    inoremap <c-u> <c-g>u<c-u>
    "inoremap <c-w> <c-g>u<c-w>
"}}}

"特定キーの無効化・再配置"{{{
  "インサートモードで間違って出してほしくないキーを無効にする"{{{
    nnoremap <F1> <Nop>
    noremap <F13> <Nop>
    noremap! <F13> <Nop>
    noremap <F15> <Nop>
    noremap! <F15> <Nop>
    noremap <F16> <Nop>
    noremap! <F16> <Nop>
    inoremap <S-F16> <Nop>
    cnoremap <S-F16> <Nop>
    inoremap <M-j> <Nop>|"}}}
  "誤爆してほしくないキーを無効化
    "強制全保存終了を無効化。
      nnoremap ZZ <Nop>
    "レコーディングを無効化・再配置
      noremap zq q
      noremap q <Nop>
      noremap <silent>q :call <SID>close_specialwin()<CR>
        "qは特殊窓を遠隔で閉じるコマンドにする
function! s:close_specialwin() "{{{
  let crrwinnr = winnr()

  let deledlist = []
  windo call add(deledlist, s:close_specialwin2())

  for deledwinnr in reverse(deledlist)
    if deledwinnr == 0
      continue
    endif
    if deledwinnr < crrwinnr
      let crrwinnr -= 1
    endif
  endfor

  exe crrwinnr.'wincmd w'
endfunction "}}}
function! s:close_specialwin2() "{{{
  if &pvw || &bt =~ 'help\|quickfix' || &ft ==# 'unite'
    let winnr = winnr()
    hide
    return winnr
  endif
endfunction "}}}
" 既存キーマップを楽なキーマップに割り当て換える"{{{
  "使いづらいキーの再配置
    "使いづらい':'と、使用頻度が低い';'','の処理
      noremap ; :
      "noremap :: '
        "単品:だとnmap :call等のコマンドで不具合
      noremap ,; ;
      vnoremap ,; ;
      noremap z; ;
      vnoremap z; ;
      noremap z, ,
      vnoremap z, ,
    "^が押しづらいので-に変更
      noremap - ^
      noremap z- -
    "マクロの@はz@にして@で誤爆しない&自由に使えるようにする
      noremap z@ @
    "マークジャンプを押しやすいキーに
      noremap gm `
      noremap ,, `
    "undoフラグはctrlを押しっぱなしでも有効
      inoremap <c-g><c-u> <c-g>u
"}}}"}}}


"ノーマルモードで入力をする"{{{
  "改行を挿入する
    nnoremap <C-j> :a<CR><CR>.<CR>
    nnoremap <C-j> :<C-u>call <SID>Insert_CR()<CR>
    function! s:Insert_CR() "{{{
      let foldclosedend = foldclosedend('.')

      if foldclosedend != -1
        call append(foldclosedend, '')
      else
        call append('.', '')
      endif
      normal j
    endfunction "}}}

    nnoremap <C-k><C-j> :i<CR><CR>.<CR>
    nnoremap <C-k><C-w> :i<CR><CR>.<CR>
    nnoremap <C-w><C-k> :i<CR><CR>.<CR>
  "空白を一つ挿入するa bb a
    nnoremap <S-SPACE> i<Space><Esc>
    "nnoremap <M-SPACE> a<Space><Esc>
    nnoremap <M-SPACE> i<Space><Esc>la<Space><Esc>h
    nnoremap <SID>[space]1 i<Space><Esc>la<Space><Esc>h
    nnoremap <SID>[space]2 i<Space><Esc>lla<Space><Esc>h
    nnoremap <SID>[space]3 i<Space><Esc>llla<Space><Esc>h
    nnoremap <SID>[space]4 i<Space><Esc>lllla<Space><Esc>h
    nnoremap <SID>[space]5 i<Space><Esc>llllla<Space><Esc>h

"}}}


"window/buffer操作"{{{
  "ウィンドウやバッファやタブページを閉じる
    "レイアウトを保持してバッファを閉じるコマンド
      com! Kwbd let kwbd_bn= bufnr("%")|bn|exe "bdel ".kwbd_bn|unlet kwbd_bn|"ウィンドウレイアウトを保持したままバッファを閉じるコマンド
    nmap dv :bd<CR>|"バッファを閉じる
    nmap dn :Kwbd<cr>|"レイアウトを保持してバッファを閉じる
    nmap dc <C-w>c|"窓を閉じる
    nmap dq <C-w>c|"窓を閉じる
    nmap d<C-w> <C-w>c|"窓を閉じる
    nmap dz :tabc<CR>|"タブページを閉じる
    nmap du :tabc<CR>|"タブページを閉じる
    nmap dm :tabc<CR>|"タブページを閉じる
    nmap dgt :tabc<CR>|"タブページを閉じる
    "nmap cd :Kwbd<cr>|"レイアウトを保持してバッファを閉じる

  "ウィンドウ操作
    "noremap <silent> <C-w>[ :split|execute "help ".expand('<cword>')<CR>|"カーソルドワードを新規ウィンドウで:helpする
    "emacs風の窓操作
      "noremap <C-w>0 <C-w>c
      "noremap <c-w>1 <c-w>o
      "noremap <C-w>3 <C-w>v
      "noremap <C-w>2 <C-w>s

  "タブページ操作 *tabpage*
    "noremap <M-t> gt
    "inoremap <M-t> <Esc>gt
    "nmap <C-t> [\Tabcmd]

    "noremap <silent> <C-t> :tab split<CR>|"現在ページを新しいタブページで開く
    noremap <silent> <C-w>gt :tab split<CR>|"現在ページを新しいタブページで開く
    noremap <silent> <C-w>u :tab split<CR>|"現在ページを新しいタブページで開く
    noremap <silent> <C-w>m :tab split<CR>|"現在ページを新しいタブページで開く
    nmap <M-t>  <sid>(Tabcmd)
    "noremap <sid>(Tabcmd)<C-t> gt
    noremap <SID>(Tabcmd)<C-t> <C-t>
    "nnoremap <silent> <SID>(Tabcmd)p :<c-u>TabRecent<cr>|"直前のタブページに戻る（まだ未実装）
    noremap <silent> <SID>(Tabcmd)0 :tabclose<cr>|"タブページ閉じる
    noremap <silent> <SID>(Tabcmd)1 :tabonly<cr>|"現在タブページ以外を閉じる
    noremap <silent> <SID>(Tabcmd)o :tabonly<cr>|"現在タブページ以外を閉じる
    noremap <silent> <SID>(Tabcmd)c :tabclose<cr>|"タブページ閉じる
    "noremap <silent> <SID>(Tabcmd)w :tab split<CR>|"現在ページを新しいタブページで開く
    "noremap <silent> <SID>(Tabcmd)d :tab split<CR>|"現在ページを新しいタブページで開く
    noremap <silent> <SID>(Tabcmd)fv :tabe $VIM/.vimrc<CR>
    noremap <silent> <SID>(Tabcmd)] :execute "tab tag ".expand('<cword>')<CR>|"カーソルドタグを新規タブページで開く
    noremap <silent> <SID>(Tabcmd)[ :execute "tab help ".expand('<cword>')<CR>|"カーソルドワードを新規タブページで:helpする
    noremap <silent> <SID>(Tabcmd)K :execute "tab help ".expand('<cword>')<CR>|"カーソルドワードを新規タブページで:helpする
    noremap <silent> <SID>(Tabcmd)L :call <SID>lingrlaunch_in_newtab()<CR>|"Lingr.vimを別タブページで開く

  "次／前のバッファおよび次／前タブページへナビゲート
    noremap <silent> <M-h> :bp<CR>
    noremap <silent> <M-l> :bn<CR>
    noremap <silent> [space]h :bp<CR>
    noremap <silent> [space]l :bn<CR>
    noremap gr gT
    noremap <silent> [space]n gt
    noremap <silent> [space]p gT
    "noremap <M-i> <C-^>
  "次のウィンドウ・前のウィンドウへ
    noremap <M-j> <C-W>w
    noremap <M-k> <C-W>W
    noremap [space]j <C-W>w
    noremap [space]k <C-W>W
    inoremap <M-j> <Esc><C-W>w
    inoremap <M-k> <Esc><C-W>W
  "エラーリストをたぐる
    noremap <C-n> :cn<CR>
    noremap <C-p> :cp<CR>


  " 縦分割のwindowの幅を操作
    "noremap <C-w>a <C-w>=
    "noremap <C-w>A 5<C-w><lt>
  "windowの高さを操作
    noremap <C-w>e 5<C-w>+
    noremap <C-w>E <C-W>=10<C-w>+
    noremap <C-w>y 5<C-w>-
    noremap <C-w>Y <C-W>=10<C-w>-
    noremap <C-w>a <C-w>w20<C-W>+
  "window分割
    noremap <silent><C-w>S :botright wincmd s<CR>
  "高さや幅を変更するマップに置き換える／戻す
    "noremap <silent> <C-W>\ :call <SID>RemapWindowCtrl()<CR>
  "矢印＋シフトでウィンドウ幅変更
    nnoremap <silent> <S-Left>  :5wincmd <<CR>
    nnoremap <silent> <S-Right> :5wincmd ><CR>
    nnoremap <silent> <S-Up>    :5wincmd -<CR>
    nnoremap <silent> <S-Down>  :5wincmd +<CR>


   "アプリケーション窓を最大化する/元に戻す
    "noremap <M-w>x :simalt ~x<CR>
    "noremap <M-w><M-x> :simalt ~x<CR>
    "noremap <M-w>r :simalt ~r<CR>
    "noremap <M-w><M-r> :simalt ~r<CR>


"関数
  "ウィンドウ幅を変更する関数に
    let g:remapWinCtrl_on =0
    function! s:RemapWindowCtrl()
      if g:remapWinCtrl_on == 0
        nnoremap h <C-W><lt>
        nnoremap l <C-W>>
        nnoremap j <C-W>+
        nnoremap k <C-W>-
        let g:remapWinCtrl_on =1
      else
        nnoremap h <C-G>h
        nnoremap j <C-G>j
        nnoremap k <C-G>k
        nnoremap l <C-G>l
        let g:remapWinCtrl_on =0
      endif
    endfunction
"}}}

" カーソル移動コマンド"{{{
  "一つ下の他窓をスクロールさせる
    noremap <S-A-f> <C-w>w<C-f><C-w>W
    noremap <S-A-b> <C-w>w<C-b><C-w>W
    noremap <S-A-j> <C-w>w<C-e><C-w>W
    noremap <S-A-k> <C-w>w<C-y><C-w>W
  "同じインデントレベルを移動
    nn z] :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
    nn z[ k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
"}}}

"<space>キーで始まるコマンド"{{{
  noremap [space] <nop>
  nmap <Space> [space]

  "同じインデントレベルを移動
  nn <C-k>. :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
  nn <C-k>, k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^

  "折り畳み操作系"{{{
  noremap <C-k>n zj
  noremap <C-k>p zk
  noremap <C-k>f zo]z
  noremap <C-k>b zo[z
  noremap <C-k>G ]z
  noremap <C-k>b ]z
  noremap <C-k>g [z
  noremap <silent><C-k>h :set fdl-=1<CR>
  noremap <silent><C-k>l :set fdl+=1<CR>
  noremap <C-k>o zA
  noremap <C-k>i zMzv
  noremap <silent><C-k><C-i> :set fdl=1<CR>
  noremap <silent><C-k><C-k><C-i> :set fdl=2<CR>
  noremap <silent><C-k><C-k><C-k><C-i> :set fdl=3<CR>
  noremap <C-k>m zM
  "noremap <expr><silent><C-k>m
        "\ &fdl == 0 ? ':set fdl=1<CR>' : 'zM'
  noremap <C-k>r zR
  noremap <C-k>0 :set fdl=0<CR>
  noremap <C-k>1 :set fdl=1<CR>
  noremap <C-k>2 :set fdl=2<CR>
  noremap <C-k>3 :set fdl=3<CR>
  noremap <C-k>4 :set fdl=4<CR>
  noremap <C-k>5 :set fdl=5<CR>
  noremap <C-k><Space>r zr
  noremap <C-k>f zf
  au BufEnter * call FoldmarkerAppend()
  function! FoldmarkerAppend()
    let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cmsend = matchstr(&cms,'\V%s\zs\.\+')
    let fmr = split(&fmr,',')
    exe 'noremap <C-k>[[ A '.cmsstart.fmr[0].cmsend.'<ESC>0'
    exe 'noremap <C-k>]] A '.cmsstart.fmr[1].cmsend.'<ESC>0'
    exe 'noremap <C-k>[] A'.cmsstart.'===== '.fmr[0].'1 '.fmr[1].'1'.cmsend.'<ESC>0'
    exe 'noremap <C-k>[1 A '.cmsstart.fmr[0].'1'.cmsend.'<ESC>0'
    exe 'noremap <C-k>[2 A '.cmsstart.fmr[0].'2'.cmsend.'<ESC>0'
    exe 'noremap <C-k>[01 A '.fmr[0].'1'.cmsend.'<ESC>0'
    exe 'noremap <C-k>[02 A '.fmr[0].'2'.cmsend.'<ESC>0'
    exe 'noremap <C-k>]1 A '.cmsstart.fmr[1].'1'.cmsend.'<ESC>0'
    exe 'noremap <C-k>]2 A '.cmsstart.fmr[1].'2'.cmsend.'<ESC>0'
    exe 'noremap <C-k>]01 A '.fmr[1].'1'.cmsend.'<ESC>0'
    exe 'noremap <C-k>]02 A '.fmr[1].'2'.cmsend.'<ESC>0'
    exe 'noremap <C-k>^ A '.cmsstart.fmr[0].'1'.cmsend.'<ESC>0'
  endfunction
  noremap <C-k>[r $r
  noremap <C-k>tr :unlet g:test01 |unlet g:test02 |unlet g:test03 |unlet g:test04<CR>
  noremap <C-k>tt :call <SID>display_test_vars()<CR>
  noremap <C-k>tk :call PeekEcho()<CR>
  function! s:display_test_vars()
    let display = ''
    if exists('g:test01')
      let display .= 'g:test01='. string(g:test01)."\n"
    endif
    if exists('g:test02')
      let display .= 'g:test02='. string(g:test02)."\n"
    endif
    if exists('g:test03')
      let display .= 'g:test03='. string(g:test03)."\n"
    endif
    if exists('g:test04')
      let display .= 'g:test04='. string(g:test04)
    endif
    echo display
  endfunction

  "noremap <C-k>g :echo FoldCCnavi()<CR>
"}}}
"}}}


"ノーマルモードでのTipsを追加する"{{{
  "表示系"{{{
    "<C-g>で、表示される情報を自分好みにする
      noremap <C-g> :echo bufname("%")'['&fenc']['&ff']'(strftime("%Y-%m-%d %X",getftime(bufname("%")))) "["b:charCounterCount"字]" "0x"FencB()"\n"FoldCCnavi()<CR>
    ":regの短縮コマンド
      noremap <LocalLeader>:r :reg<CR>
    "Esc連打でハイライト消す
      "nmap <silent> <Esc><Esc> :nohlsearch<cr><Esc>
      nmap <silent> z/ :nohlsearch<CR>:sign unplace 333<CR>
      nmap <silent> g/ :exe 'sign jump 333 buffer='.bufnr('%')<CR>
      nmap <silent> @ :call <SID>multikey_effect()<CR>
      function! s:multikey_effect()
        if &nu == 1
          setl rnu
          setl nows
        elseif &rnu ==1
          setl number
          setl wrapscan
        endif

        let cmsstart = substitute(matchstr(&cms,'\V\s\*\zs\.\+\ze%s'), '^\s\+', '', 'g')
        let cmsend = matchstr(&cms,'\V%s\zs\.\+')
        exe 'setl cms=\ '.escape(cmsstart, '"').'%s'.escape(cmsend, '"')
      endfunction
    "foldの開閉を簡単にする （ns9tksさんからパクった）
      nnoremap <expr> <C-h>
            \ col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'zc'
      nnoremap <expr><silent> l
            \ foldclosed(line('.')) != -1 ? 'zo' : 'l'
  "}}}
  "編集用コマンド"{{{
    "直前のコマンドを再度実行する
      nnoremap c. q:k<Cr>
    "Yで行末までコピーする
      map Y y$
    "タグ検索をUniteで置き換える
      nnoremap <buffer> <C-]>
            \ :<C-u>UniteWithCursorWord -immediately tag<CR>
    "'+'や<F4>でクリップボードアクセス
      noremap <F4> "+
      map cy "*y
      map zy "*y
      map cp "*p
      map zp "*p
    "現在のファイルを上書き保存する
"      nnoremap <C-q><C-s> :<c-u>w<CR>
"      nnoremap <C-q>s :<c-u>w<CR>
      nnoremap <C-s> :<c-u>w<cr>
      nnoremap ,w :<c-u>w<cr>
      "nnoremap <SID>[space]w :<c-u>w<cr>
      nnoremap <M-w> :<c-u>w<cr>
    "vimを終了する
      nnoremap <C-q> :<c-u>qa<CR>
      nnoremap ,q :<c-u>qa<CR>
    "現在バッファをwriteしてからVimを終了する
"      nnoremap <C-q><C-w> :if !empty(bufname('%'))|w|endif|qa<CR>
"      nnoremap <C-q>w :if !empty(bufname('%'))|w|endif|qa<CR>
      nnoremap ZZ :if !empty(bufname('%'))|w|endif|qa<CR>
    "前回保存した状態にまでアンドゥ
      noremap <M-u> :earlier 1f<CR>
    "最後に編集したところを選択する
      nnoremap gv. `[v`]
      nnoremap gvv gv
    "ペーストしたテキストを再選択するBible3-15
      nnoremap <expr> gp '`[' . strpart(getregtype(), 0,1) . '`]'
    "自動的にnumberからrnuに→zf時にコメントを空白付きで
      nnoremap <silent>zf A <Esc>^:setl rnu<CR>zf
      "nnoremap <silent>zf :call <SID>ZipfoldingSetting()<CR>zf
      function! s:ZipfoldingSetting() "{{{
        setl rnu
        let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
        let cmsend = matchstr(&cms,'\V%s\zs\.\+')
        exe 'setl cms=\ '.escape(cmsstart, '"').'%s'.escape(cmsend, '"')
      endfunction "}}}
      "nnoremap y :set rnu<CR>y
      "nnoremap d :set rnu<CR>d
      "nnoremap c :set rnu<CR>c
  "}}}
  "独自キーで動くコマンド"{{{
    "so %する
      noremap <LocalLeader>S :so %<CR>
    ".vimrcをすぐに開くコマンド
      noremap <LocalLeader>. :e $MYVIMRC<CR>
      "noremap <LocalLeader>fv :e $MYVIMRC<CR>
    "junkFile
      "noremap <LocalLeader>fj :JunkFile<CR>
    "vimscripttips
      "noremap <LocalLeader>ft :e ~/vimscripttips.vim<CR>

    "文字コードを変更する
      noremap <LocalLeader>8   :se fenc=utf-8<CR>
      noremap <LocalLeader>9   :se fenc=cp932<CR>
      noremap <LocalLeader>0   :se fenc=euc-jp<CR>
    "タブ幅の変更
      noremap <LocalLeader>2   :set sw=2 sts=2<CR>
      noremap <LocalLeader>4   :set sw=4 sts=4<CR>
    "ファイルタイプを追加する
      "自動でバックアップするタイプになる
        noremap <LocalLeader>t  :set filetype+=.autowrite<CR>
        noremap <LocalLeader>T  :set filetype-=.autowrite|
              \ if exists('#autowrite')| augroup! autowrite| endif<CR>
"}}}

"}}}

"==========================================

"インサートモードで移動コマンド"{{{
  inoremap <C-g>h <Left>
  inoremap <C-z> <Left>
  inoremap <M-h> <Left>
  inoremap <M-l> <Right>
  inoremap <C-b> <Home>
  "inoremap <C-e> <End>
inoremap <c-e><c-h> <left>
inoremap <c-e><c-l> <right>
inoremap <c-e><c-k> <up>
inoremap <c-e><c-j> <down>
inoremap <c-e>O <esc>O
inoremap <c-e>o <esc>o
inoremap <c-e><c-e> <esc>A
inoremap <c-e><c-a> <esc>I
  inoremap <C-g>l <Right>
  inoremap <C-g><C-e> <Esc><C-e>a
  inoremap <C-g><C-y> <Esc><C-y>a
  inoremap <C-g><C-f> <Esc><C-f>a
  inoremap <C-g><C-b> <Esc><C-b>a
  inoremap <silent><C-k> <Esc>:call <SID>bracketTour()<CR>i
"}}}
"インサートモードでの編集"{{{
  "インサートモードで<C-d>デリート機能
    inoremap <C-d> <Del>
  "C-Tabでタブ挿入（Tab単独押しで補完を実行するときの代替キー）
    inoremap <C-Tab> <Tab>
  "インデントレベルを上げる（タブを消す）
    inoremap <M-d>  <C-d>
  "2倍タブ操作
    inoremap <C-M-t> <C-t><C-t>
    inoremap <C-M-d> <C-d><C-d>
  "インサートモードでキル＆ペースト
    inoremap <c-g><C-k> <ESC>d$i
    inoremap <F4> <C-r>+
  "i_<C-w>でも窓を渡る（本来は単語削除）
    inoremap <C-w> <Esc><C-w>
  "直前の入力をxpする（入れ替える）・括弧を探し出して入れる
    inoremap <C-@> <Esc>hxpa
    function! s:insert_brackets()
      call search('()\|[]\|',,,,)
    endfunction
"}}}


"==========================================

  "コマンドモードでの移動コマンド"{{{
    "cnoremap <M-h> <Left>
    "cnoremap <M-l> <Right>
    "cnoremap <M-f> <S-Right>
    "cnoremap <M-b> <S-Left>
"}}}
"コマンドモードでのmaps
"  cnoremap ; :
"  cnoremap : ;
"コマンドモードでのTips"{{{
  "編集中のファイルの場所をカレントディレクトリに設定する
    cnoremap <C-x> %:h
  "コマンドモードでクリップボード内容をペースト
    cnoremap <F4> <C-r>+


  "コマンドラインウィンドウを通常で使う(Hack #161)
    nnoremap <sid>(command-line-enter) q:
    xnoremap <sid>(command-line-enter) q:
    nnoremap <sid>(command-line-norange) q:<C-u>

    nmap c;  <sid>(command-line-enter)
    xmap c;  <sid>(command-line-enter)
    nmap c:  <sid>(command-line-enter)
    xmap c:  <sid>(command-line-enter)

    "コマンドラインウィンドウのキーマップを使いやすいように変更"{{{
    autocmd CmdwinEnter * call s:init_cmdwin()
    function! s:init_cmdwin()
      nnoremap <buffer> q :<C-u>quit<CR>
      nnoremap <buffer> <TAB> :<C-u>quit<CR>
      inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
      inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
      inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

      " Completion.
      inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

      startinsert!
    endfunction"}}}

"}}}


"==========================================
"ビジュアルモードでのmaps"{{{
  "インデントしても選択解除しない
    "vnoremap > >gv
    "vnoremap < <gv
  "ビジュアルモード時vで行末まで選択
    vnoremap v $h
"}}}
"ビジュアルモードでのTips"{{{
  "0,0,0などの並んだ数字を選択して連番にするコマンドhttp://d.hatena.ne.jp/fuenor/20090907/1252315621
    vnoremap <silent> <F4><C-a> :ContinuousNumber <C-a><CR>
    vnoremap <silent> <F4><C-x> :ContinuousNumber <C-x><CR>
    command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}"}}}
let maplocalleader = "_"

" コマンド"{{{
" ========
" ヘルプを別のタブで開く
  command! -nargs=* -complete=help H  tab help <args>
"ctagsで現在ファイルのタグファイル生成
  com! -nargs=0 Ctags !ctags %
".vimrcをリロードする
  command! ReloadVimrc  source $MYVIMRC
"lingr.vimを別タブページで開く
  command! Lt call <SID>lingrlaunch_in_newtab()
"パターンとファイル名を逆にしたgrep
  command! -complete=file -nargs=+ Perg  call s:perg([<f-args>])
  function! s:perg(args)
    execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
  endfunction
"現在ファイルのあるディレクトリでvimgrep
  command! -nargs=+   CurrentGrep  call s:CurrentGrep([<f-args>])
  function! s:CurrentGrep(args)
    execute 'vimgrep' '/'.a:args[0].'/ '.expand(a:args[1]).'/**/*'
    cwindow
  endfunction
"}}}

" 関数
"=====
"FencB() : <C-g>で使用;カーソル上の文字コードのエンコードに応じた表現を返す"{{{
  function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return s:Byte2hex(s:Str2byte(c))
  endfunction

  function! s:Str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
  endfunction

  function! s:Byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
  endfunction
"}}}

" Open junk file.(Hack#181)"{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction
"}}}

"lingr.vimを別タブページで起動する関数。"{{{
  function! s:lingrlaunch_in_newtab()
    tabnew
    LingrLaunch
    exe 3 . "wincmd w"
  endfunction
"}}}

"s:bracketTour インサートモード用。以前の括弧に飛ぶ"{{{
function! s:bracketTour()
  let col =col('.')
  call search('()\|''''\|""\|[]\|{}\|<>','bW',line('.'))
  if col('.') == col
    normal! ^
    return
  endif
  normal! l
endfunction"}}}

" Call a script local function."{{{
" Usage:
" - S('local_func')
"   -> call s:local_func() in current file.
" - S('plugin/hoge.vim:local_func', 'string', 10)
"   -> call s:local_func('string', 10) in *plugin/hoge.vim.
" - S('plugin/hoge:local_func("string", 10)')
"   -> call s:local_func("string", 10) in *plugin/hoge(.vim)?.
function! S(f, ...)
  let [file, func] =a:f =~# ':' ?  split(a:f, ':') : [expand('%:p'), a:f]
  let fname = matchstr(func, '^\w*')

  " Get sourced scripts.
  redir =>slist
  scriptnames
  redir END

  let filepat = '\V' . substitute(file, '\\', '/', 'g') . '\v%(\.vim)?$'
  for s in split(slist, "\n")
    let p = matchlist(s, '^\s*\(\d\+\):\s*\(.*\)$')
    if empty(p)
      continue
    endif
    let [nr, sfile] = p[1 : 2]
    let sfile = fnamemodify(sfile, ':p:gs?\\?/?')
    if sfile =~# filepat &&
    \    exists(printf("*\<SNR>%d_%s", nr, fname))
      let cfunc = printf("\<SNR>%d_%s", nr, func)
      break
    endif
  endfor

  if !exists('nr')
    echoerr Not sourced: ' . file
    return
  elseif !exists('cfunc')
    let file = fnamemodify(file, ':p')
    echoerr printf(
    \    'File found, but function is not defined: %s: %s()', file, fname)
    return
  endif

  return 0 <= match(func, '^\w*\s*(.*)\s*$')
  \      ? eval(cfunc) : call(cfunc, a:000)
endfunction"}}}

"指定したスクリプトファイルのスクリプトローカル変数を取得する - くふくふん"{{{
command! SV echo ScriptVars(PathToSNR(expand('%:p')))



function! ScriptVarSource()
  return "function! s:__get_script_variables()\n
        \   return s:\n
        \ endfunction"
endfunction

function! ScriptVars(snr)
  return eval('<SNR>{a:snr}___get_script_variables()')
endfunction

function! ScriptVar(snr, var_name)
  let d = ScriptVars(a:snr)
  if !has_key(d, a:var_name)
    throw 'ScriptVar: not found script variable "' . a:var_name . '".'
  endif
  return get(d, a:var_name)
endfunction

function! PathToSNR(path)
  redir => _
  silent scriptnames
  redir END
  redraw!

  let names = split(_, "\n")
  call filter(names, "matchstr(v:val, '^\\s*\\d*: \\zs.*') ==# a:path")

  if empty(names)
    throw 'PathToSNR: not convert the path "' . a:path . '".'
  endif
  return str2nr(matchstr(names[0], '^\s*\d*'))
endfunction "}}}



let maplocalleader = ","
" 各種プラグイン設定"{{{
"===================
" 単純に、グローバル変数だけを設定したもの"{{{
  "チェンジログでエントリ作成時に表示されるユーザ名
    let g:changelog_username ="siic <>"
  "vimball.vimでインストールするプラグインのインストール先を変更する
    "let g:vimball_home = "$CFGHOME/bundle/vba"
  "vimwiki.vimで使うwikiのリスト
    let g:vimwiki_list = [{'path':'~/dc/stgmemwk/','index':'stgmemwk' },{'path':'~/dc/siicwk/','index':'siicwk' },{'path':'~/dc/yukokwk/','index':'yukokwk' },{'path':'~/dc/kywrd/','index':'kywrd' },]

  "buftabs.vim（ステータスラインにバッファリストを表示）
    let g:buftabs_only_basename=1  "バッファタブにパスを省略してファイル名のみ表示する
    "let g:buftabs_in_statusline=1  "バッファタブをステータスライン内に表示する
    ""let g:buftabs_active_highlight_group="Visual"  "カレントバッファを分かり易くする
    ""let g:buftabs_marker_start = "["
    ""let g:buftabs_marker_end = "]"       
    " "" ステータスラインに従来のvimで表示されていた内容も表示（未完成）
      ""set statusline=%{g:buftabs_in_statusline}%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P
      ""set statusline=%{g:buftabs_in_statusline}%=\ %M%R%H%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}y%lx%c\ %P
      "set statusline=%{g:buftabs_in_statusline}%=\ \ \ \ %M%R%H%w%y[%{&fenc}][%{&ff}]%l,%c%3p%%

  "echodoc.vim
    let g:echodoc_enable_at_startup = 1
  "indent-guides #bible4-14
    "let g:indent_guides_enable_on_vim_startup = 1
    "let g:indent_guides_color_change_percent = 30
    "let g:indent_guides_guide_size = 1
  "tcomment.vim
    let g:tcommentMapLeader2 ='z/'
  "FoldCCnavi
    let g:foldCCnavi_shorten = 30
"}}}



" 単純に、マッピングだけを設定したもの"{{{
  "smartword.vimのコマンドに置き換える
    "map w  <Plug>(smartword-w)
    "map b  <Plug>(smartword-b)
    "map e  <Plug>(smartword-e)
    "map ge  <Plug>(smartword-ge)
  "camelcasemotion.vimのコマンドに置き換える
    "前方・後方移動をキャメルケース単位にする
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    "omap <silent> e <Plug>CamelCaseMotion_ie
    "テキストオブジェクトに対応させる
    "omap <silent> iw <Plug>CamelCaseMotion_iw
    "vmap <silent> iw <Plug>CamelCaseMotion_iw
    omap <silent> ib <Plug>CamelCaseMotion_ib
    vmap <silent> ib <Plug>CamelCaseMotion_ib
    omap <silent> ie <Plug>CamelCaseMotion_ie
    vmap <silent> ie <Plug>CamelCaseMotion_ie
  "h1mesuke/textobj-wiw
    let g:textobj_wiw_no_default_key_mappings = 1 "デフォルトで用意されてるマッピングを無効に
    "map @w <Plug>(textobj-wiw-n)
    "map @b <Plug>(textobj-wiw-p)
    "map @e <Plug>(textobj-wiw-N)
    "map @ge <Plug>(textobj-wiw-P)
    vmap a@ <Plug>(textobj-wiw-a)
    vmap i@ <Plug>(textobj-wiw-i)
    omap a@ <Plug>(textobj-wiw-a)
    omap i@ <Plug>(textobj-wiw-i)
  "openbrowser.vim（カーソル下のURL,URIをブラウザで開く、または単語をブラウザで検索する）
    nmap <LocalLeader>xo <Plug>(openbrowser-smart-search)
    vmap <LocalLeader>xo <Plug>(openbrowser-smart-search)
  "ambicmd.vim(コマンドモードで一定のルールでコマンド補完
    cnoremap <expr> <C-l> ambicmd#expand("\<Right>")
  "textmanip.vim（直感的なテキストの移動・複製）
    " 選択したテキストの移動
      vmap <C-j> <Plug>(textmanip-move-down)
      vmap <C-k> <Plug>(textmanip-move-up)
      vmap <C-h> <Plug>(textmanip-move-left)
      vmap <C-l> <Plug>(textmanip-move-right)
    " 行の複製
      "vmap <M-w> <Plug>(textmanip-duplicate-down)
      "nmap <M-w> <Plug>(textmanip-duplicate-down)
      "vmap <M-W> <Plug>(textmanip-duplicate-up)
      "nmap <M-W> <Plug>(textmanip-duplicate-up)
  "quickrun.vim
    nmap <LocalLeader>xq <Plug>(quickrun)
    let g:quickrun_config = {}
    let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/kramdown',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }
    let g:quickrun_config['sysdraft.vim'] = {'type': 'vim'}
  "lingr-vim
    au FileType lingr-messages nnoremap <buffer> \ :LingrExit<CR>
    noremap <LocalLeader>xl :call <SID>lingrlaunch_in_newtab()<CR>
  "easymotion
    let g:EasyMotion_leader_key='<Leader><Leader>'
    let g:EasyMotion_mapping_w = '<M-f>'
    let g:EasyMotion_mapping_W = '<M-S-f>'
    let g:EasyMotion_mapping_b = '<M-b>'
    let g:EasyMotion_mapping_B = '<M-S-b>'
    let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz123456789;@'
  "marks_corey.vim
    let g:Signs_file_path_corey = fnamemodify('~/', ':p')
    map <silent>  mm <Plug>Place_sign
    map <silent>  mh <Plug>Goto_next_sign
    map <silent>  ml <Plug>Goto_prev_sign
    "マークを全削除
      map  mu <Plug>Remove_all_signs
    "map <silent>  mm <Plug>Move_sign
    noremap <F6> :call SaveP()<cr>
    noremap <F5> :call ReloadP()<cr>
    noremap mw :call SaveP()<cr>
    noremap mr :call ReloadP()<cr>
  "visualmark.vim
    "map <silent> mi <Plug>Vm_toggle_sign 
    "map mj <Plug>Vm_goto_next_sign
    "map mk <Plug>Vm_goto_prev_sign
  "visualstar.vim
    sign define SearchStart text=索 texthl=Search
    map <silent>* <Plug>(visualstar-*)N:<C-u>call <SID>SetSearchStartSign(0)<CR>
    "map # <Plug>(visualstar-#)N:<C-u>sign unplace 333<CR>
    noremap <silent>n :<C-u>call <SID>SetSearchStartSign(1)<CR>nzv
    noremap <silent># :<C-u>call <SID>JumptoSearchStart()<CR>
    function! s:JumptoSearchStart()
      let bufnr = bufnr('%')
      exe 'sign jump 333 buffer='.bufnr
    endfunction

    function! s:SetSearchStartSign(nN)
      let line = line('.')
      let bufnr = bufnr('%')
      if a:nN "nNキーでの検索
        silent let g:chksign = s:chksign(bufnr)
        if g:chksign =~ '=333'
          return
        endif
      endif

      sign unplace 333
      exe 'sign place 333 line='.line.' name=SearchStart buffer='.bufnr
    endfun

    function! s:chksign(bufnr)
      redir => chksign
      exe 'sign place buffer='.a:bufnr
      redir END
      return chksign
    endfun
    "noremap * :<C-u>call Place_sign()<CR>*N
  "NERDcommenter
    "let g:NERDCreateDefaultMappings = 0
    "let g:NERDRemoveExtraSpaces = 1
    "let g:NERDSpacesDelims = 0
    nmap gcc <Plug>NERDCommenterToggle
    vmap gcc <Plug>NERDCommenterToggle
    nmap gca <Plug>NERDCommenterAppend
    nmap gc9 <Plug>NERDCommenterToEOL
    vmap gcs <Plug>NERDCommenterSexy
    vmap gcb <Plug>NERDCommenterMinimal

  "全然関係ないけど独自コメントアウトバインド。リファクタリング時に移し替える
  nmap <silent> gcd :call <SID>CommToggleDelMarker()<CR>
  function! s:CommToggleDelMarker() "{{{
    let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cmsend = matchstr(&cms,'\V%s\zs\.\+')
    let crrstr = getline('.')
    if matchstr(crrstr, '\[削]') == '[削]'
      call setline('.',substitute(crrstr, cmsstart.'\[削]', '', 'g'))
    else
      exe 'normal! I'.cmsstart.'[削]'
    endif
  endfunction "}}}
  nmap <silent> gco :call <SID>CommAddStar(0)<CR>
  nmap <silent> gcO :call <SID>CommAddStar(1)<CR>
  function! s:CommAddStar(append) "{{{
    let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cmsend = matchstr(&cms,'\V%s\zs\.\+')
    if a:append
      exe 'normal! O'.cmsstart.'★'
    else
      exe 'normal! o'.cmsstart.'★'
    endif
  endfunction "}}}



"}}}

"vim-vcs.vim
  "設定用辞書変数
"    let g:vcs#config = {'alias':{'st':'status'},}

"yankring.vim"{{{
"    "グローバル変数
"        let g:yankring_max_history = 50
"        let g:yankring_history_dir = '$VIM'
"        let g:yankring_clipboard_monitor = 1
"    "マッピング
"        noremap <Leader>y :YRShow<CR>
"}}}

"utl.vim（リンクやファイルを開いたり別プログラムに渡す）"{{{
  "Enterでリンク先を開く
    "nnoremap <silent> <cr> :silent exe 'Utl'<cr>
  "URL を Firefox で開く(URLが含まれる行で \gu ）
    "let g:utl_rc_app_browser = 'silent !start C:\Program Files\Mozilla Firefox\firefox.exe %u'
  "ディレクトリをあふで開く（ :Gu . でカレントディレクトリを開ける）
    "let g:utl_mt_text_directory = ':!start C:\Program Files\afx\AFXCMD.EXE -L"%P\"'
"}}}

"sow.vim
  "map ,s <Plug>(sow_start)
  let g:sow_dc = '~/.sow_dc/.old'

"neobundle.vim"{{{
  filetype off

  if has('vim_starting')
  set runtimepath+=$VIM/vimfiles/neobundle/neobundle.vim

  call neobundle#rc(expand('$VIM/vimfiles/neobundle'))
  endif

  NeoBundle 'tsukkee/lingr-vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'tyru/current-func-info.vim'
  NeoBundle 'kana/vim-submode'

  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'tpope/vim-pathogen'
  NeoBundle 'Shougo/neobundle.vim'
  "NeoBundle 'Shougo/echodoc'
  NeoBundle 'thinca/vim-ambicmd'
  NeoBundle 'anyakichi/vim-surround'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'kana/vim-textobj-indent'
  NeoBundle 'kana/vim-smartword'
  "NeoBundle 'kana/vim-smartchr'
  NeoBundle 'vim-jp/vital.vim'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'bkad/CamelCaseMotion'
  NeoBundle 'Lokaltog/vim-easymotion'
    "vimpみたいなヒント移動
  NeoBundle 'thinca/vim-fontzoom'
  NeoBundle 'pocket7878/presen-vim'
  "NeoBundle 'nathanaelkane/vim-indent-guides'
    "#Bible4-14 インデントレベルをハイライト表示

  NeoBundle 'thinca/vim-visualstar'
    "#Bible3-14
  NeoBundle 'mattn/gist-vim'
  NeoBundle 'tyru/vim-altercmd'
  NeoBundle 'h1mesuke/textobj-wiw'


  "NeoBundle 'https://github.com/kien/ctrlp.vim.git'
    "カレントファイルにアクセスする

  "NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'https://github.com/thinca/vim-openbuf.git'
    "unite-vim_hacksがこれに依存してるっぽい
  NeoBundle 'choplin/unite-vim_hacks'
    "openbuf入れないとuniteがエラーを吐いて他のプラグインも使用不能になる
  "NeoBundle 'git@github.com:vim-jp/vimdoc-ja.git'
  NeoBundle 'https://github.com/tyru/open-browser.vim.git'
  NeoBundle 'kana/vim-tabpagecd'

  "NeoBundle 'thinca/vim-tabrecent'
    "直前にいたタブへ戻るコマンド
  NeoBundle 'https://github.com/mrtazz/simplenote.vim.git'
    "オンラインノートsimplenoteを使う
  NeoBundle 'https://github.com/tacroe/unite-mark.git'
    "マーク一覧を表示
  NeoBundle 'https://github.com/tpope/vim-speeddating.git'
  NeoBundle 'https://github.com/ujihisa/mdv.git'
    "VimHacksで使われている拡張Markdown
  NeoBundle 'https://github.com/ujihisa/neco-look.git'
  NeoBundle 'https://github.com/mattn/wwwrenderer-vim.git'
  NeoBundle 'https://github.com/mattn/webapi-vim.git'
  NeoBundle 'https://github.com/t9md/vim-textmanip.git'
    "テキストを直感的に移動複製
  NeoBundle 'https://github.com/vim-scripts/DrawIt.git'
    "図を描写する #Bible5-4
  NeoBundle 'https://github.com/vim-scripts/Align.git'
    "高機能なテキストファイル整形ツール #Bible5-11

  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'tomtom/ttoc_vim'
  NeoBundle 'tomtom/tlib_vim'
  NeoBundle 'motemen/hatena-vim'
  "NeoBundle 'vim-scripts/vimwiki'

  "NeoBundle 'https://github.com/fuenor/qfixhowm.git'
  NeoBundle 'gregsexton/gitv'
  NeoBundle 'kana/vim-smartinput'
    "insertmodeで対応する括弧を補完する

  filetype plugin indent on  "ファイル判定をonにする
"}}}

"pathogen.vim"{{{
  filetype off "一度ファイル判定をoffにしないとftdetectをロードしてくれないので。
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on  "ファイル判定をonにする
"}}}

"smartchr
  "autocmd FileType vim, inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', '=')
  "cnoremap <expr> [  smartchr#one_of('[', '\[', {'ctype': '/?'})


"savevers.vimで世代別バックアップを取る"{{{
  "バックアップファイルの設定" savevers.vimのためにパッチモードにします
    set patchmode=.vbcu
  "カンマで区切られたバックアップを作成するファイル名です "*.c,*.h,*.vim"
    let savevers_types = "*"
  "バックアップファイルが書き込まれるディレクトリです ここでは、オプション"backupdir"と同じディレクトリにしています
    let savevers_dirs = &backupdir
  "バックアップファイルとの比較でウィンドウのサイズを変更する場合は0
    let versdiff_no_resize=1
  "ウィンドウのサイズを変更する場合にどれだけの幅までを許可するか
    "let versdiff_no_resize=80

    nmap <silent> <F7> :VersDiff -<cr>
    nmap <silent> <F8> :VersDiff +<cr>
    nmap <silent> <F9> :VersDiff -c<cr>
"}}}

"migemo.vim
  if has('migemo')
    set migemo
    set migemodict=/opt/local/share/migemo/utf-8/migemo-dict
  endif





"ref.vim"{{{
  "lynx.exe の絶対パス
    let s:lynx = "D:/bnr/txe/vim/lynx.exe"
  "lynx.cfg の絶対パス
    let s:cfg  = "D:/bnr/txe/vim/lynx.cfg"
  let g:ref_alc_cmd = s:lynx.' -cfg='.s:cfg.' -dump %s'
  "let g:ref_alc_cmd = ':wwwrenderer#render("%s")'
  let g:ref_phpmanual_path = 'D:/dict/php-chunked-xhtml/'
  let g:ref_alc_start_linenumber = 47 " 開いたときの初期カーソル位置
  let g:ref_alc_encoding = 'Shift-JIS' " 文字化けするならここで文字コードを指定してみる

  nmap <LocalLeader>xra :<C-u>Ref alc<Space>
  au FileType ref-* nnoremap <silent><buffer>   q   :close<CR>
  nnoremap <silent> <LocalLeader>xrK :<C-u>call ref#jump('normal', 'alc')<CR>
  vnoremap <silent> <LocalLeader>xrK :<C-u>call ref#jump('visual', 'alc')<CR>
"}}}

"unite.vim"{{{
  "入力モードで開始する
    "let g:unite_enable_start_insert=1
  "unite-history/yankを有効化する（ヤンクしたテキストの履歴）
    let g:unite_source_history_yank_enable =1
  "grepコマンド
    let g:unite_source_grep_command = 'jvgrep'
  "窓の表示位置
    let g:unite_split_rule = 'botright'
  "候補の色設定
    "let g:unite_cursor_line_highlight = 'Search'
    "let g:unite_abbr_highlight = 'Normal'
  nnoremap <silent> <LocalLeader>aa :<C-u>UniteBookmarkAdd<CR>
  "バッファ一覧・ファイル一覧・レジスタ一覧・mru（最近利用したファイル）一覧・全て一覧
    nnoremap <silent> <LocalLeader>ga :<C-u>Unite bookmark<CR>
    "nnoremap <silent> <Leader>b :<C-u>Unite buffer -auto-preview<CR>
    nnoremap <silent> <LocalLeader>gg :<C-u>Unite buffer file_mru -start-insert<CR>
    nnoremap <silent> <LocalLeader>gb :<C-u>Unite buffer_tab<CR>
    "nnoremap <silent> <LocalLeader>gb :<C-u>Unite buffer -start-insert<CR>
    nnoremap <silent> <LocalLeader>gf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> <LocalLeader>gr :<C-u>Unite -buffer-name=register register<CR>
    nnoremap <silent> <LocalLeader>gm :<C-u>Unite file_mru<CR>
    nnoremap <silent> <LocalLeader>ga :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
  "Uniteのソースその他
    "Unite mark
      nnoremap <silent> <LocalLeader>g' :<C-u>Unite mark<CR>
      let g:unite_source_mark_marks = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012'
    "unite-buffer_deleted
      nnoremap <silent> <LocalLeader>gu :<C-u>Unite buffer_deleted<CR>
    "unite-history/yank（ヤンク履歴を取る）
      nnoremap <silent> <LocalLeader>gy :<C-u>Unite history/yank<CR>
      nnoremap <silent> <M-y> :<C-u>Unite history/yank<CR>
    "unite-outline
      nnoremap <silent> <LocalLeader>go :<C-u>Unite outline<CR>
    "unite-font
      nnoremap <silent> <LocalLeader>g,f :<C-u>Unite font<CR>
    "unite-outline_indent
      nnoremap <silent> <LocalLeader>gi :<C-u>Unite outline_indent<CR>
      nnoremap <silent> <LocalLeader>gI :<C-u>Unite outline_indent:a<CR>
  "ウィンドウを分割して開く
    au FileType unite nnoremap <silent><buffer><expr>   <C-k>   unite#do_action('split')
    au FileType unite inoremap <silent><buffer><expr>   <C-k>   unite#do_action('split')
  "ウィンドウを縦に分割して開く
    au FileType unite nnoremap <silent><buffer><expr>   <C-l>   unite#do_action('vsplit')
    au FileType unite inoremap <silent><buffer><expr>   <C-l>   unite#do_action('vsplit')
  "ESCキーを2回押すと終了する
    "au FileType unite nnoremap <silent><buffer> <ESC><ESC> <C-w>z:bd<CR>
    au FileType unite imap <silent><buffer> <C-q> <Plug>(unite_exit)
  "確定を<c-j>でも
    "au FileType unite noremap <silent> <buffer> <expr> <C-j> unite#do_action('open')
    au FileType unite nmap <silent><buffer> <C-j> <Plug>(unite_do_default_action)
    au FileType unite imap <silent><buffer> <C-j> <Plug>(unite_do_default_action)
    au FileType unite nmap <silent><buffer> <C-k> <Plug>(unite_quick_match_default_action)
    au FileType unite nnoremap <buffer><expr> <C-s>      unite#mappings#set_current_filters(
      \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
"}}}



"neocomplcache.vim"{{{
  "グローバル変数
    let g:neocomplcache_enable_at_startup = 1 "ネオコン有効化
     let g:neocomplcache_enable_prefetch=1 "以前のバージョンの挙動にする。
    "let g:neocomplcache_disable_auto_complete = 1 "自動補完を無効にする
    let g:neocomplcache_enable_smart_case = 1 "スマートケィス（大文字が含まれている場合は区別する）
    let g:neocomplcache_enable_underbar_completion = 1 "アンダーバー_を区切りとした曖昧検索
    let g:neocomplcache_enable_camel_case_completion = 1 "大文字を区切りとした曖昧検索
    "let g:neocomplcache_enable_auto_select = 1 "ポップアップを出すとき自動的に一番上の候補を選択状態
    let g:neocomplcache_auto_completion_start_length = 1 "ポップアップを出し始める文字数（初期値2）
    let g:neocomplcache_min_syntax_length = 3 "シンタックス最小キャッシュ文字数
    let g:neocomplcache_snippets_dir = $VIM.'/settings/neocon_snippets' "スニペットプラグインディレクトリ
    let g:neocomplcache_temporary_dir = $VIM.'/settings/.neocon' "ネオコンの一時情報を書き出すディレクトリ
    "let g:neocomplcache_enable_quick_match = 1 "-を押すと補完の横に省入力英数字を表示
    let g:neocomplcache_min_keyword_length = 2 "補完を行うキーワードの最小長さ（初期値4）
    "ネオコンが未対応のファイルタイプでのキーワード収集パターン（ファイルタイプ別に指定）
      if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
      endif
      let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "単語のヘッド\単語を構成する文字（数字やアルファベット）*
      "let g:neocomplcache_keyword_patterns['sfd'] = '\c\[:\%(\h\w*:\]\)\?\| &\h[[:alnum:]_:]*\| \$\h\w*\|-\h\w*=\?\| <SID>\%(\h\w*(\?\)\?\| <Plug>([^)]*)\?\| <\h[[:alnum:]_-]*>\?\| \h[[:alnum:]_:#]*\%(!\| ()\?\)\?\| `\h\w*'
  " ファイルタイプに辞書ファイルパスを関連づけるディクショナリ（sfdのタグファイル保管に役立つかも）
      let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vim' : $VIM.'/settings/neocon_dict/vim.dict',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

  "マッピング
    "Vim標準の補完をネオコンに置き換える
      "ファイル名補完
        inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
      "オムニ補完
        inoremap <expr><C-x><C-o>  neocomplcache#manual_omni_complete()
      "キーワード補完
        inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()

      "ネオコン基本操作
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? “\<Plug>(neocomplcache_snippets_expand)” : pumvisible() ? “\<C-n>” : “\<TAB>”
        "カーソル前の文字列がスニペットのトリガであるなら、スニペットを展開する
          imap <expr><C-s>   neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
        "候補の共通箇所まで補完する
          inoremap <expr><C-l>     neocomplcache#complete_common_string()
        "決定してポップアップを閉じる
          inoremap <expr><C-y>  neocomplcache#close_popup()
        "キャンセルしてポップアップを閉じる
          "inoremap <expr><C-e>  neocomplcache#cancel_popup()
        "ネオコンによって挿入した補完を元に戻す
          inoremap <expr><C-x><C-g>     neocomplcache#undo_completion()
          inoremap <expr><C-x>g     neocomplcache#undo_completion()
      "ポップアップが出ているときの挙動を快適にする
        "バックスペースしたときポップアップを閉じる
          "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
      "ネオコン設定変更操作
        "スニペットを編集する
          noremap ,Ns :<C-u>vertical belowright NeoComplCacheEditSnippets<CR>
"}}}

"vimshell.vim"{{{
  nmap <LocalLeader>xS <Plug>(vimshell_split_switch)
  nmap <LocalLeader>xs :setglobal fileencoding=utf-8|  VimShellTab<CR>
  nmap <LocalLeader>x,s <Plug>(vimshell_switch)
  "<Esc>連打で押すと隠れる
    au FileType vimshell nmap <silent> <buffer> <ESC><ESC> <Plug>(vimshell_hide)
    au FileType vimshell nmap <silent> <buffer> <C-j> <Plug>(vimshell_enter)
    au FileType vimshell imap <silent> <buffer> <C-j> <Plug>(vimshell_enter)
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")' "ユーザプロンプトにカレントディレクトリを表示
  let g:vimshell_split_height = 50

	let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
	"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
	let g:vimshell_enable_smart_case = 1
	
	if has('win32') || has('win64')
	  " Display user name on Windows.
	  let g:vimshell_prompt = $USERNAME."% "
	else
	  " Display user name on Linux.

	  let g:vimshell_prompt = $USER."% "
	
	  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
	  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
	  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
	  call vimshell#set_execute_file('tgz,gz', 'gzcat')
	    call vimshell#set_execute_file('tbz,bz2', 'bzcat')
	endif
	
	" Initialize execute file list.
	let g:vimshell_execute_file_list = {}
	call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
	let g:vimshell_execute_file_list['rb'] = 'ruby'
	let g:vimshell_execute_file_list['pl'] = 'perl'
	let g:vimshell_execute_file_list['py'] = 'python'
	call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
	
	autocmd FileType vimshell
	\ call vimshell#altercmd#define('g', 'git')
	\| call vimshell#altercmd#define('i', 'iexe')
	\| call vimshell#altercmd#define('l', 'll')
	\| call vimshell#altercmd#define('ll', 'ls -l')
	\| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')
	
	function! g:my_chpwd(args, context)
	  call vimshell#execute('ls')
	endfunction
	
	autocmd FileType int-* call s:interactive_settings()
	function! s:interactive_settings()
	endfunction
"}}}

"netrw
  " netrwは常にtree view
  let g:netrw_liststyle = 3

"vimfilter
  let g:vimfiler_as_default_explorer = 1




"  "--------------QFixHowm----------------"{{{
let QFixHowm_Key           = '_'
" キーマップ(2ストローク目)
let QFixHowm_KeyB          = ''

" メモファイルの保存場所
let howm_dir               = '~/howm'
" メモファイルのファイル名
let howm_filename          = "%Y/%m/%Y-%m-%d-%H%M%S.txt"
" メモファイルのエンコーディング
let howm_fileencoding      = &enc
" メモファイルの改行コード
let howm_fileformat        = &ff
" ファイルタイプ指定
let QFixHowm_FileType      = 'howm_memo'


"ファイル/テンプレート"{{{
"「新規エントリのテンプレート」

" クイックメモファイル
let QFixHowm_QuickMemoFile = 'Quickmemo.txt'
" 日記メモファイル
let QFixHowm_DiaryFile     = '%Y/%m/%Y-%m-%d-000000.txt'
" ペアファイル保存場所
let QFixHowm_PairLinkDir   = 'pairlink'
" キーワード保存ファイル
let QFixHowm_keywordfile   = '~/.howm-keys'

" タイトル記号
let QFixHowm_Title = '='
" テンプレート
let QFixHowm_Template = [
  \ "%TITLE% %TAG%",
  \ "%DATE%",
  \ ""
\]
" テンプレート(カーソル移動)
let QFixHowm_Cmd_NewEntry = "$a"
" テンプレートに挿入されるタグ
let QFixHowm_DefaultTag   = ''
"}}}
"オートリンクでファイルを開く
let QFixHowm_Wiki = 1
" Wikiスタイルリンクは対応ファイルを開く場合の保存ディレクトリ
let QFixHowm_WikiDir = 'wiki'


"  " QFixHowmで、メモをとる
"  let howm_dir = '$VIM/siic/howm'
"  let howm_filename = '%Y-%m-%d-%H%M%S.howm'
"  let howm_fileencoding = 'cp932'
"  let howm_fileformat = 'dos'
"  
"  "Howmコマンドキーマップ
"  let QFixHowm_Key = ','
"  "Howmコマンドの2ストローク目キーマップ
"  let QFixHowm_KeyB = ''
"  
"  "クイックメモファイル名
"  "let QFixHowm_QuickMemoFile = 'Qmem-00-%Y-%m-00-000000.howm'
"  let QFixHowm_QuickMemoFile = 'Qmem001.howm'
"  
"  "オートリンク上のタグジャンプを使用する/しない
"  let QFixHowm_UseAutoLinkTags = 1
"  "tagsファイルを作成するディレクトリ
"  let QFixHowm_TagsDir = howm_dir
"  
"  
"  "QuickfixウィンドウをON/OFF
"  "この設定例ではgsが使用できなくなります。好みに応じて変更して下さい。
"  nnoremap <silent> ,q :ToggleQFixWin<CR>
"  
"  " カテゴリタグユーザアクションロック([ ]の上で<CR>でカテゴリ切り替え)
"  nnoremap <silent> g,ht :<C-u>call QFixHowmCreateNewFileWithTag('[ ]')<CR>
"  let QFixHowm_UserSwActionLock = ['[ ]', '[:private]', '[:work]', '[:vim]']
"  
"  
"  "---==タイトルを付けるのも面倒な場合==---
"  "タイトルに何も書かれていない場合、エントリ内から適当な文を探して設定する。
"  "文字数は半角換算で最大 QFixHowm_Replace_Title_len 文字まで使用する。0なら何もしない。
"  let QFixHowm_Replace_Title_Len = 64
"  
"  "対象になるのは QFixHowm_Replace_Title_Pattern の正規表現に一致するタイトルパターン。
"  "デフォルトでは次の正規表現が設定されている。
"  "let QFixHowm_Replace_Title_Pattern = '^'.escape(g:QFixHowm_Title, g:QFixHowm_EscapeTitle).'\s*\(\[[^\]]*\]\s*\)\=$'
"  
"  "新規エントリの際、本文から書き始める。
"  "let QFixHowm_Cmd_New = "i"." \<CR>\<C-r>=strftime(\"[%Y-%m-%d %H:%M]\")\<CR>\<CR>\<ESC>$a"
"  ",Cで挿入される新規エントリのコマンド
"  "let QFixHowm_Key_Cmd_C = "o<ESC>".QFixHowm_Cmd_New"}}}


""  "--------------VimOrganizer----------------"{{{
""  " stuff below here is necessary for VimOrganizer to work right
""  "
""  " use this colorscheme or integrate it into an existing colorscheme
""  ""colorscheme org_dark	""カラースキームの設定は、.gvimrcに宣言した
""  
""  " g:org_agenda_dirs specify directories that, along with 
""  " their subtrees, are searched for list of .org files when
""  " accessing EditAgendaFiles().  Specify your own here, otherwise
""  " default will be for g:org_agenda_dirs to hold single
""  " directory which is directory of the first .org file opened
""  " in current Vim instance:
""  " Below is line I use in my Windows install:
""  let g:org_agenda_dirs=["D:\siic\org_agenda","c:/users/herbert/desktop"]
""  
""  " vars below are used to define default todo list and
""  " default tag list.  will be changed in near future so
""  " that these are defined by config lines in each .org
""  " file itself, but now these are where you can change things:
""  let g:org_todo_setup='todo | done'
""  " while g:org_tag_setup is itself a string
""  let g:org_tag_setup='{@home(h) @work(w) @tennisclub(t)} \n {easy(e) hard(d)} \n {computer(c) phone(p)}'
""  
""  " leave these as is:
""   "" autocmd! 現在のグループ*.orgに対するすべてのautocommandを削除
""  au! bufread,bufwrite,bufwritepost,bufnewfile *.org 
""  au bufread,bufnewfile *.org            call org#SetOrgFileType()
""  au bufread,bufnewfile *.org            call OrgExpandWithoutText(b:v.global_cycle_levels_to_show)
""  au bufread *.org :PreLoadTags
""  au BufWrite *.org :PreWriteTags
""  au BufWritePost *.org :PostWriteTags
""  
""  " below are two examples of Org-mode "hook" functions
""  " These present opportunities for end-user customization
""  " of how VimOrganizer works.  For more info see the 
""  " documentation for hooks in Emacs' Org-mode documentation:
""  " http://orgmode.org/worg/org-configs/org-hooks.php#sec-1_40
""  
""  " These two hooks are currently the only ones enabled in 
""  " the VimOrganizer codebase, but they are easy to add so if
""  " there's a particular hook you want go ahead and request it
""  " or look for where these hooks are implemented in 
""  " /ftplugin/org.vim and use them as example for placing your
""  " own hooks in VimOrganizer:
""  function! Org_property_changed_functions(line,key, val)
""          "call confirm("prop changed: ".a:line."--key:".a:key." val:".a:val)
""  endfunction
""  function! Org_after_todo_state_change_hook(line,state1, state2)
""          "call ConfirmDrawer("LOGBOOK")
""          "let str = ": - State: " . Pad(a:state2,10) . "   from: " . Pad(a:state1,10) .
""          "            \ '    [' . Timestamp() . ']'
""          "call append(line("."), repeat(' ',len(matchstr(getline(line(".")),'^\s*'))) . str)
""          
""  endfunction
""  
""  
""  let g:agenda_files = ['agenda.org','d:/hom/VimOrganizer/agenda.org']
""  
""  nmap <F9> :execute "normal! o<".Timestamp().'>'<cr>
""  imap <F9> <c-r>=' <'.Timestamp().'>'<cr>"}}}
"}}}
let maplocalleader = "_"


" スクラッチ
" ==========

"lingr用。空白削除関数。
nnoremap ,<Space>k :call Kill_blank_line()<CR>
function! Kill_blank_line()
  let prison = line('.')
  let prisonend = line('$')
  while prison < prisonend
    let checkblank =getline(".")
    let checkblank_next =getline(line('.')+1)
    if checkblank =='' && checkblank_next !=''
      join
    else
      "call cursor(prison+1,1)
      normal! j
    endif
    let prison +=1
  endwhile
endfunction

"'%'コマンドを拡張する#Bible4-10
  runtime macros/matchit.vim
  let b:match_ignorecase = 1
  let b:batch_words = &matchpairs . ",\<if\>:\<endif\>"


function! s:alterbuf_load()
  let fname = expand('<afile>:p:r') . '.hidden'
  if filereadable(fname)
    silent! exe "1split" fnameescape(fname) | silent! hide
  endif
endfunction

autocmd BufCreate *.alter call s:alterbuf_load()

"autocmd CursorMoved * redraw

let g:fontzoom_no_default_key_mappings = 1
nmap ,+ <Plug>(fontzoom-larger)
nmap ,- <Plug>(fontzoom-smaller)

augroup gitcommit
  au!
  au BufRead *  if &ft=='gitcommit' |setl nofoldenable |endif
augroup END


noremap ,g :Git <Down>
noremap ,xc :!start ctags %<CR>

"終了時エラー確認
set verbosefile=/tmp/vim.log
