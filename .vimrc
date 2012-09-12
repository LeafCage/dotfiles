" vim: set fdm=marker sw=2 sts=2 cms="%s :
"=============================================================================
"init
"-----------------------------------------------------------------------------

"sow.vim
  "map ,s <Plug>(sow_start)
  let g:sow_dc = '~/.sow_dc/.old'

"neobundle.vim"{{{
filetype off

if has('vim_starting')
  if isdirectory(expand('$HOME/vimfiles', ':p'))
    set runtimepath+=$HOME/vimfiles/neobundle/neobundle.vim
    call neobundle#rc(expand('$HOME/vimfiles/neobundle'))
  else
    set runtimepath+=$VIM/vimfiles/neobundle/neobundle.vim
    call neobundle#rc(expand('$VIM/vimfiles/neobundle'))
  endif
endif

"--------------------------------------
"拡張インターフェイス
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler', {'depends': 'Shougo/unite.vim'}
NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'pocket7878/presen-vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'mattn/gist-vim'
"exe "NeoBundle 'mrtazz/simplenote.vim'" | "オンラインノートsimplenoteを使う
"exe "NeoBundle 'gregsexton/gitv'" | "vim版Gitk()
"exe "NeoBundle 'tomtom/ttoc_vim', {'depends': 'tomtom/tlib_vim'}" | "アウトライナ
"exe "NeoBundle 'kien/ctrlp.vim'" | "カレントファイルにアクセスする
"NeoBundle 'vim-scripts/vimwiki'
"NeoBundle 'https://github.com/fuenor/qfixhowm.git'

"--------------------------------------
"ライブラリ
NeoBundle 'Shougo/vimproc'
NeoBundle 'tomtom/tlib_vim'
exe 'NeoBundle "vim-jp/vital.vim"' | "最近なぜかNeoBundleからアップデートできない
exe "NeoBundle 'thinca/vim-openbuf'" | "unite-vim_hacksがこれに依存
"exe "NeoBundle 'mattn/wwwrenderer-vim'" | "webpage(only text)を返す
"exe "NeoBundle 'mattn/webapi-vim'" | "

"--------------------------------------
"環境
"exe "NeoBundle 'kana/vim-tabpagecd'" | "TabPage毎にcrrdirを持てるようにする
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'kana/vim-submode'
"exe "NeoBundle 'thinca/vim-localrc'" | "特定dir以下に.lvimrcを置くとdir以下のfileだけで設定反映
NeoBundle 'Rykka/lastbuf.vim'
NeoBundle 'LeafCage/revolver.vim'

"--------------------------------------
"拡張文章
"NeoBundle 'vim-jp/vimdoc-ja'
exe "NeoBundle 'https://github.com/ujihisa/mdv.git'" | "VimHacksで使われている拡張Markdown
NeoBundleLazy 'motemen/hatena-vim'

"--------------------------------------
"入力・移動
NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neocomplcache-snippets-complete', {'depends': 'Shougo/neocomplcache'}
NeoBundle 'kana/vim-textobj-user'
  exe "NeoBundle 'h1mesuke/textobj-wiw'" | "カーソルドのwordを選択する/ CamelCaseMotionの働きも？
  NeoBundle 'kana/vim-textobj-indent'
  NeoBundle 'thinca/vim-textobj-plugins'
NeoBundle 'anyakichi/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bkad/CamelCaseMotion'
"NeoBundle 'kana/vim-smartword'
"NeoBundle 'kana/vim-smartchr'
exe "NeoBundle 'thinca/vim-poslist'" | "Bible 3-13
exe "NeoBundle 'thinca/vim-visualstar'" | " *検索 #B3-14
exe "NeoBundleLazy 'https://github.com/vim-scripts/DrawIt.git'" | "図を描写する #Bible5-4
exe "NeoBundleLazy 'https://github.com/vim-scripts/Align.git'" | "高機能なテキストファイル整形ツール #Bible5-11
NeoBundleLazy 'https://github.com/tpope/vim-speeddating.git'

"--------------------------------------
"コマンドライン
exe "NeoBundle 'thinca/vim-ambicmd'" | "コマンド名省入力 ex)NeoBundleUpdate > NBU
exe "NeoBundle 'tyru/vim-altercmd'" | "コマンドのエイリアスを作る tyru版あり #B9-6

"--------------------------------------
"情報表示
exe "NeoBundle 'tacroe/unite-mark'" | "マーク一覧を表示
exe "NeoBundle 'tsukkee/unite-tag'" |
exe "NeoBundle 'tsukkee/unite-help'" |
NeoBundle 'tyru/current-func-info.vim'
exe "NeoBundle 'https://github.com/ujihisa/neco-look.git'" | "要look.exe
NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'Shougo/echodoc'
"NeoBundleLazy 'choplin/unite-vim_hacks', {'depends', 'thinca/vim-openbuf'}
NeoBundle 'rbtnn/sign.vim'

"--------------------------------------
"GUI操作
exe "NeoBundle 't9md/vim-quickhl'" | "複数の検索ハイライト
NeoBundle 'tyru/winmove.vim'
NeoBundle 'thinca/vim-fontzoom'
exe "NeoBundle 'ujihisa/unite-font'" | "動かない
exe "NeoBundle 'ujihisa/unite-colorscheme'" | "プレビューしない
NeoBundle 'pasela/unite-webcolorname'

filetype plugin indent on  "ファイル判定をonにする
"}}}

call altercmd#load() "altercmdをこのvimrc内で有効にする
"Lazyしていたpluginsを読み込む
AlterCommand nbs[ource] NeoBundleSource
AlterCommand nbc NeoBundleClean

command! -nargs=0 NeoBundleUpdateShougo
  \ NeoBundleUpdate
  \ unite.vim vimshell vimfiler vimproc neobundle.vim neocomplcache neocomplcache-snippets-complete
command! -nargs=0 NeoBundleUpdateMain
  \ NeoBundleUpdate
  \ vim-quickrun vital.vim open-browser.vim vim-submode vim-surround CamelCaseMotion

"pathogen.vim"{{{
  filetype off "一度ファイル判定をoffにしないとftdetectをロードしてくれないので。
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on  "ファイル判定をonにする
"}}}

"-----------------------------------------------------------------------------
"Encodings, Formats"{{{

scriptencoding utf8 "このファイルのエンコード
if has("win32")
  se tenc =cp932 "Ref.vimでlynxがデフォルトで使うエンコード
endif
se encoding=utf8
se fileencodings=utf8,cp932,iso-2022-jp,euc-jp,default,latin
  "<< BufRead時、'fileencodings'の先頭から'encoding'を試してerrが出なければそれを適用する
"改行コードの自動認識（新規作成されるファイルフォーマットをdosにしたい）
se fileformats=dos,unix,mac

"---
"setglobal fileencoding=cp932  "新規作成されるファイルエンコードをcp932にしたい
"}}}

"-----------------------------------------------------------------------------
"環境変数を作る"{{{

"$HOME がないとき、$VIM/TMPHOME を $HOME にする "{{{
if !exists("$HOME")
  let $HOME=$VIM/TMPHOME
endif
"}}}

"}}}

"-----------------------------------------------------------------------------
"マウスを有効にする"{{{
if has('mouse')
  se mouse=a
endif
"}}}

"-----------------------------------------------------------------------------
"Backup"{{{

"backupfile "{{{

":h backup-table
se nobk nowb
  "NOTE: 'nobk'で'wb'だと書き込みに失敗したときのみbackupfileが残される
se bex=.bcu
se bdir=/tmp/auBcu/,.
  if !isdirectory(&bdir)
    call mkdir(&bdir, "p")
  endif
"}}}

"swapfile "{{{

se swf
se dir=~/vimswap/,.
  if !isdirectory(&dir)
    call mkdir(&dir, "p")
  endif
"}}}

"undofile"{{{
if version >= 703
  se undofile
  let &udir = &bdir
endif
"}}}

"viminfofile "{{{
se vi=
se vi+='20  "marks
se vi+=<50  "register limit (line)
se vi+=s10  "register limit (Kbyte)
se vi+=%  "buffers list
se vi+=h  "viminfoを読み込むとき 'hlsearch' を無効にする
se vi+=ra:,rb:  "removable mediaの指定 (mark履歴対象外にする)
se vi+=n$VIM/.viminfo  "viminfo file name (作成する場所)
"}}}
"}}}







"=============================================================================
"編集設定
"-----------------------------------------------------------------------------
"Indent, 自動整形"{{{

se et ts=2 sts=2 sw=2 ai
  "'ts'   見かけ
  "'sts'  <Tab>の挿入や<BS>の使用等の編集操作
  "'sw'   'ci'や'ai'や>>で挿入されるindent


"行継続の際、挿入されるindent量 :h ft-vim-indent
let g:vim_indent_cont = &sw

se cin cino& cino+=:0
  "< 'cino' については実際使うときになって考え直す必要性 :h cinoptions-values
se smartindent


"auto-format
se formatoptions=
"se fo +=t  "'textwidth' を使ってテキストを自動折返しする
se fo +=q  ""gq" でコメントを整形する。
se fo +=n  "番号付きリスト等を認識して折り返す
se fo +=M  "マルチバイト文字連結時空白を挿入しない
se fo +=m  "マルチバイト文字でも整形を有効にする

"改行時にコメントしない(上手く動いていない(上書きされてる))
"aug vimrc_fo
"  au!
"  au FileType * setlocal fo-=ro
"aug END
"}}}

"-----------------------------------------------------------------------------
"検索"{{{

se ws hls is
se tags=./tags,tags,../tags  "tagsファイルの読み込み先

"grepコマンドで使うプログラムを何にするか
  "set grepprg=internal  " vimgrep をデフォルトのgrepとする場合internal
  "set grepprg=D:/bnr/cmd/cygwingrep/bin/cyggrep.exe\ -nH ""-n;:行番表示-H;:ファイル名表示
  set grepprg=jvgrep ""-n;:行番表示-H;:ファイル名表示
  "set grepprg=cyggrep.exe\ -nH
"}}}

"-----------------------------------------------------------------------------
"書き込み・終了"{{{

":w等でどこにファイルを保存するか
set browsedir=buffer

" 他で書き換えられたら自動で読み直す
set autoread

" バッファへの変更を保存しないで終了するとき、確認する
set confirm
"}}}

"-----------------------------------------------------------------------------
"Window
se lines=40 co=100 scrolloff=2
se hh=0 pvh=0 ea
se wmw=0
se ch=2 "コマンドラインの高さ


" Window位置の保存と復帰 "{{{
if has('gui_running')
  if has('unix')
    let s:infofile = '~/.vim/.vimpos'
  else
    let s:infofile = '$VIM/.vimpos'
  endif

  augroup WinPosSizeSaver
    au!
  augroup END
  exe 'au WinPosSizeSaver VimLeave * call s:WinPosSizeSave("'.s:infofile.'")'

  if filereadable(expand(s:infofile))
    execute 'source '.s:infofile
  endif
  unlet s:infofile
endif

function! s:WinPosSizeSave(filename)"{{{
  let saved_reg = @a
  redir @a
  winpos
  redir END
  let px = substitute(@a, '.*X \(\d\+\).*', '\1', '') + 0
  let py = substitute(@a, '.*Y \(\d\+\).*', '\1', '') + 0
  exe 'redir! >'.a:filename
  if px > 0 && py > 0
    echo 'winpos '.px.' '.py
  endif
  echo 'set lines='.&lines.' columns='.&columns
  redir END
  let @a = saved_reg
endfunction
"}}}
"}}}

"-----------------------------------------------------------------------------
"カーソルの挙動"{{{

"実際に文字がないところにカーソルを置けるようにする
se ve =block,onemore

"カーソル左右の動き
se ww=
se ww+=b  "<BS>
se ww+=s  "<Space>
se ww+=h
se ww+=l
se ww+=<  "<Left>  (nv)
se ww+=>  "<Right> (nv)
se ww+=[  "<Left>  (i Replace)
se ww+=]  "<Right> (i Replace)

"<BS>等をindentやeolを越えて有効にする
se bs=indent,eol,start
"}}}

" ファイルを開いたら前回のカーソル位置へ移動 TODO:mkviewに置き換える
aug vimrc_ex
  au!
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
aug END

"-----------------------------------------------------------------------------
"その他挙動

"AltKeyでmenuにアクセスするか
se wak =no

"keybind timeout
se to tm=3000 ttm=100

"<C-a><C-x>に影響
se nf=hex

se history=50  "コマンド履歴保存数
se clipboard=
se modeline
se wrap  " 行を折り返す
se sm mat=1  "括弧の対応表示時間







"=============================================================================
"特殊UI

"補完を有効にする
set completeopt=menu,menuone,longest,preview

"折り畳み
se fdm=marker cms=%s fdc=5 fdt=FoldCCtext()


"-----------------------------------------------------------------------------
"Statusline
se stl =%!Gs_StatusLine()
"au WinEnter * setl stl=%!Gs_StatusLine()
let g:shujuu_ceiling = 1
let g:shujuu_bottom = 5

function! Gs_StatusLine() "{{{
  let crrbuf_head = '%{empty(bufname("%")) ? "" : expand(''%:p:h'')."/"}'
  let crrbuf_tail = '%9*%t %0*'  "< tail の highlight を変えている :h hl-User1
  let crrbuf_path = crrbuf_head .crrbuf_tail

  let fenc8ff = '[%{&fenc}/%{&ff[:0]}]'

  let info = ''
  if exists('*cfi#format')
    let info .= '%8*%{cfi#format("%.43s()" ,"")}%0*'
  endif

  let funclnum =  s:__gi_funclnum()

  let info .= '%8*%{exists("b:vimfiler.current_dir")?b:vimfiler.current_dir :""}%0*'
  let win_shujuukankei = ['天', '主', '副', '平', '僕', '隷']

  return
    \ '%3(%{repeat(",", winnr()).","}'. '%{'.string(win_shujuukankei).'[exists("b:shujuu_overtaker")?0:w:shujuu]}%*%)'.
    \ '%3n-'. '%.40('. crrbuf_path. '%)'.
    \ '%m%R%H%W%y %('. fenc8ff .'%) '.
    \ info . funclnum. '%='.
    \ '%14(~%L~  %l,%v%)%< %P'
    "\ '['. '%{winnr()}'. '%7*%{'.string(win_shujuukankei).'[w:shujuu]}%*'. ']'.
    "\ '%#%{ShujuuColor()}#'. '%{g:win_shujuukankei[w:shujuu]}%*'. '%13([%L] %l,%v%)%< %P'
    "\ '%#ShujuuMaster#'. '%{g:win_shujuukankei[w:shujuu]}%*'. '%13([%L] %l,%v%)%< %P'
endfunction
"}}}

"関数定義始まりから見た行数を返す >
function! s:__gi_funclnum() "{{{
  let funcdef = search('^\s*\<fu\%[nction]\>', 'bcnW', search('^\s*\<endf\%[unction]\>', 'bcnW'))
  if funcdef > 0
    return ' '.(line('.') - funcdef).' '
  else
    return ''
  endif
endfunction
"}}}

"挿入モード時、ステータスラインのカラー変更
let g:hi_insert = 'hi StatusLine guifg=black guibg=darkyellow gui=bold ctermfg=blue ctermbg=yellow cterm=bold'

if has('syntax')
  syntax on
  augroup InsertHook
    au!
    au InsertEnter * call s:Cng_stlColor('Enter')
    au InsertLeave * call s:Cng_stlColor('Leave')
  augroup END
endif

"i_CTRL-cでstatusLineの色が変更されない問題を修正
inoremap <silent><C-c> <C-c>:call <SID>Cng_stlcolor('Leave')<CR>

let s:slhlcmd = ''
function! s:Cng_stlColor(mode) "{{{
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:__Gs_hi('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
"}}}


"-----------------------------------------------------------------------------
"TabLine
se stal=2 "常に tabline を表示
se tal=%!Gs_TabLine()
let g:TDD_idx = 0
noremap <silent><C-g>yd :let g:TDD_idx = g:TDD_idx>=3 ?0 :g:TDD_idx+1<CR><C-l>

function! Gs_TabLine() "{{{
  let one2tabpEnd = range(1, tabpagenr('$'))
  let titles = map(one2tabpEnd, 's:__Gs_Tabpage_label(v:val)')

  let sep = ' '  "タブ間の区切り
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'

  let info = ''  " 好きな情報を入れる {{{

  "FoldCCnavi
  if exists('*FoldCCnavi')
    let info .= '%#TabLineInfo#'.substitute(strtrans(substitute(FoldCCnavi()[-70:],'\s>\s','%#TabLineFill#> %#TabLineInfo#','g')), '<\x\x>','','g') . '%0* '
    "let info .= '%#TabLineInfo#%.60('.substitute(FoldCCnavi(),'\s>\s',' >','g').'%)%0* '
  endif

  "Keyswitcherの状態
  let info .= g:keyswitcher_modes[g:Keyswitcher_mode_idx]. ' '

  "テスト駆動開発の4モードを表示
  let info .= ['%#TDD_Think#Tnk%*', '%#TDD_Red#Red%*', '%#TDD_Green#Grn%*', '%#TDD_Refactor#Rfc%*'][g:TDD_idx]. ' '

  "gitのブランチ名表示
  "let branch_name = s:vcs_branch_name(getcwd())
  "let info .= (branch_name != '' ? branch_name : '?')

  "カレントバッファの総行数
  "let info .= '%L'

  let info .= 'tw%{&tw}'


  "カレントディレクトリ
  let info .= '[%.35('.fnamemodify(getcwd(), ":~") . '%)]'
 "}}}

  return tabpages . '%=' . info.''  " タブリストを左に、情報を右に表示
endfunction
"}}}

function! s:__Gs_Tabpage_label(tabpagenr) "{{{
  "rol;各タブページのカレントバッファ名+αを表示
  let title = gettabvar(a:tabpagenr, 'title')  "タブローカル変数 t:title を取得
  "<< t:titleを設定していたっけ俺？(されているなら抜けるらしいが)
  if title !=# ''
    return title
  endif

  " カレントタブページかどうかでハイライトを切り替える
  let hiTabLable = a:tabpagenr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
  "let hiWinnum = a:tabpagenr is tabpagenr() ? '%#TabLineSelWinnum#' : '%#TabLineWinnum#'

  " タブページ内の各ウィンドウにあるバッファのリスト
  let bufnrs = tabpagebuflist(a:tabpagenr)

  let winnum = len(bufnrs)
  "let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''

  let edBufnr = bufnrs[tabpagewinnr(a:tabpagenr) - 1]
  "let edBufnr = bufnrs[-1]
  let fname = fnamemodify(bufname(edBufnr), ':t')
  let fname = fname is '' ? 'NoTitle' : fname

  "let tabpagenr = a:tabpagenr > 10 ? 10 : a:tabpagenr-1
  "let tabpageNR = ['壱', '弐', '参', '肆', '伍', '陸', '漆', '捌', '玖', '拾', '?'][tabpagenr]

  return '%'. a:tabpagenr. 'T'. hiTabLable.
    \ a:tabpagenr.
    \ repeat(',', winnum). ' '. edBufnr. '-'. fname.
    \ '%T%#TabLineFill#'
    "\ edBufnr.'-'. fname. '%T%#TabLineFill#'
    "\ hiTabLable. '['. a:tabpagenr. '] '.
endfunction "}}}





"=============================================================================
"その他のhighlight
"全角スペースを表示 TODO:aug vimrc_colorschemeに加える "{{{
if has('syntax')
  syntax on

  aug InvisibleIndicator
    au!
    au VimEnter,BufEnter * call ActivateInvisibleIndicator()
  aug END
endif


function! ActivateInvisibleIndicator()
  hi ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  " 全角スペースを明示的に表示する。
  silent! 2match ZenkakuSpace /　/
endfunction
"}}}

"窓にカーソルの痕跡を残す
aug vimrc_CursorTrack
  au!
  "au WinLeave * match CursorTrack /\%#/
  "au WinEnter * match none
aug END

"-----------------------------------------------------------------------------
aug vimrc_colorscheme
  au!
  au ColorScheme *
    \ call <SID>CursorIM() |
    \ call <SID>StatusLineNC_fixer() |
    \ call <SID>Add_stl8tal_hl() |
    \ call <SID>Other_hl()
aug END

"" 日本語入力ON時のカーソルの色を設定
function! s:CursorIM() "{{{
  if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=#ffb700 guifg=NONE
  endif
endfunction
"}}}

"StatusLine, TabLine で使うhighlight
function! s:StatusLineNC_fixer() "{{{
  "c] StatusLine のhlを取得してguibg guifgを取得
  hi StatusLineNC term=reverse cterm=reverse gui=NONE guibg=Gray80 guifg=Black
endfunction
"}}}
function! s:Add_stl8tal_hl() "{{{
  hi User9 gui=bold guifg=darkblue guibg=lightcyan
  hi User8 gui=bold guifg=darkcyan guibg=lightblue
  hi User7 gui=bold guifg=moccasin guibg=hotpink
  hi TabLineInfo term=reverse ctermfg=Black ctermbg=LightBlue guifg=black guibg=lightblue
  hi ShujuuMaster  guibg=indianred3 ctermbg=darkred
  hi ShujuuServant  guibg=darkslategray4 ctermbg=darkgreen
  hi ShujuuSlave  guibg=royalblue4 ctermbg=blue
  hi User1  guibg=indianred3 ctermbg=darkred
  hi User2  guibg=darkslategray4 ctermbg=darkgreen
  hi User3  guibg=royalblue4 ctermbg=blue
  hi TDD_Red  guibg=indianred3 ctermbg=darkred
  "exe 'hi '. substitute(substitute(s:__Gs_hi('TabLine'), 'guifg=\S\+\ze\s', 'guifg=magenta', ''), 'TabLine', 'TabLineWinnum', '')
  "exe 'hi '. substitute(substitute(s:__Gs_hi('TabLineSel'), 'guifg=\S\+\ze\s', 'guifg=magenta', ''), 'TabLineSel', 'TabLineSelWinnum', '')
endfunction
"}}}

function! s:Other_hl()  "{{{
  hi Pmenu         guifg=white  guibg=#6A5CB4  gui=NONE
  hi CursorTrack   guibg=darkslategray4
endfunction
 "}}}

"a:groupnameの:hiを返す
function! s:__Gs_hi(groupname) "{{{
  redir => hl
  exe 'hi '. a:groupname
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g') "改行除く
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"}}}





"=============================================================================
"表示系

"不可視文字表示
se list lcs=
se lcs +=tab:>-
se lcs +=trail:_  "行末空白
se lcs +=extends:>  "画面に表示しきれない (続く)
se lcs +=precedes:<  "画面に表示しきれない (続く)
se lcs +=eol:$


"隙間を埋める文字
se fillchars=
se fcs +=vert:\|
se fcs +=stl:\ 
se fcs +=stlnc:\ 
se fcs +=fold:\ 
se fcs +=diff:-


let &sbr = '> ' "折り返された行の先頭に表示する文字列
se cpo +=n  "'sbr'を行番号の間に表示させる


se guioptions=
"se go +=c  "単純な選択にはポップアップダイアログでなくコンソールダイアログを使う
se go +=r  "右スクロールバーを常に表示
se go +=L  "垂直分割されたとき左スクロールバーを表示
"se go +=m  "menubar
se go +=g  "無効の menubar 項目を灰色表示


"逐次表示されるメッセージ
se shortmess=
se shm +=a  "ステータス省略表現を使用
se shm +=O  "読み込み、Quickfix関係のメッセージがその前のメッセージを上書きする
se shm +=T  "メッセージが長すぎてコマンドラインに収まらないときは中央を切り詰め
se shm +=W  "書き込み時、メッセージを表示しない
se shm +=o  "書き込み時のメッセージをその後の読み込みメッセージで上書きする
se shm +=I  "Vim開始挨拶メッセージを表示しない






"=============================================================================
"Gvim
"-----------------------------------------------------------------------------
"colorscheme siicEvening

"エラー時の音とビジュアルベルの抑制
au GUIEnter * set vb t_vb=

"Font "{{{
if has('win32')
  set gfn=MeiryoKe_Gothic:h8:cSHIFTJIS,\ MS_Gothic:h10:cSHIFTJIS
  if hostname() == 'SIICP11ALJ'
    set gfn=Migu_1M:h13:cSHIFTJIS,\ MS_Gothic:h14:cSHIFTJIS
  endif
  if hostname() == 'ATSUTO'
    "set gfn=Migu_1M:h15:cSHIFTJIS,\ MS_Gothic:h14:cSHIFTJIS
    "set gfn=Migu_1M:h17:cSHIFTJIS,\ MS_Gothic:h14:cSHIFTJIS
    set gfn=Migu_1M:h11:cSHIFTJIS,\ MS_Gothic:h10:cSHIFTJIS
  endif
  "set gfn=Migu_1M:h9:cSHIFTJIS,\ MS_Gothic:h10:cSHIFTJIS
  set linespace=2
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  set guifontset=a14,r14,k14
  set linespace=0
else
endif
"}}}


if filereadable(fnamemodify('~/.privacy/.vimrc_privacy.vim', ':p'))
  source ~/.privacy/.vimrc_privacy.vim  "lingr.vimのパスワードとか
endif




















"=============================================================================
"Mapping Basis
let mapleader = '\'
let maplocalleader = '_'
noremap [space] <nop>
nmap <Space> [space]
nmap <C-k> [C-k]

"-----------------------------------------------------------------------------
"No operation
"インサートモードで間違って出してほしくないキー
nnoremap <F1> <Nop>
noremap <F13> <Nop>
noremap! <F13> <Nop>
noremap <F15> <Nop>
noremap! <F15> <Nop>
noremap <F16> <Nop>
noremap! <F16> <Nop>
inoremap <S-F16> <Nop>
cnoremap <S-F16> <Nop>
inoremap <M-j> <Nop>

"誤爆防止
nnoremap ZZ <Nop>
nnoremap q <Nop>
noremap zq q
noremap z@ @

"勝手なマークを付けさせない
noremap m <Nop>

"-----------------------------------------------------------------------------
"Substitute
noremap ; :
noremap : ;
noremap - ^
noremap S $
nnoremap j gj|nnoremap k gk|vnoremap j gj|vnoremap k gk
call submode#enter_with('gjgk', 'nv', '', 'gj', 'gj')
call submode#enter_with('gjgk', 'nv', '', 'gk', 'gk')
call submode#leave_with('gjgk', 'nv', '', '<Esc>')
call submode#map('gjgk', 'nv', '', 'j', 'gj')
call submode#map('gjgk', 'nv', '', 'k', 'gk')
"nnoremap gj j|nnoremap gk k|vnoremap gj j|vnoremap gk k
nnoremap <C-g><C-l> <C-l>
"-----------------------------------------------------------------------------
"Alternative

"undoフラグはctrlを押しっぱなしでも有効
inoremap <c-g><c-u> <c-g>u

"-----------------------------------------------------------------------------
"Compensation
"; ,
call submode#enter_with('nextChar', 'nv', '', 'z;', ';')
call submode#enter_with('nextChar', 'nv', '', 'z,,', ',')
call submode#leave_with('nextChar', 'nv', '', 'z')
call submode#map('nextChar', 'nv', '', ';', ';')
call submode#map('nextChar', 'nv', '', ',', ',')

noremap z- -

"-----------------------------------------------------------------------------
"インサートモードでの削除コマンドにundoを有効化させる
inoremap <c-h> <c-g>u<c-h>
inoremap <c-u> <c-g>u<c-u>
"inoremap <c-w> <c-g>u<c-w>








"=============================================================================
"Mapping Normal
"-----------------------------------------------------------------------------
"Normal modeで挿入
nnoremap <silent><C-j> :<C-u>call <SID>Insert_CR()<CR>
function! s:Insert_CR() "{{{
  let foldclosedend = foldclosedend('.')

  if foldclosedend != -1
    call append(foldclosedend, '')
  else
    call append('.', '')
  endif
  normal j
endfunction "}}}

nnoremap <C-g><C-j> :i<CR><CR>.<CR>
nnoremap [C-k]<C-j> :i<CR><CR>.<CR>
nnoremap [space]<C-j> :i<CR><CR>.<CR>


"空白を挿入する
nnoremap [space]a a<Space><Esc>
nnoremap <C-Space> a<Space><Esc>
nnoremap [space]i i<Space><Esc>
nnoremap [space]y i<Space><Esc>la<Space><Esc>h


"-----------------------------------------------------------------------------
let s:bind_win = 'm'

"Win/Buf Open/Close"{{{

"nnoremap <silent> [space]K :exe 'h '.expand('<cword>')<CR><C-w>s<C-w>w<C-o><C-w>W
nnoremap [space]K <C-w>}

exe 'nnoremap '. s:bind_win. 's <C-w>s'
exe 'nnoremap '. s:bind_win. 'b <C-w>v'
exe 'nnoremap '. s:bind_win. 'o <C-w>o'
exe 'nnoremap '. s:bind_win. 'q <C-w>c'
"現在Bufを新しいタブページで開く
nnoremap <silent> <C-w>; :tab split<CR>
exe 'nnoremap <silent> '. s:bind_win. 'v :tab split<CR>'
"ウィンドウレイアウトを保持したままバッファを閉じるコマンド
com! KeepWinBd let kwbd_bn= bufnr("%") |bn |exe "bd ".kwbd_bn |unlet kwbd_bn

nmap dm <SID>bd
noremap <SID>bd :bd<CR>
nmap dn <SID>KeepWinBd
noremap <SID>KeepWinBd :KeepWinBd<CR>
nmap dq <C-w>c
nmap <silent>dv <SID>tabc
nmap <silent>dgt <SID>tabc
noremap <SID>tabc :tabc<CR>

"指定した番号の窓を閉じる
nmap ct <SID>Cls_remoteWin1
nmap cz <SID>Cls_remoteWin$
nmap c1 <SID>Cls_remoteWin1
nmap c2 <SID>Cls_remoteWin2
nmap c3 <SID>Cls_remoteWin3
nmap c4 <SID>Cls_remoteWin4
nmap c5 <SID>Cls_remoteWin5
nmap c6 <SID>Cls_remoteWin6
nmap d,t <SID>Cls_remoteWin1
nmap d,z <SID>Cls_remoteWin$
nmap d,1 <SID>Cls_remoteWin1
nmap d,2 <SID>Cls_remoteWin2
nmap d,3 <SID>Cls_remoteWin3
nmap d,4 <SID>Cls_remoteWin4
nmap d,5 <SID>Cls_remoteWin5
nmap d,6 <SID>Cls_remoteWin6
nnoremap <SID>Cls_remoteWin$ :call <SID>Cls_remoteWin(winnr('$'))<CR>
nnoremap <SID>Cls_remoteWin1 :call <SID>Cls_remoteWin(1)<CR>
nnoremap <SID>Cls_remoteWin2 :call <SID>Cls_remoteWin(2)<CR>
nnoremap <SID>Cls_remoteWin3 :call <SID>Cls_remoteWin(3)<CR>
nnoremap <SID>Cls_remoteWin4 :call <SID>Cls_remoteWin(4)<CR>
nnoremap <SID>Cls_remoteWin5 :call <SID>Cls_remoteWin(5)<CR>
nnoremap <SID>Cls_remoteWin6 :call <SID>Cls_remoteWin(6)<CR>

function! s:Cls_remoteWin(winnr) "{{{
  let save_winnr = winnr()
  exe a:winnr. 'wincmd w'
  hide

  if save_winnr == a:winnr
    return
  endif

  let save_winnr = s:__Gv_adjust_saveWinnr(save_winnr, [a:winnr])
  exe save_winnr. 'wincmd w'
endfunction
"}}}

"特殊窓を遠隔で閉じるコマンド
nmap cq <SID>Close_allSpecialWins
nmap d,q <SID>Close_allSpecialWins
nnoremap <silent><SID>Close_allSpecialWins :call <SID>Close_allSpecialWins({'option': ['&pvw'], 'bt': ['quickfix'], 'ft': ['unite']})<CR>
function! s:Close_allSpecialWins(spclTypes) "{{{
  let save_winnr = winnr()

  let killedwinnr_list = []
  windo call add(killedwinnr_list, s:__chk8kill_SpclWin_winnr(a:spclTypes))

  let save_winnr = s:__Gv_adjust_saveWinnr(save_winnr, killedwinnr_list)
  exe save_winnr.'wincmd w'
endfunction
"}}}
function! s:__chk8kill_SpclWin_winnr(spclTypes) "{{{
  if s:___jg_spclWin(a:spclTypes)
    let winnr = winnr()
    hide
    return winnr
  endif
endfunction "}}}
function! s:___jg_spclWin(spclTypes) "{{{
  let result = 0
  for pcd in a:spclTypes.option
    if pcd
      return 1
    endif
  endfor

  for pcd in a:spclTypes.bt
    if &bt ==# pcd
      return 1
    endif
  endfor

  for pcd in a:spclTypes.ft
    if &ft ==# pcd
      return 1
    endif
  endfor
endfunction
"}}}
function! s:__Gv_adjust_saveWinnr(save_winnr, killedwinnr_list)  "{{{
  let save_winnr = a:save_winnr

  for killedwinnr in reverse(a:killedwinnr_list)
    if killedwinnr == 0
      continue
    endif
    if killedwinnr < save_winnr
      let save_winnr -= 1
    endif
  endfor
  return save_winnr
endfunction
 "}}}
"}}}

"-----------------------------------------------------------------------------
"Win/Buf Switching"{{{


"次／前のバッファおよび次／前タブページへ
nnoremap <silent> <C-S-Tab> :tabp<CR>
nnoremap <silent> <C-Tab> :tabn<CR>
nnoremap <silent> <M-h> :bp<CR>
nnoremap <silent> <M-l> :bn<CR>
nnoremap <silent> [space]h :bp<CR>
nnoremap <silent> [space]l :bn<CR>
nnoremap gr gT
nnoremap <silent> [space]n gt
nnoremap <silent> [space]p gT

"次のウィンドウ・前のウィンドウへ
nnoremap <M-j> <C-w>w
nnoremap <M-k> <C-w>W
nnoremap [space]j <C-w>w
nnoremap [space]k <C-w>W
exe 'nnoremap <silent>'. s:bind_win. 'h :call <SID>Roop_switchWin("h")<CR>'
exe 'nnoremap <silent>'. s:bind_win. 'j :call <SID>Roop_switchWin("j")<CR>'
exe 'nnoremap <silent>'. s:bind_win. 'k :call <SID>Roop_switchWin("k")<CR>'
exe 'nnoremap <silent>'. s:bind_win. 'l :call <SID>Roop_switchWin("l")<CR>'
function! s:Roop_switchWin(bind) "{{{
  let save_winnr = winnr()
  exe 'wincmd '. a:bind
  if winnr() == save_winnr
    let antiBind = a:bind=='h'?'l' : a:bind=='j'?'k' : a:bind=='k'?'j' : 'h'
    exe '16wincmd '. antiBind
  endif
endfunction
"}}}

"指定した窓に跳ぶ
nnoremap [space]1 1<C-w><C-w>
nnoremap [space]2 2<C-w><C-w>
nnoremap [space]3 3<C-w><C-w>
nnoremap [space]4 4<C-w><C-w>
nnoremap [space]5 5<C-w><C-w>
nnoremap [space]6 6<C-w><C-w>
exe 'nnoremap '. s:bind_win. '1 1<C-w><C-w>'
exe 'nnoremap '. s:bind_win. '2 2<C-w><C-w>'
exe 'nnoremap '. s:bind_win. '3 3<C-w><C-w>'
exe 'nnoremap '. s:bind_win. '4 4<C-w><C-w>'
exe 'nnoremap '. s:bind_win. '5 5<C-w><C-w>'
exe 'nnoremap '. s:bind_win. '6 6<C-w><C-w>'


"タブページを手繰る
"call Keyswitcher#map('n', ['', 'r'], '<C-t>', ['<C-t>', '<SNR>'.s:SID().'_[Tabcmd]'])
call Keyswitcher#map('n', ['', 'r'], '<C-t>', ['<C-t>', '[Tabcmd]'])
nnoremap <silent> [Tabcmd]o :tabonly<CR>|"現在タブページ以外を閉じる
nnoremap <silent> [Tabcmd]c :tabclose<CR>|"タブページ閉じる
nnoremap <silent> [Tabcmd]fv :tabe $VIM/.vimrc<CR>
nnoremap <silent> [Tabcmd]] :execute "tab tag ".expand('<cword>')<CR>|"カーソルドタグを新規タブページで開く
nnoremap <silent> [Tabcmd][ :execute "tab help ".expand('<cword>')<CR>|"カーソルドワードを新規タブページで:helpする
nnoremap <silent> [Tabcmd]K :execute "tab help ".expand('<cword>')<CR>|"カーソルドワードを新規タブページで:helpする
nmap <M-t>  [Tabcmd]
"}}}

"-----------------------------------------------------------------------------
"表示・GUI操作"{{{

noremap <C-g><C-g> :echo bufname("%")'['&fenc']['&ff']'(strftime("%Y-%m-%d %X",getftime(bufname("%")))) "["b:charCounterCount"字]" "0x"CursoredCharHex()"\n"FoldCCnavi()<CR>
function! CursoredCharHex()"{{{
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:__byte2hex(s:__str2byte(c))
endfunction

function! s:__str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:__byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction
"}}}

nnoremap me :mes<CR>
nnoremap ma :marks<CR>

"Fontzoom
let g:fontzoom_no_default_key_mappings = 1
call submode#enter_with('fontzoom', 'n', 'r', ',+', '<Plug>(fontzoom-larger)')
call submode#enter_with('fontzoom', 'n', 'r', ',-', '<Plug>(fontzoom-smaller)')
call submode#map('fontzoom', 'n', 'r', '+', '<Plug>(fontzoom-larger)')
call submode#map('fontzoom', 'n', 'r', '-', '<Plug>(fontzoom-smaller)')


",zwmでgui窓を動かす
let [g:wm_move_down, g:wm_move_up, g:wm_move_left, g:wm_move_right] = ['', '', '', ''] "{{{
call submode#enter_with('move-window', 'n', '', ',zwm', '<Nop>')
call submode#leave_with('move-window', 'n', '', '<Esc>')
call submode#map('move-window', 'n', 'r', 'j', '<Plug>(winmove-down)')
call submode#map('move-window', 'n', 'r', '<Down>', '<Plug>(winmove-down)')
call submode#map('move-window', 'n', 'r', 'k', '<Plug>(winmove-up)')
call submode#map('move-window', 'n', 'r', '<Up>', '<Plug>(winmove-up)')
call submode#map('move-window', 'n', 'r', 'h', '<Plug>(winmove-left)')
call submode#map('move-window', 'n', 'r', '<Left>', '<Plug>(winmove-left)')
call submode#map('move-window', 'n', 'r', 'l', '<Plug>(winmove-right)')
call submode#map('move-window', 'n', 'r', '<Right>', '<Plug>(winmove-right)')
"}}}

",zwsで窓の高さ調整
call submode#enter_with('win-size', 'n', '', ',zws', '<Nop>') "{{{
call submode#enter_with('win-size', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('win-size', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('win-size', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('win-size', 'n', '', '<C-w>-', '<C-w>-')
call submode#leave_with('win-size', 'n', '', '<Esc>')
call submode#map('win-size', 'n', '', 'j', '<C-w>+')
call submode#map('win-size', 'n', '', '<Down>', '<C-w>+')
call submode#map('win-size', 'n', '', 'k', '<C-w>-')
call submode#map('win-size', 'n', '', '<Up>', '<C-w>-')
call submode#map('win-size', 'n', '', 'h', '<C-w><')
call submode#map('win-size', 'n', '', '<Left>', '<C-w><')
call submode#map('win-size', 'n', '', 'l', '<C-w>>')
call submode#map('win-size', 'n', '', '<Right>', '<C-w>>')
call submode#map('win-size', 'n', 'x', '=', '<C-w>=')
"}}}


nnoremap ,0 <C-w>=
exe 'nnoremap '. s:bind_win. '0 <C-w>='
nnoremap ,\ <C-w>_
nnoremap <C-w>\ <C-w>_
exe 'nnoremap '. s:bind_win. '\ <C-w>_'
exe 'nnoremap '. s:bind_win. 'J <C-w>J'
exe 'nnoremap '. s:bind_win. 'K <C-w>K'
exe 'nnoremap '. s:bind_win. 'H <C-w>H'
exe 'nnoremap '. s:bind_win. 'L <C-w>L'
"ある窓を大きく開く
"nnoremap <silent>,0 :call <SID>Enlarge_win(0)<CR>
nnoremap <silent>,1 :call <SID>Enlarge_win(1)<CR>
nnoremap <silent>,2 :call <SID>Enlarge_win(2)<CR>
nnoremap <silent>,3 :call <SID>Enlarge_win(3)<CR>
nnoremap <silent>,4 :call <SID>Enlarge_win(4)<CR>
nnoremap <silent>,5 :call <SID>Enlarge_win(5)<CR>
nnoremap <silent>,6 :call <SID>Enlarge_win(6)<CR>
function! s:Enlarge_win(winnr) "{{{
  let targetWinnr = a:winnr ? a:winnr : winnr()
  let save_winnr = winnr()
  let [save_wh, save_wiw] = [&wh, &wiw]
  set wh=20 wiw=20

  exe targetWinnr. 'wincmd w'
  exe 'wincmd ='

  let [&wh, &wiw] = [save_wh, save_wiw]
  exe save_winnr. 'wincmd w'
endfunction
"}}}
"}}}

"-----------------------------------------------------------------------------
"検索ハイライト
noremap <silent> z/ :nohlsearch<CR>:sign unplace 333<CR>

"検索を手繰る
sign define SearchStart text=索 texthl=Search
nnoremap <silent> g/ :exe 'sign jump 333 buffer='.bufnr('%')<CR>
noremap <silent>n :<C-u>call <SID>Put_SearchStartSign(1)<CR>nzv
function! s:Put_SearchStartSign(nN) "{{{
  let [lnr, bufnr] = [line('.'), bufnr('%')]
  if a:nN "nNキーでの検索
    silent let chksign = s:__Gs_signs1buf(bufnr)
    if chksign =~ '=333'
      return
    endif
  endif

  sign unplace 333
  exe 'sign place 333 line='. lnr. ' name=SearchStart buffer='. bufnr
endfunction

function! s:__Gs_signs1buf(bufnr)
  redir => chksign
  exe 'sign place buffer='. a:bufnr
  redir END
  return chksign
endfunction
"}}}

"visualstar.vim
nmap <silent>* <Plug>(visualstar-*)N<SID>Put_SearchStartSign
vmap <silent>* <Plug>(visualstar-*)N<SID>Put_SearchStartSign
noremap <SID>Put_SearchStartSign  :<C-u>call <SID>Put_SearchStartSign(0)<CR>
"map # <Plug>(visualstar-#)N:<C-u>sign unplace 333<CR>


"-----------------------------------------------------------------------------
let s:bind_markj = '@'
"カーソル移動コマンド(Normal,Omap)"{{{

noremap [space]w W
noremap [space]b B
noremap [space]e E
noremap [space]ge gE
omap <C-w> W
omap i<C-w> iW
omap a<C-w> aW
omap <C-b> B
omap <C-e> E
omap g<C-e> gE

"'%'コマンドを拡張する#Bible4-10
runtime macros/matchit.vim
let b:match_ignorecase = 1
let b:batch_words = &matchpairs . ",\<if\>:\<endif\>"

"crrlineの次の括弧内に移動
noremap <silent><M-a> :call <SID>In_nextBracket()<CR>
inoremap <silent><M-a> <Esc>:call <SID>In_nextBracket()<CR>
function! s:In_nextBracket() "{{{
  call search('()\|[]\|{}\|<>\|''''\|""', '', line('.')+1)
  normal! l
  startinsert
endfunction
"}}}


"一つ上or下の他窓をスクロールさせる
noremap <silent><Down> :call <SID>Scroll_other_win(1, "\<lt>C-e>")<CR>
noremap <silent><Up> :call <SID>Scroll_other_win(1, "\<lt>C-y>")<CR>
noremap <silent><Left> :call <SID>Scroll_other_win(1, "\<lt>C-b>")<CR>
noremap <silent><Right> :call <SID>Scroll_other_win(1, "\<lt>C-f>")<CR>
inoremap <silent><Down> <Esc>:call <SID>Scroll_other_win(1, "\<lt>C-e>")<CR>a
inoremap <silent><Up> <Esc>:call <SID>Scroll_other_win(1, "\<lt>C-y>")<CR>a
let g:scroll_other_win_reverse = 0
function! s:Scroll_other_win(_above, bind) "{{{
  let _above = a:_above
  if exists('g:scroll_other_win_reverse') && g:scroll_other_win_reverse
    let _above = !_above
  endif

  if _above
    wincmd W
    exe "normal ". a:bind
    wincmd w
  else
    wincmd w
    exe 'normal '. a:bind
    wincmd W
  endif
endfunction
"}}}


"同じインデントレベルを移動
nn [space]] :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
nn [space][ k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^

"変更リストブラウズ
call submode#enter_with('changelist', 'n', '', 'g,', 'g,zv')
call submode#enter_with('changelist', 'n', '', 'g;', 'g;zv')
call submode#leave_with('changelist', 'n', '', '<Esc>')
call submode#map('changelist', 'n', '', ',', 'g,zv')
call submode#map('changelist', 'n', '', ';', 'g;zv')

"mark jump
exe 'noremap '. s:bind_markj. ' `'
exe 'noremap '. s:bind_markj. '@ ``'
exe 'noremap '. s:bind_markj. '<C-k> `"'

"次の折り畳みに移動
call submode#enter_with('fd-jmp', 'n', '', 'zj', 'zj')
call submode#enter_with('fd-jmp', 'n', '', 'zk', 'zk')
call submode#leave_with('fd-jmp', 'n', '', '<Esc>')
call submode#map('fd-jmp', 'n', '', 'j', 'zj')
call submode#map('fd-jmp', 'n', '', 'k', 'zk')
call submode#map('fd-jmp', 'n', '', 't', '[z')
call submode#map('fd-jmp', 'n', '', 'b', ']z')
"noremap [space]n zj
"noremap [space]p zk

noremap [space]t [z
noremap [space]z ]z

"下二桁指定ジャンプ from ujm
command! -count=1 -nargs=0 GoToTheLine silent execute getpos('.')[1][:-len(v:count)-1] . v:count
nnoremap <silent> gl :GoToTheLine<Cr>
"}}}

"-----------------------------------------------------------------------------
"折り畳み操作
noremap <silent><C-h> :call <SID>Smart_FoldCloser()<CR>
function! s:Smart_FoldCloser() "{{{
  if foldlevel('.') == 0
    normal! zM
    return
  endif

  let foldclosedRslt = foldclosed('.')
  if foldclosedRslt == -1
    normal! zc
    return
  endif

  normal! zc
  if foldclosed('.') != foldclosedRslt
    return
  endif
  normal zM
endfunction
"}}}
"nnoremap <silent>zf A <Esc>^:setl rnu<CR>zf
nnoremap zf A <Esc>^zf
nnoremap <expr>l  foldclosed(line('.')) != -1 ? 'zo' : 'l'
nnoremap <C-g>m zM
nnoremap <C-g>r zR
nnoremap [space]<C-h> zM
nnoremap [space]m zM
nnoremap [space]r zR
au BufEnter,FileType * :call FoldmarkerAppend()
function! FoldmarkerAppend()
  let cmsStart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
  let cmsEnd = matchstr(&cms,'\V%s\zs\.\+')
  let fmr = split(&fmr,',')
  exe 'nnoremap  <C-g>[[ A '.cmsStart.fmr[0].cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>]] A '.cmsStart.fmr[1].cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>[] A'.cmsStart.'===== '.fmr[0].'1 '.fmr[1].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>[1 A '.cmsStart.fmr[0].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>[2 A '.cmsStart.fmr[0].'2'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>[1 A '.fmr[0].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>[2 A '.fmr[0].'2'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>]1 A '.cmsStart.fmr[1].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>]2 A '.cmsStart.fmr[1].'2'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>1[ A '.fmr[0].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>2[ A '.fmr[0].'2'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>1] A '.fmr[1].'1'.cmsEnd.'<ESC>^'
  exe 'nnoremap  <C-g>2] A '.fmr[1].'2'.cmsEnd.'<ESC>^'
endfunction


"-----------------------------------------------------------------------------
"編集コマンド(Normal)
let s:bind_reg = 't'

nnoremap ,w :<C-u>w<CR>
nnoremap ,q :<C-u>qa<CR>
map Y y$
noremap <F4> "+
exe 'nnoremap '. s:bind_reg. ' "'
exe 'nnoremap '. s:bind_reg. '@ "+'
exe 'nnoremap '. s:bind_reg. '8 "+'

map cy "*y
map zy "*y
map cp "*p
map zp "*p


"コメントアウト
"[削]を付ける
nmap <silent> [gc]d :call <SID>CommeToggleDelMarker()<CR>
function! s:CommeToggleDelMarker() "{{{
  let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
  let cmsend = matchstr(&cms,'\V%s\zs\.\+')
  let crrstr = getline('.')
  if matchstr(crrstr, '\[削]') == '[削]'
    call setline('.',substitute(crrstr, cmsstart.'\[削]', '', 'g'))
  else
    exe 'normal! I'.cmsstart.'[削]'
  endif
endfunction "}}}
"★を挿入する
nmap <silent> [gc]o :call <SID>CommeAddStar(0)<CR>
nmap <silent> [gc]O :call <SID>CommeAddStar(1)<CR>
function! s:CommeAddStar(append) "{{{
  let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
  let cmsend = matchstr(&cms,'\V%s\zs\.\+')
  if a:append
    exe 'normal! O'.cmsstart.'★'
  else
    exe 'normal! o'.cmsstart.'★'
  endif
endfunction "}}}


"直前のコマンドを再度実行する
"nnoremap ,. q:k<CR>
nnoremap @: @:
"ペーストしたテキストを再選択するBible3-15
nnoremap <expr> gp '`[' . strpart(getregtype(), 0,1) . '`]'
"前回保存した状態にまでアンドゥ
nnoremap <C-g>u :earlier 1f<CR>
"タグ検索をUniteで置き換える
"nnoremap <silent>  <C-]>  :<C-u>UniteWithCursorWord -immediately tag<CR>


"-----------------------------------------------------------------------------
"設定を切り替える
nmap gs [gs]
"{{{
"文字コード
nnoremap [gs]7   :se fenc=euc-jp<CR>
nnoremap [gs]8   :se fenc=utf-8<CR>
nnoremap [gs]9   :se fenc=cp932<CR>
nnoremap ,7   :se fenc=euc-jp<CR>
nnoremap ,8   :se fenc=utf-8<CR>
nnoremap ,9   :se fenc=cp932<CR>
nnoremap <silent>[gs]-   :let &ff = &ff=='dos' ? 'unix' : &ff=='unix' ? 'mac' : 'dos'<CR>

"タブ
nnoremap <silent>[gs]e   :let &et = !&et<CR>:set et?<CR>
nnoremap [gs]t2   :setl ts=2 sw=2 sts=2<CR>
nnoremap [gs]t4   :setl ts=4 sw=4 sts=4<CR>
nnoremap [gs]t8   :setl ts=8 sw=8 sts=8<CR>

"見た目
nnoremap <silent>[gs]r   :let &rnu = !&rnu<CR>
nnoremap <silent>[gs]n   :let &nu = !&nu<CR>
nnoremap <silent>[gs]l   :let &list = !&list<CR>
nnoremap <silent>[gs]m   :if &go=~'m'| set go-=m| else| set go+=m| endif<CR>
nnoremap <silent>[gs]cc   :let &cc = empty(&cc) ? '+1' : ''<CR>
nnoremap <silent>[gs]cg   :let &cuc = !&cuc<CR>
nnoremap <silent>[gs]cl   :let &cul = !&cul<CR>
nnoremap <silent>[gs]co   :let &cole = &cole==0 ? 3 : 0<CR>:se cole?<CR>
nnoremap <silent>[gs]w   :let &wrap = !&wrap<CR>:se wrap?<CR>
nnoremap <silent>[gs]fm   :let &fdm = &fdm=='marker'?'expr':&fdm=='expr'?'diff':'marker'<CR>:se fdm?<CR>

"挙動
nnoremap <silent>[gs]a   :let &ai = !&ai<CR>:se ai?<CR>
set pastetoggle=<F12> "NOTE: paste mode 中は'ai'無効
"&foに ro を加えたり外したり（コメント文字自動挿入）
nnoremap <silent>[gs]fr   :if &fo=~'[ro]'| setl fo-=ro| echo 'fo -=ro'| else| setl fo+=ro| echo 'fo +=ro'|endif<CR>
"&foに t を加えたり外したり（&tw自動折り返し）
nnoremap <silent>[gs]ft   :if &fo=~'[tc]'| setl fo-=tc| echo 'fo -=tc'| else| setl fo+=tc| echo 'fo +=tc'|endif<CR>
nnoremap <silent>[gs]sw   :let &ws = !&ws<CR>:se ws?<CR>
nnoremap <silent>[gs]sc   :let &ic = !&ic<CR>:se ic?<CR>
nnoremap <silent>[gs]si   :let &is = !&is<CR>:se is?<CR>
nnoremap <silent>[gs]v   :let &vbs = &vbs==0?12:0<CR>:se is?<CR>

"バッファ属性
nnoremap <silent>[gs]M   :let &ma = !&ma<CR>
nnoremap <silent>[gs]R   :let &ro = !&ro<CR>
nnoremap <silent>[gs]W   :let &write = !&write<CR>
nnoremap <silent>[gs]cb   :let &crb = !&crb<CR>:se crb?<CR>
nnoremap <silent>[gs]sf   :let &swf = !&swf<CR>:se swf?<CR>

"スクリプトの変数など
nnoremap <silent>[gs]ps   :let g:scroll_other_win_reverse = !g:scroll_other_win_reverse<CR>:echo 'scroll reverse'.g:scroll_other_win_reverse<CR>
"}}}

nnoremap <silent> <C-@> :call <SID>multikey_effect()<CR>
function! s:multikey_effect() "{{{
  if &rnu == 0
    setl rnu
  else
    setl number
  endif
endfunction
"}}}

"-----------------------------------------------------------------------------
"あるバッファを開く
".vimrcをすぐに開くコマンド
"nnoremap ,ov :e $MYVIMRC<CR>
nnoremap ,ov :e ~/dotfiles/.vimrc<CR>

"junkFile
"noremap ,oj :JunkFile<CR>
"vimscripttips
"noremap ,ot :e ~/vimscripttips.vim<CR>


"ファイルタイプを追加する
"自動でバックアップするタイプになる
"noremap ,t  :set filetype+=.autowrite<CR>
"noremap ,T  :set filetype-=.autowrite|
  \ if exists('#autowrite')| augroup! autowrite| endif<CR>

nnoremap  ,xv :ReloadVimrc<CR>

nnoremap <expr><F1> ":\<C-u>h "
"-----------------------------------------------------------------------------

"テスト変数
nnoremap <C-g>yu :unlet g:test01 |unlet g:test02 |unlet g:test03 |unlet g:test04<CR>
nnoremap <C-g>yy :call <SID>display_test_vars()<CR>
nnoremap <C-g>yk :call PeekEcho()<CR>
function! s:display_test_vars() "{{{
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
"}}}







"=============================================================================
"Mapping Visual

vnoremap v $h
vnoremap zf :call <SID>Fixed_zf()<CR>
function! s:Fixed_zf() range "{{{
  let cmsStart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
  let cmsEnd = matchstr(&cms,'\V%s\zs\.\+')
  let fmr = split(&fmr,',')
  call setline(a:firstline, getline(a:firstline). ' '. cmsStart.fmr[0].cmsEnd)
  call setline(a:lastline, getline(a:lastline). cmsStart.fmr[1].cmsEnd)
endfunction
"}}}

"0,0,0などの並んだ数字を選択して連番にするコマンドhttp://d.hatena.ne.jp/fuenor/20090907/1252315621
vnoremap <silent> <F4><C-a> :ContinuousNumber <C-a><CR>
vnoremap <silent> <F4><C-x> :ContinuousNumber <C-x><CR>
command! -count -nargs=1 ContinuousNumber
  \ let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor










"=============================================================================
"Mapping Insert & CommandLine
"-----------------------------------------------------------------------------
let s:bind_left = 'k'
let s:bind_right = 'f'
let s:bind_comp = 'l'
let s:bind_snip = 's'

"InsertMode, CommandLineでの移動コマンド"{{{
exe 'inoremap <C-'. s:bind_left. '> <Left>'
exe 'inoremap <C-'. s:bind_right. '> <Right>'
exe 'inoremap <M-'. s:bind_left. '> <S-Left>'
exe 'inoremap <M-'. s:bind_right. '> <S-Right>'

exe 'cnoremap <C-'. s:bind_left. '> <Left>'
exe 'cnoremap <C-'. s:bind_right. '> <Right>'
exe 'cnoremap <M-'. s:bind_left. '> <S-Left>'
exe 'cnoremap <M-'. s:bind_right. '> <S-Right>'

inoremap <C-a> <Home>
inoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"InsertModeでのみの移動コマンド {{{
"inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr><C-p>  pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr><C-@>    getline('.')[col('.')-2] =~ '[)}>"''\]]' ? "\<Left>" : "\<Esc>"

"inoremap <silent><C-k> <Esc>:call <SID>bracketTour()<CR>i
"インサートモード用。以前の括弧に飛ぶ
function! s:bracketTour() "{{{
  let col =col('.')
  call search('()\|''''\|""\|[]\|{}\|<>','bW',line('.'))
  if col('.') == col
    normal! ^
    return
  endif
  normal! l
endfunction"}}}
"call submode#enter_with('brackets', 'i', '', '(', '(')
"call submode#enter_with('brackets', 'i', '', '<', '<')
"call submode#enter_with('brackets', 'i', '', '[', '[')
"call submode#enter_with('brackets', 'i', '', '{', '{')
"call submode#enter_with('brackets', 'i', '', "'", "'")
"call submode#enter_with('brackets', 'i', '', '"', '"')
"call submode#leave_with('brackets', 'i', '', '<Esc>')
"call submode#map('brackets', 'i', '', '(', '(')
"call submode#map('brackets', 'i', '', '<', '<')
"call submode#map('brackets', 'i', '', '[', '[')
"call submode#map('brackets', 'i', '', '{', '{')
"call submode#map('brackets', 'i', '', "'", "'")
"call submode#map('brackets', 'i', '', '"', '"')
"call submode#map('brackets', 'i', '', ')', ')')
"call submode#map('brackets', 'i', '', '>', '>')
"call submode#map('brackets', 'i', '', ']', ']')
"call submode#map('brackets', 'i', '', '}', '}')
"call submode#map('brackets', 'i', 'x', '<C-i>', '<Left>')
"}}}

"-----------------------------------------------------------------------------
"InsertMode, CommandLineでの編集コマンド
inoremap <C-d>  <Del>
cnoremap <C-d> <Del>
inoremap <F4> <C-r>+
cnoremap <F4> <C-r>+
inoremap <C-r><C-e> <C-r>"
cnoremap <C-r><C-e> <C-r>"
inoremap <C-r>@ <C-r>+
cnoremap <C-r>@ <C-r>+
inoremap <C-r>8 <C-r>+
cnoremap <C-r>8 <C-r>+
"バックスラッシュが打ちづらいから
inoremap <C-b> \
cnoremap <C-b> \

"-----------------------------------------------------------------------------
"InsertModeでの編集コマンド
inoremap <C-x><C-a> <C-a>
  "< 直前の挿入を再度挿入
inoremap <C-z> <C-d>
inoremap <C-c> <Esc>
inoremap <C-@> <Esc>
cnoremap <C-@> <Esc>
vnoremap <C-@> <Esc>
"入力した文字を大文字・小文字化(madein thinca)
inoremap <C-g><C-u> <ESC>gUvbgi
inoremap <C-g><C-l> <ESC>guvbgi

"-----------------------------------------------------------------------------
"CommandLineでの編集コマンド
"cnoremap <C-y> <C-r>"
"編集中のファイルの場所をカレントディレクトリに設定する
cnoremap <C-x> %:h
cnoremap <expr><C-z> "h "

"TODO 現在のコマンドラインをyankする
"cnoremap <C-y>




"=============================================================================
"コマンドラインウィンドウ

cnoremap <C-q> <C-f>
nnoremap <C-q> q:
nnoremap c; q:
xnoremap c; q:

"コマンドラインウィンドウのキーマップを使いやすいように変更
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
endfunction






"=============================================================================
"Commands
" ヘルプを別のタブで開く
command! -nargs=* -complete=help TH  tab help <args>
AlterCommand th TH

".vimrcをリロードする
command! ReloadVimrc  source $MYVIMRC
AlterCommand rv ReloadVimrc


"パターンとファイル名を逆にしたgrep
command! -complete=file -nargs=+ Perg  call s:perg([<f-args>])
function! s:perg(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction
AlterCommand perg Perg

"現在ファイルのあるディレクトリでvimgrep
command! -nargs=+   CurrentGrep  call s:CurrentGrep([<f-args>])
function! s:CurrentGrep(args)
  execute 'vimgrep' '/'.a:args[0].'/ '.expand(a:args[1]).'/**/*'
  cwindow
endfunction
AlterCommand crrg[rep] CurrentGrep

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

"失敗したaugを無効にする
command! -nargs=1 -complete=augroup  KillAug  call <SID>KillAug(<q-args>)
command! -nargs=1 -complete=augroup  AugKiller  call <SID>KillAug(<q-args>)
function! s:KillAug(augname) "{{{
  exe 'aug '. a:augname
    au!
  aug END
endfunction
"}}}







"=============================================================================
"ファイルタイプ設定
au BufRead,BufNewFile *.markdown,*.md    set ft=markdown
autocmd FileType js setlocal ft=javascript

augroup gitcommit
  au!
  au FileType gitcommit  setl nofoldenable tw=60
augroup END

au FileType snippet setl nofoldenable

aug vimrc_help
  au!
  au FileType help nnoremap <buffer>q <C-w>c
aug END

aug vimrc_vim
  au!
  au FileType vim
    \ inoremap <expr><buffer>\
    \ getline('.') =~ '^\s*$' ? "\\\<Space>" : match(getline('.'), '\S')+1 >= col('.') ? "\\\<Space>" : '\'
aug END


aug qf
  au!
  au FileType qf
    \ noremap <buffer> q :cclose<CR>|
    \ noremap <buffer> <CR> :.cc<CR>|
    \ endif
aug END




"=============================================================================
" 各種プラグイン設定

"-----------------------------------------------------------------------------
"プラグイン 拡張インターフェイス

"quickrun.vim
nmap ,xq <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
  \ 'type': 'markdown/kramdown',
  \ 'cmdopt': '-s',
  \ 'outputter': 'browser'
  \ }
"let g:quickrun_config['sysdraft.vim'] = {'type': 'vim'}


"lingr-vim
au FileType lingr-messages nnoremap <buffer> \ :LingrExit<CR>
noremap ,xl :call <SID>lingrlaunch_in_newtab()<CR>
function! s:lingrlaunch_in_newtab()"{{{
  tabnew
  LingrLaunch
  exe 3 . "wincmd w"
endfunction
"}}}


"ref.vim"{{{
au FileType ref-* nnoremap <silent><buffer>   q   :close<CR>
let g:ref_phpmanual_path = 'D:/dic/vim-ref/php-chunked-xhtml'

"webdictサイトの設定
let g:ref_source_webdict_sites = {}
let g:ref_source_webdict_sites.je = {'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',}
let g:ref_source_webdict_sites.ej = {'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',}
let g:ref_source_webdict_sites.kok = {'url': 'http://dictionary.infoseek.ne.jp/word/%s?dic=daijisen',}
let g:ref_source_webdict_sites.wip = {'url': 'http://ja.wikipedia.org/wiki/%s',}
let g:ref_source_webdict_sites.default = 'ej'
let g:ref_source_webdict_encoding = 'cp932'
"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.kok.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wip.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction
nnoremap ,zj :<C-u>Ref webdict je<Space>
nnoremap ZJ :<C-u>Ref webdict je <C-r><C-w><CR>
nnoremap ,zh :<C-u>Ref webdict ej<Space>
nnoremap ZH :<C-u>Ref webdict ej <C-r><C-w><CR>
nnoremap ,zk :<C-u>Ref webdict kok<Space>
nnoremap ZK :<C-u>Ref webdict kok <C-r><C-w><CR>
AlterCommand zh  Ref webdict ej
AlterCommand zj  Ref webdict je
AlterCommand zk  Ref webdict kok
"}}}





"unite.vim
"------------------
"unite preference "{{{
"let g:unite_enable_start_insert=1  "入力モードで開始する
let g:unite_split_rule = 'botright'  "窓の表示位置
let g:unite_winheight = 20 "水平分割時の窓高さ
"let g:unite_quick_match_table
"let g:unite_data_directory

let g:unite_source_grep_command = 'jvgrep'  "grepコマンド
"let g:unite_source_grep_recursive_opt = '-R'
"let g:unite_source_grep_default_opts = '-Hn'
"let g:unite_source_find_command = 'find'
let g:unite_source_history_yank_enable = 1  "unite-history/yankを有効化する（ヤンクしたテキストの履歴） 
"}}}

aug vimrc_unite
  au!
  au FileType unite setl wfh|wincmd =

"unite basic-Keymaps "{{{
let g:unite_no_default_keymappings = 1
au FileType unite nmap <buffer> i         <Plug>(unite_insert_enter)
au FileType unite nmap <buffer> I         <Plug>(unite_insert_enter)
au FileType unite nmap <silent><buffer><expr> a
  \ unite#smart_map("\<Plug>(unite_append_enter)",
  \                 "\<Plug>(unite_choose_action)")
au FileType unite nmap <buffer> A         <Plug>(unite_append_end)
au FileType unite nmap <buffer> q         <Plug>(unite_exit)
au FileType unite nmap <buffer> Q         <Plug>(unite_all_exit)
au FileType unite nmap <buffer> <C-r>     <Plug>(unite_restart)
  au FileType unite nmap <buffer> @    <Plug>(unite_toggle_mark_current_candidate)
  au FileType unite nmap <buffer> vv         <Plug>(unite_toggle_mark_all_candidates)
au FileType unite nmap <buffer> M         <Plug>(unite_toggle_max_candidates)
au FileType unite nmap <buffer> <Tab>     <Plug>(unite_choose_action)
    au FileType unite nmap <buffer> <C-n>     <Plug>(unite_rotate_next_source)
    au FileType unite nmap <buffer> <C-p>     <Plug>(unite_rotate_previous_source)
au FileType unite nmap <buffer> <C-g>     <Plug>(unite_print_candidate)
au FileType unite nmap <buffer> <C-l>     <Plug>(unite_redraw)
au FileType unite nmap <buffer> <C-h>     <Plug>(unite_delete_backward_path)
au FileType unite nmap <buffer> gg        <Plug>(unite_cursor_top)
au FileType unite nmap <buffer> G         <Plug>(unite_cursor_bottom)
au FileType unite nmap <buffer> j         <Plug>(unite_loop_cursor_down)
au FileType unite nmap <buffer> <Down>    <Plug>(unite_loop_cursor_down)
au FileType unite nmap <buffer> k         <Plug>(unite_loop_cursor_up)
au FileType unite nmap <buffer> <Up>      <Plug>(unite_loop_cursor_up)
au FileType unite nmap <buffer> J         <Plug>(unite_skip_cursor_down)
au FileType unite nmap <buffer> K         <Plug>(unite_skip_cursor_up)
au FileType unite nmap <buffer> ?         <Plug>(unite_quick_help)
au FileType unite nmap <buffer> <CR>      <Plug>(unite_do_default_action)
  au FileType unite nmap <buffer> <C-j> <Plug>(unite_do_default_action)
au FileType unite nnoremap <silent><buffer><expr> d
  \ unite#smart_map('d', unite#do_action('delete'))
au FileType unite nnoremap <silent><buffer><expr> b
  \ unite#smart_map('b', unite#do_action('bookmark'))
au FileType unite nnoremap <silent><buffer><expr> e
  \ unite#smart_map('e', unite#do_action('edit'))
au FileType unite nnoremap <silent><buffer><expr> p
  \ unite#do_action('preview')
au FileType unite nmap <silent><buffer><expr> x
  \ unite#smart_map('x', "\<Plug>(unite_quick_match_default_action)")

au FileType unite nnoremap <silent><buffer><expr> t  unite#smart_map('t', unite#do_action('tabopen'))
au FileType unite inoremap <silent><buffer><expr> t  unite#smart_map('t', unite#do_action('tabopen'))
au FileType unite nnoremap <silent><buffer><expr> yy  unite#smart_map('yy', unite#do_action('yank'))

au FileType unite xmap <buffer> @  <Plug>(unite_toggle_mark_selected_candidates)

au FileType unite imap <buffer> <ESC>     <Plug>(unite_insert_leave)
au FileType unite imap <buffer> <TAB>     <Plug>(unite_choose_action)
au FileType unite imap <buffer> <C-n>     <Plug>(unite_select_next_line)
au FileType unite imap <buffer> <Down>     <Plug>(unite_select_next_line)
au FileType unite imap <buffer> <C-p>     <Plug>(unite_select_previous_line)
au FileType unite imap <buffer> <Up>     <Plug>(unite_select_previous_line)
au FileType unite imap <buffer> <C-f>     <Plug>(unite_select_next_page)
au FileType unite imap <buffer> <C-b>     <Plug>(unite_select_previous_page)
au FileType unite imap <buffer> <CR>      <Plug>(unite_do_default_action)
  au FileType unite imap <buffer> <C-j> <Plug>(unite_do_default_action)
au FileType unite imap <buffer> <C-h>     <Plug>(unite_delete_backward_char)
au FileType unite imap <buffer> <BS>      <Plug>(unite_delete_backward_char)
au FileType unite imap <buffer> <C-u>     <Plug>(unite_delete_backward_line)
au FileType unite imap <buffer> <C-w>     <Plug>(unite_delete_backward_word)
au FileType unite imap <buffer> <C-a>     <Plug>(unite_move_head)
au FileType unite imap <buffer> <Home>    <Plug>(unite_move_head)
au FileType unite imap <buffer> <C-l>     <Plug>(unite_redraw)

au FileType unite inoremap <silent><buffer><expr> e
  \ unite#smart_map('e', unite#do_action('edit'))
au FileType unite inoremap <silent><buffer><expr> d
  \ unite#smart_map('d', unite#do_action('delete'))
au FileType unite imap <silent><buffer><expr> @
  \ unite#smart_map('@', "\<Plug>(unite_toggle_mark_current_candidate)")
au FileType unite imap <silent><buffer><expr> x
  \ unite#smart_map('x', "\<Plug>(unite_quick_match_default_action)")
"}}}
  "ウィンドウを分割して開く
  au FileType unite nnoremap <silent><buffer><expr><C-k>   unite#do_action('split')
  "昇降切換
  au FileType unite nnoremap <buffer><expr><C-s>      unite#mappings#set_current_filters(
    \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
  "no_quit切換
  au FileType unite nnoremap <buffer><C-@>   :let b:unite.context.no_quit = !b:unite.context.no_quit|echo b:unite.context.no_quit<CR>
aug END

AlterCommand u[nite] Unite



"unite-sorce
"------------------
"{{{
"unite neobundle
AlterCommand nb   Unite neobundle
AlterCommand nbi  Unite -auto-quit neobundle/install
AlterCommand nbu  Unite neobundle/update
AlterCommand nbl  Unite neobundle/log
AlterCommand nbus
  \ Unite neobundle/install:unite.vim:vimshell:vimfiler:vimproc:neobundle:neocomplcache:neocomplcache-snippets-complete
AlterCommand nbum
  \ Unite neobundle/install:vim-quickrun:vital.vim:open-browser.vim:vim-submode:vim-surround:CamelCaseMotion


"文字関係
nnoremap ,ag :<C-u>Unite -buffer-name=register register<CR>
nnoremap ,ay :<C-u>Unite history/yank<CR>
xnoremap ,ay d:<C-u>Unite history/yank<CR>
inoremap <expr><C-y> pumvisible() ? "\<C-y>" : "\<Esc>:Unite history/yank\<CR>"


"file/buf関係
nnoremap ,afa :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap ,aff :<C-u>Unite -buffer-name=files file<CR>
nnoremap ,afs :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap ,afm :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap ,amf :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap ,amd :<C-u>Unite -default-action=cd directory_mru<CR>
nnoremap ,ap :<C-u>Unite -buffer-name=files buffer<CR>
nnoremap ,av :<C-u>Unite -buffer-name=files buffer_tab<CR>
nnoremap ,aa :<C-u>UniteBookmarkAdd<CR>
nnoremap ,ab :<C-u>Unite bookmark<CR>
"nnoremap ,au :<C-u>Unite buffer_deleted<CR>

"場所関係
nnoremap ,al :<C-u>Unite line -start-insert<CR>
nnoremap ,ajc :<C-u>Unite change<CR>
nnoremap ,ajj :<C-u>Unite jump<CR>
nnoremap ,amm :<C-u>Unite mark<CR>
  let g:unite_source_mark_marks = '`mlkjih".^MLKJIHabcdefgnopqrstuvwxyzABCDEFGNOPQRSTUVWXYZ012'
nnoremap ,ai :<C-u>Unite outline_indent<CR>
nnoremap ,aia :<C-u>Unite outline_indent:a<CR>
autocmd BufEnter *
  \   if empty(&buftype)
  \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
  \|  endif

"vim関係
nnoremap ,amp :<C-u>Unite mapping<CR>
nnoremap ,ams :<C-u>Unite output:mes<CR>
nnoremap ,ame :<C-u>Unite output:mes<CR>

"GUI/CUI関係
nnoremap ,axf :<C-u>Unite font<CR>
nnoremap ,axw :<C-u>Unite webcolorname<CR>

"unite関係
nnoremap ,au :UniteResume<CR>
nnoremap ,as :<C-u>Unite source<CR>
nnoremap ,a@ :<C-u>Unite menu:main<CR>
nnoremap ,a:m :<C-u>Unite menu:main<CR>
nnoremap ,a:g :<C-u>Unite menu:git<CR>

"source-buffer ファイル名に色を付ける
au Syntax unite
  \ syntax match uniteSource__Buffer_Fname "[^/]\{-1,}\ze\s\["
  \ contained containedin=uniteSource__Buffer
highlight default link uniteSource__Buffer_Fname Constant

"source-menu "{{{
if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

let s:main = {} "{{{
function s:main.map(key, value)
  return { 'word' : a:key, 'kind' : 'command', 'action__command' : a:value }
endfunction
let s:main.candidates = {}
"let s:main.candidates[''] = 
let s:main.candidates['00 menubar'] = 'Unite menu:menubar'
let s:main.candidates['10 git cheatsheet'] = 'e ~/dc2/git_cheatsheet'
let s:main.candidates['10 vimscripttips.vim'] = 'e ~/dc2/vimscripttips.vim'
let s:main.candidates['h 41.6'] = 'h 41.6'
let s:main.candidates['h functions'] = 'h functions'
let s:main.candidates['h [cword]()'] = "exe'h '. g:__cursor_string()[0]. '()'"
let s:main.candidates['put_vim_modeline'] = 'call g:__put_vim_modeline()'

let g:unite_source_menu_menus.main = deepcopy(s:main)
unlet s:main
"}}}

"from Mr.rbtnn
function! g:__cursor_string() "{{{
" カーソル下のあるpatternにマッチするワードと始まりから終わりまでの位置をリストで返す。
" もしマッチしなければ空文字となる。
" 例えばカーソル行が「 ret*rn 9」の場合(*がカーソル位置)
" :echo g:cursor_string() " pattern ==# '[a-zA-Z0-9]'
" ['return',2,7]
" となる。
  let pattern = get(g:,'search_pattern',"[a-zA-Z0-9:#_]")

  let line = getline(".")
  let pos = getpos(".")

" パターンにマッチする先頭に移動する
  let s = pos[2] + pos[3] - 1
  while line[s] =~ pattern
    if s < 0
      break
    else
      let s = s - 1
    endif
  endwhile
  let s = s + 1

" パターンにマッチする後尾まで移動する
  let e = pos[2] + pos[3] - 1
  while line[e] =~ pattern
    if e < 0
      break
    else
      let e = e + 1
    endif
  endwhile
  let e = e - 1

  if s > e
    return ["",(pos[2]+pos[3]-1),(pos[2]+pos[3]-1)]
  else
    return [(line[(s):(e)]),(s),(e)]
  endif
endfunction "}}}
function! g:__put_vim_modeline() " {{{
  if &commentstring =~ "%s"
    let cs = &commentstring
  else
    let cs = '// %s'
  endif
  let cs_str = printf(cs, join([
  \ 'vim:'
  \ , 'set'
  \ , 'ft=' . &ft
  \ , 'fdm=' . &fdm
  \ , 'ff=' . &ff
  \ , 'fileencoding=' . &fileencoding
  \ , ':'
  \ ], " "))

  if getline("$") =~ '.*vim:'
    call setline("$",cs_str)
  else
    call append("$",[cs_str])
  endif
endfunction "}}}


let s:menubar = {} "{{{
function s:menubar.map(key, value)
  return { 'word' : a:key, 'kind' : 'command', 'action__command' : a:value }
endfunction
let s:menubar.candidates = {}
"let s:menubar.candidates[''] = 
let s:menubar.candidates['01Color test'] = 'sp $VIMRUNTIME/syntax/colortest.vim|so %'
let s:menubar.candidates['02Highlight test'] = 'sp |runtime syntax/hitest.vim'
let s:menubar.candidates['03Convert to HTML'] = 'sp runtime syntax/2html.vim'
let s:menubar.candidates['10エンコード指定して再読込(UTF-8)'] = 'e ++enc=utf-8'
let s:menubar.candidates['11エンコード指定して再読込(SJIS cp932)'] = 'e ++enc=cp932'
let s:menubar.candidates['12エンコード指定して再読込(EUC)'] = 'e ++enc=euc-jp'
let s:menubar.candidates['13エンコード指定して再読込(JIS)'] = 'e ++enc=iso-2022-jp'

let g:unite_source_menu_menus.menubar = deepcopy(s:menubar)
unlet s:menubar
"}}}
"}}}
"}}}

"--------------------------------------
"プラグイン ファイラー
"netrw
let g:netrw_liststyle = 3 "常にtree view


"vimshell.vim"{{{
noremap <silent>,xs :let s:A = expand('%:p:h')| exe 'VimShellTab '. s:A|unlet s:A<CR>
au FileType vimshell  setl nobl
au FileType vimshell nmap <buffer> <C-j> <Plug>(vimshell_enter)
au FileType vimshell imap <buffer> <C-j> <Plug>(vimshell_enter)
au FileType vimshell nnoremap <silent> <buffer> q :tabc<CR>
"au FileType vimshell nmap <buffer> q <Plug>(vimshell_exit)
  "< NOTE: exitが正常化されるまでの暫定
au FileType vimshell nnoremap ,ab :<C-u>Unite -default-action=cd bookmark<CR>
au FileType vimshell nnoremap ,ad :<C-u>Unite -default-action=cd directory_mru<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")' "ユーザプロンプトにカレントディレクトリを表示
let g:vimshell_split_height = 50

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


"vimfiler
"vf preference "{{{
let g:vimfiler_as_default_explorer = 1
let g:unite_kind_file_use_trashbox = 1
let g:vimfiler_safe_mode_by_default = 0
"let g:vimfiler_split_rule = 'belowright'
"let g:vimfiler_detect_drives
"let g:vimfiler_data_directory

"拡張子関連付け
"call vimfiler#set_execute_file('vim', 'vim')
"シンタックス
"let g:vimfiler_extensions = {
  \ 'text': '',
  \ 'image': '',
  \ 'archive': '',
  \ 'system': '',
  \ 'multimedia': '',
  \ }
"}}}

"vf call mappings
"nnoremap ,xf :VimFilerBufferDir -double -split -horizontal<CR>
"nnoremap ,fd :VimFilerBufferDir -double -split -reverse<CR>
nnoremap ,ff :VimFiler -split -horizontal -reverse<CR>
nnoremap ,fv :VimFiler -split -horizontal -reverse $VIM<CR>
nnoremap ,fa :VimFilerBufferDir -split -horizontal -reverse<CR>
nnoremap ,fb :Unite -default-action=vimfiler bookmark<CR>
nnoremap ,fd :Unite -default-action=vimfiler directory_mru<CR>
"nnoremap <silent>,xf :<C-u>call vimfiler#switch_filer(join([expand('%:p:h')]), {'split': 1, 'double': 1, 'horizontal': 1})<CR>

aug vimrc_vimfiler
  au!
  au FileType vimfiler  setl nobl
  au FileType vimfiler let b:vimfiler.is_visible_dot_files = 1
"vf basic-Keymaps "{{{
let g:vimfiler_no_default_key_mappings = 1
au FileType vimfiler nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
au FileType vimfiler nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
au FileType vimfiler nmap <buffer> gg <Plug>(vimfiler_cursor_top)
au FileType vimfiler nmap <buffer> <C-l> <Plug>(vimfiler_redraw_screen)
  au FileType vimfiler nmap <buffer> @ <Plug>(vimfiler_toggle_mark_current_line)
au FileType vimfiler nmap <buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line_up)
au FileType vimfiler nmap <buffer> <C-i> <Plug>(vimfiler_switch_to_other_window)
  au FileType vimfiler nmap <buffer> i <Plug>(vimfiler_switch_to_another_vimfiler)
  "au FileType vimfiler nmap <buffer> i :call <SID>Vimfiler_switch_to_other_window()<CR>
  au FileType vimfiler nmap <buffer> vv <Plug>(vimfiler_toggle_mark_all_lines)
  au FileType vimfiler nmap <buffer> vu <Plug>(vimfiler_clear_mark_all_lines)
au FileType vimfiler nmap <buffer> zc <Plug>(vimfiler_copy_file)
au FileType vimfiler nmap <buffer> zm <Plug>(vimfiler_move_file)
au FileType vimfiler nmap <buffer> zd <Plug>(vimfiler_delete_file)
au FileType vimfiler nmap <buffer> r <Plug>(vimfiler_rename_file)
au FileType vimfiler nmap <buffer> K <Plug>(vimfiler_make_directory)
au FileType vimfiler nmap <buffer> N <Plug>(vimfiler_new_file)
au FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_execute)
  au FileType vimfiler nmap <buffer> <C-j> <Plug>(vimfiler_execute)
au FileType vimfiler nmap <buffer> l <Plug>(vimfiler_smart_l)
au FileType vimfiler nmap <buffer> x <Plug>(vimfiler_execute_system_associated)
au FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_execute_system_associated)
au FileType vimfiler nmap <buffer> h <Plug>(vimfiler_smart_h)
au FileType vimfiler nmap <buffer> L <Plug>(vimfiler_switch_to_drive)
au FileType vimfiler nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
au FileType vimfiler nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
  au FileType vimfiler nmap <buffer> <C-h> <Plug>(vimfiler_switch_to_history_directory)
au FileType vimfiler nmap <buffer> . <Plug>(vimfiler_toggle_visible_dot_files)
au FileType vimfiler nmap <buffer> H <Plug>(vimfiler_popup_shell)
au FileType vimfiler nmap <buffer> e <Plug>(vimfiler_edit_file)
"au FileType vimfiler nmap <buffer> E <Plug>(vimfiler_split_edit_file)
au FileType vimfiler nmap <buffer> B <Plug>(vimfiler_edit_binary_file)
au FileType vimfiler nmap <buffer> ge <Plug>(vimfiler_execute_external_filer)
au FileType vimfiler nmap <buffer> <RightMouse> <Plug>(vimfiler_execute_external_filer)
  au FileType vimfiler nmap <buffer> <C-CR> <Plug>(vimfiler_execute_external_filer)
au FileType vimfiler nmap <buffer> ! <Plug>(vimfiler_execute_shell_command)
au FileType vimfiler nmap <buffer> q <Plug>(vimfiler_close)
  au FileType vimfiler nmap <buffer> ddq <Plug>(vimfiler_exit)
au FileType vimfiler nmap <buffer> ? <Plug>(vimfiler_help)
  au FileType vimfiler nmap <buffer> vi <Plug>(vimfiler_preview_file)
au FileType vimfiler nmap <buffer> o <Plug>(vimfiler_sync_with_current_vimfiler)
au FileType vimfiler nmap <buffer> O <Plug>(vimfiler_open_file_in_another_vimfiler)
  au FileType vimfiler nmap <buffer> b <Plug>(vimfiler_open_file_in_another_vimfiler)
  au FileType vimfiler nmap <buffer> <C-g><C-g> <Plug>(vimfiler_print_filename)
au FileType vimfiler nmap <buffer> g<C-g> <Plug>(vimfiler_toggle_maximize_window)
au FileType vimfiler nmap <buffer> yy <Plug>(vimfiler_yank_full_path)
au FileType vimfiler nmap <buffer> M <Plug>(vimfiler_set_current_mask)
au FileType vimfiler nmap <buffer> gr <Plug>(vimfiler_grep)
au FileType vimfiler nmap <buffer> gf <Plug>(vimfiler_find)
au FileType vimfiler nmap <buffer> S <Plug>(vimfiler_select_sort_type)
au FileType vimfiler nmap <buffer> <C-v> <Plug>(vimfiler_switch_vim_buffer_mode)
au FileType vimfiler nmap <buffer> gc <Plug>(vimfiler_cd_vim_current_dir)
au FileType vimfiler nmap <buffer> gs <Plug>(vimfiler_toggle_safe_mode)
au FileType vimfiler nmap <buffer> gS <Plug>(vimfiler_toggle_simple_mode)
au FileType vimfiler nmap <buffer> a <Plug>(vimfiler_choose_action)
au FileType vimfiler nmap <buffer> Y <Plug>(vimfiler_pushd)
au FileType vimfiler nmap <buffer> P <Plug>(vimfiler_popd)
au FileType vimfiler nmap <buffer> t <Plug>(vimfiler_expand_tree)
au FileType vimfiler nmap <buffer> T <Plug>(vimfiler_expand_tree_recursive)
au FileType vimfiler nmap <buffer> I <Plug>(vimfiler_cd_input_directory)
  au FileType vimfiler vmap <buffer> @ <Plug>(vimfiler_toggle_mark_selected_lines)
"}}}
  au FileType vimfiler nnoremap <silent><buffer><expr><C-k>   vimfiler#do_action('split')
  au FileType vimfiler nnoremap <silent>,ab :<C-u>Unite -default-action=vimfiler bookmark<CR>
  au FileType vimfiler nnoremap <silent>,ad :<C-u>Unite -default-action=vimfiler directory_mru<CR>
aug END
function! s:Vimfiler_switch_to_other_window() "{{{
  while 1
    wincmd w
    if &ft == 'vimfiler'
      break
    endif
  endwhile
endfunction
"}}}



"--------------------------------------
"プラグイン ライター

"チェンジログでエントリ作成時に表示されるユーザ名
let g:changelog_username ="LC <>"


"vimwiki.vimで使うwikiのリスト
"let g:vimwiki_list = [{'path':'~/dc/stgmemwk/','index':'stgmemwk' },{'path':'~/dc/siicwk/','index':'siicwk' },{'path':'~/dc/yukokwk/','index':'yukokwk' },{'path':'~/dc/kywrd/','index':'kywrd' },]

"-----------------------------------------------------------------------------
"プラグイン ライブラリ

"-----------------------------------------------------------------------------
"プラグイン 環境

"openbrowser.vim（カーソル下のURL,URIをブラウザで開く、または単語をブラウザで検索する）
nmap ,xo <Plug>(openbrowser-smart-search)
vmap ,xo <Plug>(openbrowser-smart-search)


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




"submode
let g:submode_timeoutlen = 5000


"revolver.vim
nmap mm <Plug>(revolver-mark-local-typeB)
nmap mM <Plug>(revolver-mark-global)
nmap m<Space> <Plug>(revolver-mark-global)
nmap mi <Plug>(revolver-mark-global)
exe 'nmap '. s:bind_markj. ', <Plug>(revolver-jump-last-local-mark)zv'
nnoremap z,m m
"nmap <C-@><C-_> <Plug>(revolver-jump-last-local-mark)zv
"let g:revolver_register_enable_logging = 2
nmap zq <Plug>(revolver-register-recording)
nnoremap z,q q


"lastbuf
let g:lastbuf_level= 2
exe 'noremap <silent>'. s:bind_win. 'u :LastBuf<CR>'



"-----------------------------------------------------------------------------
"プラグイン 入力

"NERDcommenter
"let g:NERDCreateDefaultMappings = 0
"let g:NERDRemoveExtraSpaces = 1
"let g:NERDSpacesDelims = 0
nmap gc [gc]
vmap gc [gc]
nmap [gc]c <Plug>NERDCommenterToggle
vmap [gc]c <Plug>NERDCommenterToggle
nmap [gc]a <Plug>NERDCommenterAppend
nmap [gc]9 <Plug>NERDCommenterToEOL
vmap [gc]s <Plug>NERDCommenterSexy
vmap [gc]b <Plug>NERDCommenterMinimal


"altercmd (other)
AlterCommand g[it] Git
AlterCommand c[tags] !start ctags %


"migemo.vim
if has('migemo')
  set migemo
  "set migemodict=/opt/local/share/migemo/utf-8/migemo-dict
endif
noremap  m/ :<C-u>Migemo<CR>


"neocomplcache.vim  Preference"{{{
let g:neocomplcache_temporary_dir = $VIM.'/settings/.neocon' "ネオコンの一時情報を書き出すディレクトリ
"key:ft, value:辞書ファイルのpath >
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vim' : $VIM.'/settings/neocon_dict/vim.dict',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

let g:neocomplcache_enable_at_startup = 1 "ネオコン有効化
let g:neocomplcache_enable_prefetch = 1 "以前のバージョンの挙動にする。
"let g:neocomplcache_disable_auto_complete = 1 "自動補完を無効にする
let g:neocomplcache_enable_smart_case = 1 "スマートケィス（大文字が含まれている場合は区別する）
let g:neocomplcache_enable_underbar_completion = 1 "アンダーバー_を区切りとした曖昧検索
let g:neocomplcache_enable_camel_case_completion = 1 "大文字を区切りとした曖昧検索
"let g:neocomplcache_enable_auto_select = 1 "ポップアップを出すとき自動的に一番上の候補を選択状態
let g:neocomplcache_auto_completion_start_length = 2 "ポップアップを出し始める文字数（初期値2）
let g:neocomplcache_min_syntax_length = 3 "シンタックス最小キャッシュ文字数
let g:neocomplcache_min_keyword_length = 2 "補完を行うキーワードの最小長さ（初期値4）

"ネオコンが未対応のファイルタイプでのキーワード収集パターン（ファイルタイプ別に指定）
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "単語のヘッド\単語を構成する文字（数字やアルファベット）*
"let g:neocomplcache_keyword_patterns['sfd'] = '\c\[:\%(\h\w*:\]\)\?\| &\h[[:alnum:]_:]*\| \$\h\w*\|-\h\w*=\?\| <SID>\%(\h\w*(\?\)\?\| <Plug>([^)]*)\?\| <\h[[:alnum:]_-]*>\?\| \h[[:alnum:]_:#]*\%(!\| ()\?\)\?\| `\h\w*'

"}}}
"neocomplcache.vim  Mappings"{{{
"Vim標準の補完をネオコンに置き換える
"ファイル名補完
inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
"オムニ補完
inoremap <expr><C-x><C-o>  neocomplcache#manual_omni_complete()
"キーワード補完
"inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()

"ネオコン基本操作
"候補の共通箇所まで補完する
exe 'inoremap <expr><C-'. s:bind_comp. '>  neocomplcache#complete_common_string()'
"決定してポップアップを閉じる
inoremap <expr><C-j>  pumvisible() ? neocomplcache#close_popup() : "\<C-j>"
"キャンセルしてポップアップを閉じる
"inoremap <expr><C-e>  pumvisible() ? eocomplcache#cancel_popup() : "\<End>"
inoremap <expr><C-q>  eocomplcache#cancel_popup()
"inoremap <expr><C-y>  eocomplcache#cancel_popup()
"ネオコンによって挿入した補完を元に戻す
inoremap <expr><C-\>     neocomplcache#undo_completion()
"ネオコン設定変更操作
"}}}

"neocomplcache-snippets-complete "{{{
au FileType snippet  setl nobl
au BufLeave *.snip setl nobl
au FileType snippet  noremap <buffer>q <C-w>q
let g:neocomplcache_snippets_dir = $VIM.'/settings/neocon_snippets' "スニペットプラグインディレクトリ
"カーソル前の文字列がスニペットのトリガであるなら、スニペットを展開する
exe 'imap <expr><C-'. s:bind_snip. '>  neocomplcache#sources#snippets_complete#force_expandable() ? "\<Plug>(neocomplcache_snippets_force_expand)" : "\<Plug>(neocomplcache_snippets_force_jump)"'
"nmap <silent><C-s>  :call feedkeys("a\<Plug>(neocomplcache_snippets_jump)")<CR>
"スニペットを編集する
noremap ,os :<C-u>wincmd s| NeoComplCacheEditSnippets<CR>
noremap ,oS :<C-u>wincmd s| NeoComplCacheEditRuntimeSnippets<CR>
noremap ,ors :<C-u>wincmd s| NeoComplCacheEditRuntimeSnippets<CR>
"}}}


"-----------------------------------------------------------------------------
"プラグイン 移動
"posilist.vim
map <M-o> <Plug>(poslist-prev-pos)
map <M-i> <Plug>(poslist-next-pos)
"call submode#enter_with('posl-b', 'nv', 'r', '[space]<C-o>', '<Plug>(poslist-prev-buf)')
"call submode#enter_with('posl-b', 'nv', 'r', '[space]<C-i>', '<Plug>(poslist-next-buf)')
"call submode#leave_with('posl-b', 'nv', '', '<Esc>')
"call submode#map('posl-b', 'nv', 'r', '<C-o>', '<Plug>(poslist-prev-buf)')
"call submode#map('posl-b', 'nv', 'r', '<C-i>', '<Plug>(poslist-next-buf)')
"
""noremap <M-o> <C-o>
""noremap <M-i> <C-i>
"call submode#enter_with('C-oC-i', 'nv', '', 'z<C-o>', '<C-o>')
"call submode#enter_with('C-oC-i', 'nv', '', 'z<C-i>', '<C-i>')
"call submode#leave_with('C-oC-i', 'nv', '', '<Esc>')
"call submode#map('C-oC-i', 'nv', '', '<C-o>', '<C-o>')
"call submode#map('C-oC-i', 'nv', '', '<C-i>', '<C-i>')



"camelcasemotion.vimのコマンドに置き換える
"前方・後方移動をキャメルケース単位にする
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
"omap <silent> e <Plug>CamelCaseMotion_ie
"テキストオブジェクトに対応させる
omap <silent> ib <Plug>CamelCaseMotion_ib
vmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
vmap <silent> ie <Plug>CamelCaseMotion_ie


"h1mesuke/textobj-wiw
let g:textobj_wiw_no_default_key_mappings = 1 "デフォルトで用意されてるマッピングを無効に
"map w <Plug>(textobj-wiw-n)
"map b <Plug>(textobj-wiw-p)
"map e <Plug>(textobj-wiw-N)
  "< omapの時の挙動に欠陥
"map ge <Plug>(textobj-wiw-P)
xmap aw <Plug>(textobj-wiw-a)
xmap iw <Plug>(textobj-wiw-i)
omap aw <Plug>(textobj-wiw-a)
omap iw <Plug>(textobj-wiw-i)



"-----------------------------------------------------------------------------
"プラグイン コマンドライン
"ambicmd.vim(コマンドモードで一定のルールでコマンド補完
exe 'cnoremap <expr> <C-'. s:bind_comp. '> ambicmd#expand("\<Right>")'

"-----------------------------------------------------------------------------
"プラグイン 情報表示

"buftabs.vim（ステータスラインにバッファリストを表示）
let g:buftabs_only_basename=1  "バッファタブにパスを省略してファイル名のみ表示する

"echodoc.vim
let g:echodoc_enable_at_startup = 1

"win-shujuukankei.vim
exe 'nmap '. s:bind_win. 't <Plug>(win-shujuukankei-Dokuritsu)'
exe 'nmap '. s:bind_win. 'y <Plug>(win-shujuukankei-Bankai)'
au FileType vimfiler,unite,vimshell    let b:shujuu_overtaker = 1

"FoldCCnavi
let g:foldCCnavi_shorten = 30

"-----------------------------------------------------------------------------
"プラグイン GUI操作






"=============================================================================
"未整理空間



" 関数
"=====

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



"YankRingっぽくyank/historiesを使う
nnoremap <silent> [space]@ :<C-u>call Keyswitcher#switch('r', 'n')<CR>
call Keyswitcher#map('n', ['r', 's'], '<C-n>', ['<Plug>(yank-replace-n)', ':cn<CR>'])
call Keyswitcher#map('n', ['r', 's'], '<C-p>', ['<Plug>(yank-replace-p)', ':cp<CR>'])
noremap <silent><Plug>(yank-replace-n) :call <SID>Yank_replace(1)<CR>
noremap <silent><Plug>(yank-replace-p) :call <SID>Yank_replace(-1)<CR>
let s:yank_histories_replace_idx = 0
function! s:Yank_replace(fluct) "{{{
  let yank_histories = s:__get_yank_histories()
  if exists('s:yank_histories_cache') && s:yank_histories_cache != yank_histories
    let s:yank_histories_replace_idx = 0
  endif
  let s:yank_histories_cache = copy(yank_histories)

  let yank_histories_len = len(yank_histories)
  let s:yank_histories_replace_idx += a:fluct
  let s:yank_histories_replace_idx = s:yank_histories_replace_idx>=yank_histories_len? 0
    \ : s:yank_histories_replace_idx<0 ? yank_histories_len-1
    \ : s:yank_histories_replace_idx
  echo s:yank_histories_replace_idx

  let replace_content = get(yank_histories, s:yank_histories_replace_idx, '')

  let [bgn, end] = [line("'["), line("']")]
  if bgn != line('.') || bgn == 0 || end == 0
    return
  endif
  let [save_reg, save_regtype] = [getreg('"'), getregtype('"')]
  call setreg('"', replace_content,)
  silent exe 'normal! u'
  silent exe 'normal! '. (0? 'gv' :''). '""'. 'p'
  call setreg('"', save_reg, save_regtype)
endfunction
"}}}
function! s:__get_yank_histories() "{{{
  let l = []
  let c = unite#sources#history_yank#define().gather_candidates('','')
  for pkd in c
    call add(l, pkd.word)
  endfor
  return l
endfunction
"}}}





" 各種プラグイン設定
"===================






"vim-vcs.vim
  "設定用辞書変数
"    let g:vcs#config = {'alias':{'st':'status'},}






"smartchr
  "autocmd FileType vim, inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', '=')
"cnoremap <expr> [  smartchr#one_of('[', '\[', {'ctype': '/?'})




















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
"}}}

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



function! s:alterbuf_load()
  let fname = expand('<afile>:p:r') . '.hidden'
  if filereadable(fname)
    silent! exe "1split" fnameescape(fname) | silent! hide
  endif
endfunction

autocmd BufCreate *.alter call s:alterbuf_load()

"autocmd CursorMoved * redraw


function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

unlet s:bind_win s:bind_left s:bind_right s:bind_comp s:bind_snip s:bind_markj s:bind_reg

"-----------------------------------------------------------------------------

"from thinca

"" Show the diff between the current buffer and the last saved file. {{{
"" TODO: Become plugin.
"function! s:diff_original()
"  if exists('b:diff_current')
"    execute bufwinnr(b:diff_current) 'wincmd w'
"  endif
"  if exists('b:diff_original')
"    diffoff
"    execute b:diff_original 'bwipeout'
"    unlet b:diff_original
"    return
"  endif
"
"  let bufnr = bufnr('%')
"  let ft = &l:filetype
"  let fenc = &l:fileencoding
"
"  if &modified
"    let source = '#' . bufnr
"    let file = '[last save]'
"  endif
"  if !exists('source')
"    silent! call g:V.system('svn info')
"    if !g:V.get_last_status()
"      let source = '!svn cat #' . bufnr
"      let file = '[svn HEAD]'
"    endif
"  endif
"  if !exists('source')
"    silent! call g:V.system('bzr info')
"    if !g:V.get_last_status()
"      let source = '!bzr cat #' . bufnr
"      let file = '[bzr tip]'
"    endif
"  endif
"  if !exists('source')
"    silent! let git_dir = g:V.system('git rev-parse --git-dir')
"    if git_dir !=# ''
"      let source = '!git cat-file blob HEAD:' .
"        \ expand('#' . bufnr . ':p')[strlen(fnamemodify(git_dir, ':p')) - 5:]
"      let source = substitute(source, '\\', '/', 'g')
"      let file = '[git HEAD]'
"    endif
"  endif
"
"  if !exists('source')
"    echo 'There is not the diff.'
"    return
"  endif
"
"  vertical new
"
"  let b:diff_current = bufnr
"  let bufnr = bufnr('%')
"  setlocal buftype=nofile
"  let &l:filetype = ft
"  let &l:fileencoding = fenc
"  file `=file . fnamemodify(bufname(b:diff_current), ':.')`
"
"  silent! execute 'read' source
"
"  0 delete _
"  diffthis
"  wincmd p
"  diffthis
"  let b:diff_original = bufnr
"endfunction
"nnoremap <silent> <Space>diff :call <SID>diff_original()<CR>
"" }}}


"終了時エラー確認
set verbosefile=/tmp/vim.log


"=============================================================================
"TODO
"
"vimfilerにハードリンク(2000~XP)などを作らせるコマンド用意
"
"
"Idea etc
"
"カーソル位置から前後数行を対象にコマンドを実行する（画面から見える位置に限定して）
"au WinLeave WinEnter を利用して、別窓に映ったとき、カーソルがあった場所に痕跡を残す
"自動で関数の始まりから終わりまでが見える大きさにウィンドウサイズ変更
"コメント接頭辞に<CR>で属性変更 ] c] a]
"前回の保存からの変更点をhlさせる
"ステータスラインの色を変更し、そのウィンドウが別の文脈にあることを示す
"hatenaようsyntax
"twitterクライアントとか各種掲示板ビューア・lingrビューア
"アンド検索（一件目がhitした後二件目のwordで一件目の前後数行を検索
"
"-----------------------------------------------------------------------------
"関数を削除するテキストオブジェクト　例えばfun('aaa')で実行で'aaa'だけになる
"次の空白文字へ
"レインボーブランケットをsyntaxにインポート
"マーキングコメント。"[削] とか"★とかを付け外しする（ノーマルコメント←→特殊コメント）
"折り畳み先頭行のシンタックスを目立たせる
"
"--------------------------------------
" expander
" コマンドラインからzencodingっぽく　暗号＋修飾したいもので修飾済みの文字列挿入
"
"vimのexコマンド補完を利用したバッファセレクタやmruセレクタ、yank履歴セレクタの作成
"input()式バッファセレクタ（input()方式は汎用性があるからオブジェクトで作る？）

"テスト用不思議変数g:tess01 g:tess02 "通常の変数の機能+変異を記録
"unite より使いやすいカラー一覧
"u]コマンドライン型unite


