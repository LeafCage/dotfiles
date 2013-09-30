" vim: set fdm=marker sw=2 sts=2 cms="%s :
"=============================================================================
aug vimrc
  au!
aug END
let s:bind = {'win': 'm', 'markj': '[C-k]', 'reg': '[@]', 'mode': '<C-q>', 'esc': '<C-o>', 'snip': 's', 'sticky': '[C-k]'}
"--------------------------------------
scriptencoding utf8 "このファイルのエンコード
"BufRead時、'fileencodings'の先頭から'encoding'を試してerrが出なければそれを適用
set encoding=utf8 fileencodings=utf8,cp932,iso-2022-jp,euc-jp,default,latin
"改行コードの自動認識（新規作成されるファイルフォーマットをdosにしたい）
set fileformats=dos,unix,mac





"vimfiler
let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '...'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'
let g:vimfiler_data_directory = $HOME.'/.vim/tmp/vimfiler'






"======================================
"環境変数
"$HOME がないとき、$VIM/TMPHOME を $HOME にする "{{{
if !exists("$HOME")
  if isdirectory('/hom')
    let $HOME='/hom'
  else
    let $HOME=$VIM. '/TMPHOME'
  endif
endif
"}}}
"$PATHを追加{{{
function! s:add_path(path)
  let $PATH .= $PATH =~ a:path ? '' : a:path. ';'
endfunction
if has('vim_starting')
  let $PATH .= ';'
  call s:add_path('/bnr/cmd/MinGW/bin')
  call s:add_path('/bnr/cmd/path')
  call s:add_path('/bnr/cmd/PortableGit-1.7.11-preview20120620/bin')
  call s:add_path('C:/Program Files/Java/jdk1.7.0_09/bin')
endif
"}}}
let $TERM = exists('$TERM') ? $TERM : 'msys'
let $DOTFILES = $HOME. '/box/dotfiles'
"--------------------------------------
"vim関係のpath
let $BASEDIR = exists('$BASEDIR') ? $BASEDIR : expand($HOME . '/box')
let $MYVIMRC_SUBSTANCEDIR = $BASEDIR. '/dotfiles/vim'
let $VIMSYSTEM = $HOME. '/.vimsystem'
let $VIMUSERDIR = $BASEDIR. '/vimuser'
if has('vim_starting')
  let $VIMFILES = isdirectory(expand('$BASEDIR/vimfiles')) ? $BASEDIR. '/vimfiles' : isdirectory(expand('$HOME/vimfiles')) ? $HOME. '/vimfiles' : $VIM. '/vimfiles'
  set rtp+=$VIMFILES,$VIMFILES/after,$VIMFILES/neobundle/neobundle.vim
endif

"=============================================================================
"neobundle.vim
call neobundle#rc(expand('$VIMFILES/neobundle'))
NeoBundleLocal $VIMFILES/bundle/
NeoBundle 'Shougo/neobundle.vim'
"--------------------------------------
"Library
NeoBundleLazy 'Shougo/vimproc'
NeoBundleLazy 'vim-jp/vital.vim', {'autoload': {'commands': 'Vitalize'},}
NeoBundleLazy 'tomtom/tlib_vim'
NeoBundleLazy 'thinca/vim-openbuf'
NeoBundleLazy 'mattn/wwwrenderer-vim' "webpage(only text)を返す
NeoBundleLazy 'mattn/webapi-vim'
NeoBundleLazy 'osyo-manga/vim-gift'
"--------------------------------------
"Synthesis
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'kien/ctrlp.vim',
NeoBundleLazy 'Shougo/vimshell'
NeoBundleLazy 'Shougo/vimfiler'
"--------------------------------------
"Network&Documents
NeoBundleLazy 'tyru/open-browser.vim', {'autoload': {'mappings': [['sxn', '<Plug>(openbrowser-']], 'commands': [{'complete': 'customlist,openbrowser#_cmd_complete', 'name': 'OpenBrowserSearch'}, {'complete': 'customlist,openbrowser#_cmd_complete', 'name': 'OpenBrowserSmartSearch'}, 'OpenBrowser']}}
NeoBundleLazy 'thinca/vim-ref'
NeoBundleLazy 'basyura/J6uil.vim', {'depends': 'mattn/webapi-vim'}
NeoBundleLazy 'LeafCage/ref-javadoc', {'depends': 'thinca/vim-ref', 'stay_same': 1}
"NeoBundle 'vim-jp/vimdoc-ja'
"--------------------------------------
"Development
NeoBundleLazy 'tpope/vim-fugitive', {'augroup': 'fugitive', 'autoload': {'commands': 'Git'}}
NeoBundleLazy 'thinca/vim-quickrun', {'autoload': {'commands': 'QuickRun', 'mappings': ['<Plug>(quickrun']}}
NeoBundleLazy 'kannokanno/vimtest'
NeoBundleLazy 'kannokanno/vmock'
NeoBundleLazy 'LeafCage/laptime.vim', {'stay_same': 1}
NeoBundleLazy 'h1mesuke/vim-benchmark'
NeoBundleLazy 'LeafCage/vimhelpgenerator'
"NeoBundleLazy 'gregsexton/gitv' "vim版Gitk()
NeoBundleLazy 'cocoa.vim' "Objective-C
NeoBundleLazy 'javacomplete'
NeoBundleLazy 'Javascript-OmniCompletion-with-YUI-and-j'
"NeoBundle 'mikelue/vim-maven-plugin' "Apache Maven project
"NeoBundle 'groovy.vim'
"NeoBundle 'derekwyatt/vim-scala'
"--------------------------------------
"Insert
"NeoBundle 'kana/vim-smartchr'
NeoBundleLazy 'Shougo/neocomplcache'
NeoBundleLazy 'Shougo/neosnippet'
NeoBundleLazy 'scrooloose/nerdcommenter', {'autoload': {'mappings': [['inx', '<Plug>NERDCommenter']]}}
NeoBundleLazy 'LeafCage/nebula.vim', {'autoload': {'commands': ['NebulaPutLazy', 'NebulaPutFromClipboard', 'NebulaYankOptions', 'NebulaPutConfig']}, 'stay_same': 1}
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace' "レジスタにあるものとoperator指定したものを置き換え
NeoBundleLazy 'kana/vim-textobj-user'
NeoBundleLazy 'h1mesuke/textobj-wiw', {'depends': 'kana/vim-textobj-user', 'autoload': {'mappings': ['<Plug>(textobj-wiw']}} "カーソルドのwordを選択する/ CamelCaseMotionの働きも？
NeoBundleLazy 'kana/vim-textobj-indent', {'depends': 'kana/vim-textobj-user','autoload': {'mappings': ['<Plug>(textobj-indent']}}
NeoBundleLazy 'thinca/vim-textobj-plugins', {'depends': 'kana/vim-textobj-user','autoload': {'mappings': ['<Plug>(textobj-between']}}
NeoBundleLazy 'anyakichi/vim-textobj-xbrackets', {'depends': 'kana/vim-textobj-user', 'autoload': {'mappings': ['<Plug>(textobj-xbrackets']}}
NeoBundleLazy 'sgur/vim-textobj-parameter', {'depends': 'kana/vim-textobj-user', 'autoload': {'mappings': ['<Plug>(textobj-parameter']}}
NeoBundleLazy 'osyo-manga/vim-textobj-multiblock', {'depends': 'kana/vim-textobj-user', 'autoload': {'mappings': ['<Plug>(textobj-multiblock']}}
NeoBundleLazy 'anyakichi/vim-surround'
NeoBundleLazy 'supermomonga/unite-sudden-death', {'autoload': {'unite_sources': ['suddendeath']}}
NeoBundleLazy 'LeafCage/unite-recording', {'stay_same': 1}
"--------------------------------------
"Moving
NeoBundleLazy 'kana/vim-smartword', {'autoload': {'mappings': ['<Plug>(smartword-']}}
NeoBundle 'deton/jasegment.vim' "WBEを日本語文節区切り移動に
NeoBundleLazy 'bkad/CamelCaseMotion', {'autoload': {'mappings': ['<Plug>CamelCaseMotion_']}}
NeoBundleLazy 'deris/columnjump', {'autoload': {'mappings': ['<Plug>(columnjump-']}}
"NeoBundle 'rhysd/clever-f.vim'
NeoBundleLazy 'thinca/vim-poslist', {'autoload': {'mappings': ['<Plug>(poslist-']}}
NeoBundleLazy 'thinca/vim-visualstar', {'autoload': {'mappings': ['<Plug>(visualstar-']}}
NeoBundleLazy 'https://github.com/vim-scripts/DrawIt.git' "図を描写する #Bible5-4
NeoBundleLazy 'https://github.com/vim-scripts/Align.git' "高機能なテキストファイル整形ツール #Bible5-11
NeoBundleLazy 'https://github.com/tpope/vim-speeddating.git'
"--------------------------------------
"Writing
"NeoBundle 'mrtazz/simplenote.vim' "オンラインノートsimplenoteを使う
"NeoBundle 'tomtom/ttoc_vim', {'depends': 'tomtom/tlib_vim'} "アウトライナ
"NeoBundle 'vim-scripts/vimwiki'
"NeoBundle 'https://github.com/fuenor/qfixhowm.git'
NeoBundleLazy 'thinca/vim-showtime', {'autoload': {'commands': [{'complete': 'file', 'name': 'ShowtimeStart'}]}}
"--------------------------------------
"Buffer&Win&Tabpage&Jump
"NeoBundle 'kana/vim-tabpagecd' "TabPage毎にcrrdirを持てるようにする
"NeoBundle 'Rykka/lastbuf.vim'
"NeoBundleLazy 'osyo-manga/vim-reanimate', {'autoload': {'commands': ['ReanimateSave', 'ReanimateLoad', 'ReanimateSaveInput', 'ReanimateLoadInput', 'ReanimateLoadLatest', 'ReanimateSaveCursorHold', 'ReanimateSwitch', 'ReanimateEditVimrcLocal', 'ReanimateUnload']}}
NeoBundleLazy 'kana/vim-altr', {'autoload': {'mappings': [['scxino', '<Plug>(altr-']]}} "現在バッファから開くファイルを類推して開く
NeoBundleLazy 'kana/vim-gf-user', {'autoload': {'mappings': [['nv', '<Plug>(gf-user-']]}}
NeoBundleLazy 'sgur/vim-gf-autoload'
NeoBundle 'osyo-manga/vim-automatic', {'depends': 'osyo-manga/vim-gift', 'vim_version': '7.3.895'}
"--------------------------------------
"Bind&Command
"NeoBundleLazy 'kana/vim-arpeggio'
NeoBundleLazy 'kana/vim-submode', {'autoload': {'commands': ['SubmodeRestoreOptions']}}
NeoBundleLazy 'thinca/vim-ambicmd' "コマンド名省入力 ex)NeoBundleUpdate > NBU
NeoBundle 'tyru/vim-altercmd' "コマンドのエイリアスを作る tyru版あり #B9-6
"--------------------------------------
"Info
NeoBundle 'LeafCage/foldCC', {'stay_same': 1}
NeoBundle 'tyru/current-func-info.vim'
NeoBundleLazy 'sgur/vim-gitgutter', {'autoload': {'mappings': [['n', '<Plug>GitGutter']], 'commands': ['GitGutterAll', 'GitGutterToggle', 'GitGutterPrevHunk', 'GitGutterDisable', 'GitGutterLineHighlightsEnable', 'GitGutterNextHunk', 'GitGutterEnable', 'GitGutter', 'GitGutterLineHighlightsToggle', 'GitGutterLineHighlightsDisable']}}
"NeoBundle 'LeafCage/win-shujuukankei.vim'
NeoBundleLazy 'osyo-manga/vim-anzu', {'autoload': {'mappings': '<Plug>(anzu-'}} "検索Hit件数を表示する
NeoBundleLazy 'tacroe/unite-mark', {'autoload': {'unite_sources': ['mark']}}
NeoBundleLazy 'tsukkee/unite-tag', {'autoload': {'unite_sources' : ['tag']}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload': {'unite_sources' : ['help']}}
NeoBundleLazy 'https://github.com/ujihisa/neco-look.git' "要look.exe
"NeoBundleLazy 'h1mesuke/unite-outline', {'autoload': {'unite_sources' : 'outline'}}
NeoBundleLazy 'thinca/vim-prettyprint', {'autoload' : {'commands': 'PP' }}
NeoBundleLazy 'taglist.vim' "ctagsを利用して :Tlistで変数関数定義一覧バッファ作成
NeoBundleLazy 'TagHighlight' "ctagsの情報を利用してハイライト
"NeoBundle 'errormarker.vim'
NeoBundleLazy 'jceb/vim-hier' "quickfixエラー箇所をハイライト
"NeoBundle 'ujihisa/unite-font' "動かない
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources': ['colorscheme']}}
NeoBundleLazy 'pasela/unite-webcolorname', {'autoload': {'unite_sources' : 'webcolorname'}}
NeoBundleLazy 'LeafCage/unite-gvimrgb', {'autoload': {'unite_sources': ['gvimrgb']}, 'stay_same': 1}
NeoBundleLazy 'osyo-manga/unite-highlight', {'autoload': {'unite_sources': ['highlight']}}
NeoBundleLazy 'cocopon/colorswatch.vim', {'autoload': {'commands': ['ColorSwatchGenerate']}}
"--------------------------------------
"GUI
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 't9md/vim-quickhl' "複数の検索ハイライト
NeoBundleLazy 'MultipleSearch' "複数回の検索を可能にして、それぞれの検索結果を違うハイライトで表示する
"NeoBundle 'altercation/vim-colors-solarized' "なんか良いらしいcolorscheme
NeoBundleLazy 'tyru/winmove.vim', {'autoload': {'mappings': ['<Plug>(winmove-']}, 'gui':1}
NeoBundleLazy 'thinca/vim-fontzoom', {'autoload': {'mappings': ['<Plug>(fontzoom-'], 'commands': 'Fontzoom'}}
"--------------------------------------
"Maintenance
"NeoBundle 'thinca/vim-localrc' "特定dir以下に.lvimrcを置くとdir以下のfileだけで設定反映
NeoBundle 'savevers.vim'
"--------------------------------------
"filetype plugin indent on  "ファイル判定をonにする



"=============================================================================
"各種プラグイン設定
"設定用関数
function! s:bundle_tap(bundle) "{{{
  let s:tapped_bundle = neobundle#get(a:bundle)
  return neobundle#is_installed(a:bundle)
endfunction
"}}}
function! s:bundle_config(config) "{{{
  if get(s:, 'tapped_bundle', {}) != {}
    call neobundle#config(s:tapped_bundle.name, a:config)
  endif
endfunction
"}}}
function! s:bundle_untap() "{{{
  let s:tapped_bundle = {}
endfunction
"}}}

"======================================
"Library
let g:uptodate_filenamepatterns = ['lily.vim', 'lib/vimelements.vim']
let g:uptodate_cellardir = $VIMFILES. '/bundle/LCLIB'
autocmd vimrc FuncUndefined lib#*   exe 'source '. g:uptodate_cellardir. '/'. fnamemodify(expand('<afile>'), ':gs?#?/?:h'). '.vim'
if s:bundle_tap('vimproc') "{{{
  call s:bundle_config({'build': {'windows': 'make -f make_mingw32.mak', 'cygwin': 'make -f make_cygwin.mak',
    \ 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak',},})
endif
"}}}

"======================================
"Synthesis
if s:bundle_tap('unite.vim') " {{{
  call s:bundle_config({'autoload': {'commands': [{'name': 'Unite', 'complete': 'customlist,unite#complete_source'},
    \ 'UniteWithCursorWord', 'UniteWithInput']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:unite_data_directory = $VIMSYSTEM. '/.unite'
    let g:unite_split_rule = 'botright'  "窓の表示位置
    let g:unite_winheight = 20 "水平分割時の窓高さ
    let g:unite_enable_start_insert = 0
    let g:unite_source_grep_command = 'jvgrep'  "grepコマンド
    "let g:unite_source_grep_recursive_opt = '-R'
    "let g:unite_source_grep_default_opts = '-Hn'
    "let g:unite_source_find_command = 'find'
    let g:unite_source_history_yank_enable = 1  "unite-history/yankを有効化する（ヤンクしたテキストの履歴）
    let g:unite_kind_jump_list_after_jump_scroll=0
    let g:unite_source_rec_min_cache_files = 1000
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_file_mru_long_limit = 6000
    let g:unite_source_file_mru_limit = 300
    let g:unite_source_directory_mru_long_limit = 6000
    "actionではinsert-modeで始める
    call unite#set_profile('action', 'context', {'start_insert' : 1})

    source $MYVIMRC_SUBSTANCEDIR/unite_setting.vim
  endfunction

  autocmd vimrc FileType unite  wincmd =
  autocmd vimrc BufLeave [\[\*]unite[\]\*]  wincmd =
  "やたら長い変数をechoするとき見やすく表示
  command! -complete=var -nargs=+ UPP  exe 'Unite output:PP\ '. escape(<q-args>, ': ')
  "文字関係
  nnoremap ,dg :<C-u>Unite -buffer-name=register register<CR>
  nnoremap ,dy :<C-u>Unite history/yank<CR>
  xnoremap ,dy d:<C-u>Unite history/yank<CR>
  inoremap <expr><C-y> pumvisible() ? "\<C-y>" : "\<Esc>:Unite -start-insert history/yank\<CR>"
  "file/buf関係
  nnoremap ,dfl :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap ,dff :<C-u>Unite -buffer-name=files file<CR>
  nnoremap ,dfr :<C-u>Unite -buffer-name=files -start-insert file_rec:<C-r>=escape(expand('%:p:h:h'), ': ')<CR><CR>
  nnoremap ,dfs :<C-u>UniteWithBufferDir -buffer-name=files -start-insert buffer file_mru bookmark file<CR>
  nnoremap ,fs :<C-u>UniteWithBufferDir -buffer-name=files -start-insert buffer file_mru bookmark file<CR>
  nnoremap ,dfm :<C-u>Unite -buffer-name=files -start-insert file_mru<CR>
  nnoremap ,fm :<C-u>Unite -buffer-name=files -start-insert file_mru<CR>
  nnoremap ,dp :<C-u>Unite -buffer-name=files -start-insert buffer<CR>
  nnoremap mp :<C-u>Unite -buffer-name=files -start-insert buffer<CR>
  nnoremap ,dv :<C-u>Unite -buffer-name=files buffer_tab<CR>
  nnoremap ,fv :<C-u>Unite -buffer-name=files buffer_tab<CR>
  nnoremap ,da :<C-u>UniteBookmarkAdd<CR>
  nnoremap ,db :<C-u>Unite bookmark<CR>
  "nnoremap ,du :<C-u>Unite buffer_deleted<CR>
  "場所関係
  nnoremap ,dl :<C-u>Unite line -start-insert<CR>
  nnoremap ,djc :<C-u>Unite change<CR>
  nnoremap ,djj :<C-u>Unite jump<CR>
  nnoremap ,dmm :<C-u>Unite mark<CR>
  "let g:unite_source_mark_marks = '`mlkjih".^MLKJIHabcdefgnopqrstuvwxyzABCDEFGNOPQRSTUVWXYZ012'
  let g:unite_source_mark_marks = '`abcdefghijkl".^ABCDEFGHIJKLmnopqrstuvwxyzMNOPQRSTUVWXYZ012'
  nnoremap ,di :<C-u>Unite outline_indent<CR>
  nnoremap ,dia :<C-u>Unite outline_indent:a<CR>
  "autocmd BufEnter *
    \   if empty(&buftype)
    \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
    \|  endif
  "vim関係
  nnoremap ,dmp :<C-u>Unite mapping<CR>
  nnoremap ,dms :<C-u>Unite output:mes<CR>
  nnoremap ,dme :<C-u>Unite output:mes<CR>
  "GUI/CUI関係
  nnoremap ,dxf :<C-u>Unite font<CR>
  nnoremap ,dxw :<C-u>Unite webcolorname<CR>
  "unite関係
  nnoremap ,du :UniteResume<CR>
  nnoremap ,ds :<C-u>Unite source<CR>
  nnoremap ,d@ :<C-u>Unite menu:main<CR>
  nnoremap ,d:m :<C-u>Unite menu:main<CR>
  nnoremap ,d:g :<C-u>Unite menu:git<CR>

  call s:bundle_untap()
endif
"}}}
"--------------------------------------
if s:bundle_tap('ctrlp.vim') " {{{
  call s:bundle_config({'autoload': {'commands': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPLastMode', 'CtrlPRoot', 'CtrlPClearCache', 'CtrlPClearAllCaches']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:ctrlp_prompt_mappings = {}
    let g:ctrlp_prompt_mappings['PrtBS()'] = ['<BS>', '<C-]>', '<C-h>']
    let g:ctrlp_prompt_mappings['PrtCurLeft()'] = ['<Left>', '<C-b>']
    let g:ctrlp_prompt_mappings['PrtCurRight()'] = ['<Right>', '<C-f>']
    let g:ctrlp_prompt_mappings['ToggleType(1)'] = ['<C-l>', '<C-up>']
    let g:ctrlp_prompt_mappings['ToggleType(-1)'] = ['<C-x>', '<C-down>']
    let g:ctrlp_prompt_mappings['AcceptSelection("h")'] = ['<C-CR>', '<C-s>']
    let g:ctrlp_prompt_mappings['PrtExit()'] = ['<Esc>', '<C-c>', '<C-q>']
  endfunction
  autocmd vimrc CursorMoved ControlP  let w:lightline = 0

  nnoremap <silent>,cf :<C-u>CtrlP<CR>
  nnoremap <silent>,cb :<C-u>CtrlPBuffer<CR>
  nnoremap <silent>,cm :<C-u>CtrlPMRU<CR>
  "nnoremap <silent>[C-k]<C-p> :<C-u>CtrlPBuffer<CR>
  "nnoremap <silent>[C-k]<C-h> :<C-u>CtrlPMRU<CR>
  let g:ctrlp_cache_dir = $VIMSYSTEM. '/.ctrlp'
  let g:ctrlp_max_files = 1000
  let g:ctrlp_use_migemo = 1
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_switch_buffer = 'Et'
  let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|vimfiler\|unite\|vimshell'
  let g:ctrlp_root_markers = ['[root]']
  let g:ctrlp_open_new_file = 'h'
    let g:ctrlp_mruf_exclude = '' "mruに追跡したくないfile
  call s:bundle_untap()
endif
"}}}
"--------------------------------------
if s:bundle_tap('vimshell') " {{{
  call s:bundle_config({'autoload': {'commands': [{'name': 'VimShell', 'complete': 'customlist,vimshell#complete'},
    \ 'VimShellExecute', 'VimShellInteractive', 'VimShellTerminal', 'VimShellPop', 'VimShellTab'],
    \ 'mappings': ['<Plug>(vimshell_']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:vimshell_temporary_directory = $VIMSYSTEM. '/.vimshell'
    let g:vimshell_vimshrc_path = $VIMUSERDIR. '/.vimshrc'
    let g:vimshell_split_command = '8split'
    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")' "ユーザプロンプトにカレントディレクトリを表示
    let g:vimshell_split_height = 50
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
    au FileType vimshell  setl nobl
    au FileType vimshell nnoremap <silent> <buffer> q <C-w>c
    au FileType vimshell nnoremap ,db :<C-u>Unite -default-action=cd bookmark<CR>
    au FileType vimshell nnoremap ,dd :<C-u>Unite -default-action=cd directory_mru<CR>
    autocmd FileType vimshell
      \ call vimshell#altercmd#define('g', 'git')
      \| call vimshell#altercmd#define('i', 'iexe')
      \| call vimshell#altercmd#define('l', 'll')
      \| call vimshell#altercmd#define('ll', 'ls -l')
      \| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')
    function! g:my_chpwd(args, context)
      call vimshell#execute('ls')
    endfunction
  endfunction

  noremap <silent>,xs :let A = expand('%:p:h')<Bar> exe 'VimShellTab '. A<Bar>unlet A<CR>
  noremap <silent>,sh :let A = expand('%:p:h')<Bar> exe 'VimShell -split '. A<Bar>unlet A<CR>
  call s:bundle_untap()
endif
"}}}
"--------------------------------------
if s:bundle_tap('vimfiler') "{{{
  call s:bundle_config({'depends': ['Shougo/unite.vim',], 'autoload': {'commands':
    \ [{'name': 'VimFiler', 'complete': 'customlist,vimfiler#complete'},
    \ {'name': 'VimFilerExplorer', 'complete': 'customlist,vimfiler#complete'},
    \ {'name': 'Edit', 'complete': 'customlist,vimfiler#complete'},
    \ {'name': 'Write', 'complete': 'customlist,vimfiler#complete' }, 'Read', 'Source'],
    \ 'mappings': ['<Plug>(vimfiler_'], 'explorer': 1,}})
  let g:vimfiler_data_directory = $VIMSYSTEM. '/.vimfiler'
  let g:vimfiler_as_default_explorer = 1
  let g:unite_kind_file_use_trashbox = 1
  let g:vimfiler_safe_mode_by_default = 0
  "let g:vimfiler_split_rule = 'belowright'
  "let g:vimfiler_detect_drives
  "拡張子関連付け
  "call vimfiler#set_execute_file('vim', 'vim')
  "シンタックス
  "let g:vimfiler_extensions = {'text': '', 'image': '', 'archive': '', 'system': '', 'multimedia': '',}
  function! s:tapped_bundle.hooks.on_source(bundle)
    au FileType vimfiler  setl nobl
    au FileType vimfiler  let b:vimfiler.is_visible_dot_files = 1

    "vf basic-Keymaps "{{{
    let g:vimfiler_no_default_key_mappings = 1
    au FileType vimfiler nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    au FileType vimfiler nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    au FileType vimfiler nmap <buffer> gg <Plug>(vimfiler_cursor_top)
    au FileType vimfiler nmap <buffer> <C-l> <Plug>(vimfiler_redraw_screen)
      au FileType vimfiler nmap <buffer> @ <Plug>(vimfiler_toggle_mark_current_line)
      au FileType vimfiler nmap <buffer> ` <Plug>(vimfiler_toggle_mark_current_line_up)
    au FileType vimfiler nmap <buffer> <C-i> <Plug>(vimfiler_switch_to_other_window)
      au FileType vimfiler nmap <buffer> i <Plug>(vimfiler_switch_to_another_vimfiler)
      au FileType vimfiler nmap <buffer> vv <Plug>(vimfiler_toggle_mark_all_lines)
      au FileType vimfiler nmap <buffer> vu <Plug>(vimfiler_clear_mark_all_lines)
    au FileType vimfiler nmap <buffer> zc <Plug>(vimfiler_copy_file)
    au FileType vimfiler nmap <buffer> zm <Plug>(vimfiler_move_file)
    au FileType vimfiler nmap <buffer> zd <Plug>(vimfiler_delete_file)
    au FileType vimfiler nmap <buffer> r <Plug>(vimfiler_rename_file)
    au FileType vimfiler nmap <buffer> K <Plug>(vimfiler_make_directory)
    au FileType vimfiler nmap <buffer> E <Plug>(vimfiler_new_file)
    au FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_execute)
      "au FileType vimfiler nmap <buffer> <C-j> <Plug>(vimfiler_execute)
    au FileType vimfiler nmap <buffer> l <Plug>(vimfiler_smart_l)
    au FileType vimfiler nmap <buffer> x <Plug>(vimfiler_execute_system_associated)
    au FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_execute_system_associated)
    au FileType vimfiler nmap <buffer> h <Plug>(vimfiler_smart_h)
    au FileType vimfiler nmap <buffer> <BS> <Plug>(vimfiler_switch_to_parent_directory)
    au FileType vimfiler nmap <buffer> L <Plug>(vimfiler_switch_to_drive)
    au FileType vimfiler nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
    au FileType vimfiler nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
      au FileType vimfiler nmap <buffer> <C-h> <Plug>(vimfiler_switch_to_history_directory)
    au FileType vimfiler nmap <buffer> z. <Plug>(vimfiler_toggle_visible_dot_files)
    au FileType vimfiler nmap <buffer> H <Plug>(vimfiler_popup_shell)
    au FileType vimfiler nmap <buffer> ee <Plug>(vimfiler_edit_file)
    "au FileType vimfiler nmap <buffer> E <Plug>(vimfiler_split_edit_file)
      au FileType vimfiler nnoremap <silent><buffer><expr>es   vimfiler#do_action('split')
    au FileType vimfiler nmap <buffer> B <Plug>(vimfiler_edit_binary_file)
      au FileType vimfiler nmap <buffer> er <Plug>(vimfiler_edit_binary_file)
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
      au FileType vimfiler nmap <buffer> . <Plug>(vimfiler_expand_tree)
    au FileType vimfiler nmap <buffer> T <Plug>(vimfiler_expand_tree_recursive)
    au FileType vimfiler nmap <buffer> I <Plug>(vimfiler_cd_input_directory)
      au FileType vimfiler vmap <buffer> @ <Plug>(vimfiler_toggle_mark_selected_lines)
    "}}}
      au FileType vimfiler nnoremap <silent><buffer><expr>eb   vimfiler#do_action('vsplit')
      au FileType vimfiler nnoremap <silent><buffer><expr>ev   vimfiler#do_action('tabopen')
      au FileType vimfiler nnoremap <silent>,db :<C-u>Unite -default-action=vimfiler bookmark<CR>
      au FileType vimfiler nnoremap <silent>,dd :<C-u>Unite -default-action=vimfiler directory_mru<CR>
  endfunction

  nnoremap ,ff :VimFiler -split -horizontal -reverse<CR>
  nnoremap ,fj :VimFiler -split -winwidth=24 -simple -reverse -explorer <C-r>=<SID>get_prj_root()<CR><CR>
  nnoremap ,fov :VimFiler -split -horizontal -reverse $VIMFILES<CR>
  nnoremap ,fr :<C-u>Unite -buffer-name=files -start-insert file_rec:<C-r>=escape(<SID>get_prj_root(), ': ')<CR><CR>
  nnoremap ,fl :VimFilerBufferDir -split -horizontal -reverse<CR>
  nnoremap ,fb :Unite -default-action=vimfiler bookmark<CR>
  nnoremap ,fd :Unite -default-action=vimfiler directory_mru<CR>
  "nnoremap <silent>,xf :<C-u>call vimfiler#switch_filer(join([expand('%:p:h')]), {'split': 1, 'double': 1, 'horizontal': 1})<CR>
  function! s:get_prj_root() "{{{
    let prjRootPath = finddir('.git', expand('%:p:h').';')
    if empty(prjRootPath)
      return expand('%:p:h:h')
    endif
    return fnamemodify(prjRootPath, ':h')
  endfunction
  "}}}
  call s:bundle_untap()
endif
"}}}

"======================================
"Network&Documents
if s:bundle_tap('open-browser.vim') "{{{
  call s:bundle_config({'autoload': {'mappings': ['<Plug>(openbrowser-'], 'commands':
    \ ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch']}})
  nmap ,xo <Plug>(openbrowser-smart-search)
  vmap ,xo <Plug>(openbrowser-smart-search)
  nmap <C-CR> <Plug>(openbrowser-smart-search)
  vmap <C-CR> <Plug>(openbrowser-smart-search)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-ref') "{{{
  call s:bundle_config({'autoload': {'commands': [{'name': 'Ref', 'complete': 'customlist,ref#complete'}, 'RefHistory'],
    \ 'mappings': ['<Plug>(ref-']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:ref_cache_dir = $VIMSYSTEM. '/.vim_ref_cache'
    let g:ref_phpmanual_path = 'D:/dic/vim-ref/php-chunked-xhtml'
    let g:ref_javadoc_path = 'D:/dic/vim-ref/java6api'
    let g:ref_javadoc_cmd = 'lynx -dump -width=120 -nonumbers %s'
    au FileType ref-* nnoremap <silent><buffer>   q   :close<CR>
    "webdictサイトの設定
    let g:ref_source_webdict_sites = {}
    let g:ref_source_webdict_sites.je = {'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',}
    "let g:ref_source_webdict_sites.ej = {'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',}
    let g:ref_source_webdict_sites.alc = {'url': 'http://eow.alc.co.jp/%s', 'keyword_encoding': 'utf-8', 'cache': '0',}
    let g:ref_source_webdict_sites.kok = {'url': 'http://dictionary.infoseek.ne.jp/word/%s?dic=daijisen',}
    let g:ref_source_webdict_sites.wip = {'url': 'http://ja.wikipedia.org/wiki/%s',}
    let g:ref_source_webdict_sites.default = 'ej'
    let g:ref_source_webdict_encoding = 'cp932'
    "出力に対するフィルタ。最初の数行を削除
    function! g:ref_source_webdict_sites.je.filter(output)
      return join(split(a:output, "\n")[15 :], "\n")
    endfunction
    "function! g:ref_source_webdict_sites.ej.filter(output)
    "return join(split(a:output, "\n")[15 :], "\n")
    "endfunction
    function! g:ref_source_webdict_sites.alc.filter(output)
      return join(split(a:output, "\n")[37 :], "\n")
    endfunction
    function! g:ref_source_webdict_sites.kok.filter(output)
      return join(split(a:output, "\n")[15 :], "\n")
    endfunction
    function! g:ref_source_webdict_sites.wip.filter(output)
      return join(split(a:output, "\n")[17 :], "\n")
    endfunction
  endfunction
  nnoremap gx <Nop>
  nnoremap gxh :<C-u>Ref webdict ej <C-r><C-w>
  nnoremap gxj :<C-u>Ref webdict je <C-r><C-w>
  nnoremap gxk :<C-u>Ref webdict kok <C-r><C-w>
  nnoremap gxa :<C-u>Ref webdict alc <C-r><C-w>
  nnoremap gxw :<C-u>Ref webdict wip <C-r><C-w>
endif
"}}}
"--------------------------------------
if s:bundle_tap('J6uil.vim') "{{{
  call s:bundle_config({'autoload': {'unite_sources': ['J6uil_members', 'J6uil_rooms'], 'mappings': [['n', '<Plug>(J6uil_']], 'commands': ['J6uilReconnect', 'J6uilDisconnect', {'complete': 'custom,J6uil#complete#room', 'name': 'J6uil'}]}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    autocmd FileType J6uil  :call s:J6uil_settings(expand('<abuf>'))
    autocmd FileType J6uil_say  :nunmap <buffer><C-j>| nmap <silent><buffer>q   :<C-u>bd!<CR>
    let g:J6uil_config_dir = $VIMSYSTEM. '/.J6uil'
  endfunction
  function! s:J6uil_settings(bufnr)
    nmap <silent><buffer>q   :<C-u>bd!<CR>
    nmap <silent><buffer>dc   <Plug>(J6uil_disconnect)
    nmap <silent><buffer>r   <Plug>(J6uil_reconnect)
    let s:bufnr = str2nr(a:bufnr)
    noremap ,xj :<C-u>exe 'e' s:bufnr<CR>
    autocmd VimLeavePre *   :if bufexists(s:bufnr)| exe 'bd '. s:bufnr| endif
  endfunction
  noremap ,xj :<C-u>J6uil<CR>
endif
"}}}

"======================================
"Development
if s:bundle_tap('vim-fugitive') "{{{
  function! s:tapped_bundle.hooks.on_post_source(bundle)
    doautoall fugitive BufNewFile
  endfunction
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-quickrun') "{{{
  call s:bundle_config({})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:quickrun_config = {}
    let g:quickrun_config.markdown = {'type': 'markdown/kramdown', 'cmdopt': '-s', 'outputter': 'browser'}
  endfunction

  nmap ,xq <Plug>(quickrun)
  call s:bundle_untap()
endif
"}}}
"--------------------------------------
if s:bundle_tap('vimtest') "{{{
  call s:bundle_config({'autoload': {'commands': [{'name': 'VimTest', 'complete': 'file'},
  \ {'name': 'VimTestBuffer', 'complete': 'file'}, {'name': 'VimTestStdout', 'complete': 'file'},
  \ {'name': 'VimTestQuickfix', 'complete': 'file'}]}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:vimtest_config = {}
    "let g:vimtest_config.outputter = 'stdout' "cmdline
    let g:vimtest_config.outputter = 'buffer'
  endfunction
  autocmd StdinReadPost,BufWinEnter *_test.vim    nnoremap <buffer>,t :<C-u>VimTest<CR>
endif
"}}}
"--------------------------------------
if s:bundle_tap('vimhelpgenerator') "{{{
  call s:bundle_config({'autoload': {'commands': ['VimHelpGenerator', 'VimHelpGeneratorVirtual']}, 'stay_same': 1})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:vimhelpgenerator_version = ''
    let g:vimhelpgenerator_author = 'Author  : LeafCage <leafcage+vim @ gmail.com>'
    let g:vimhelpgenerator_contents = {'contents': 1, 'introduction': 1, 'usage': 1, 'interface': 1, 'variables': 1, 'commands': 1, 'key-mappings': 1, 'functions': 1, 'todo': 1, 'changelog': 0,}
    let g:vimhelpgenerator_uri = 'https://github.com/LeafCage/'
  endfunction
endif
"}}}

"======================================
"Insert
if s:bundle_tap('neocomplecache') "{{{
  call s:bundle_config({'autoload': 'insert': 1})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:neocomplcache_temporary_dir = $VIMSYSTEM. '/.neocon'
    let g:neocomplcache_dictionary_filetype_lists = {}
    let g:neocomplcache_dictionary_filetype_lists.default = ''
    let g:neocomplcache_dictionary_filetype_lists.vim = $VIMUSERDIR. '/.neocon_dict/vim.dict'
    let g:neocomplcache_dictionary_filetype_lists.java = $VIMUSERDIR. '/.neocon_dict/java.dict'
    "let g:neocomplcache_dictionary_filetype_lists.vimshell = $HOME.'/.vimshell_hist'
    let g:neocomplcache_dictionary_filetype_lists.scheme = $HOME.'/.gosh_completions'
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
    let g:neocomplcache_keyword_patterns = get(g:, 'neocomplecache_keyword_patterns', {})
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "単語のヘッド\単語を構成する文字（数字やアルファベット）*
    "let g:neocomplcache_keyword_patterns['sfd'] = '\c\[:\%(\h\w*:\]\)\?\| &\h[[:alnum:]_:]*\| \$\h\w*\|-\h\w*=\?\| <SID>\%(\h\w*(\?\)\?\| <Plug>([^)]*)\?\| <\h[[:alnum:]_-]*>\?\| \h[[:alnum:]_:#]*\%(!\| ()\?\)\?\| `\h\w*'
  endfunction

  "Vim標準の補完をネオコンに置き換える
  inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
  inoremap <expr><C-x><C-o>  neocomplcache#manual_omni_complete()
  "inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()

  "候補の共通箇所まで補完する
  inoremap <expr><C-l>  neocomplcache#complete_common_string()
  "決定してポップアップを閉じる
  "inoremap <expr><C-j>  pumvisible() ? neocomplcache#close_popup() : "\<C-j>"
  "キャンセルしてポップアップを閉じる
  inoremap <expr><C-e>  pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
  "inoremap <expr><C-q>  neocomplcache#cancel_popup()
  "inoremap <expr><C-y>  eocomplcache#cancel_popup()
  "ネオコンによって挿入した補完を元に戻す
  inoremap <expr><C-\>     neocomplcache#undo_completion()
endif
"}}}
"--------------------------------------
if s:bundle_tap('neosnippet') "{{{
  call s:bundle_config({'autoload': {'mappings': [['isx', '<Plug>(neosnippet_']], 'commands': ['NeoSnippetMakeCache, NeoSnippetEdit', 'NeoSnippetSource']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:neosnippet#snippets_directory = $VIMUSERDIR. '/snippets'
    au FileType snippet  setl nobl
    au FileType snippet setl nofoldenable
    au FileType snippet  noremap <buffer>q <C-w>q
    au FileType snippet  inoremap <buffer><C-q> ${}<Left>
  endfunction

  au BufLeave *.snip setl nobl
  imap <C-s>  <Plug>(neosnippet_expand_or_jump)
  smap <C-s>  <Plug>(neosnippet_expand_or_jump)
  xmap <C-s>  <Plug>(neosnippet_expand_target)
  "スニペットを編集する
  nmap cos <SID>o_snip
  nmap ,os <SID>o_snip
  nnoremap <SID>o_snip :NeoSnippetEdit -split -horizontal -direction=aboveleft<CR>
  nmap coS <SID>o_Snip
  nmap ,oS <SID>o_Snip
  nnoremap <SID>o_Snip :NeoSnippetEdit -runtime -split -horizontal -direction=aboveleft<CR>
  nmap cors <SID>o_rsnip
  nmap ,ors <SID>o_rsnip
  nnoremap <SID>o_rsnip :NeoSnippetEdit -runtime -split -horizontal -direction=aboveleft<CR>

  nmap coas <SID>a_snip
  nmap ,oas <SID>a_snip
  nnoremap <SID>a_snip :NeoSnippetEdit -split -horizontal -direction=aboveleft _<CR>
  nmap coaS <SID>a_Snip
  nmap ,oaS <SID>a_Snip
  nnoremap <SID>a_Snip :NeoSnippetEdit -runtime -split -horizontal -direction=aboveleft _<CR>
endif
"}}}
"--------------------------------------
if s:bundle_tap('nerdcommenter') "{{{
  call s:bundle_config({})
  function! s:tapped_bundle.hooks.on_post_source(bundle)
    doautocmd NERDCommenter BufEnter
  endfunction
  nmap gc [cm]
  vmap gc [cm]
  nmap [cm]c <Plug>NERDCommenterToggle
  vmap [cm]c <Plug>NERDCommenterToggle
  nmap [cm]a <Plug>NERDCommenterAppend
  nmap [cm]9 <Plug>NERDCommenterToEOL
  vmap [cm]x <Plug>NERDCommenterSexy
  vmap [cm]b <Plug>NERDCommenterMinimal
endif
"}}}
"--------------------------------------
if s:bundle_tap('nebula.vim') "{{{
  nnoremap <silent>,bl    :<C-u>NebulaPutLazy<CR>
  nnoremap <silent>,bc    :<C-u>NebulaPutConfig<CR>
  nnoremap <silent>,by    :<C-u>NebulaYankOptions<CR>
  nnoremap <silent>,bp    :<C-u>NebulaPutFromClipboard<CR>
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-operator-replace') "{{{
  call s:bundle_config({'depends': 'vim-operator-user', 'autoload': {'mappings': ['<Plug>(operator-replace)']}})
  nmap yr   <Plug>(operator-replace)
  nmap cr   <Plug>(operator-replace)
  nmap cy   <Plug>(operator-replace)
  vmap P   <Plug>(operator-replace)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-textobj-user') "{{{
  call s:bundle_config({'autoload': {'mappings': [['xo', '<Plug>(textobj-piece']]}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    call textobj#user#plugin('cword', {'-': {'*pattern*': '\k*\%#\k*', 'select': ['*',], }, })
    let textobj_star = {'select-a': 'a*', 'select-i': 'i*',
      \ '*select-a-function*': 's:Textobj_star_a', '*select-i-function*': 's:Textobj_star_i', '*sfile*': expand('<sfile>')}
    let textobj_bar = {'select-a': 'a<Bar>', 'select-i': 'i<Bar>',
      \ '*select-a-function*': 's:Textobj_bar_a', '*select-i-function*': 's:Textobj_bar_i', '*sfile*': expand('<sfile>')}
    let textobj_dot = {'select-a': 'a..', 'select-i': 'i..',
      \ '*select-a-function*': 's:Textobj_dot_a', '*select-i-function*': 's:Textobj_dot_i', '*sfile*': expand('<sfile>')}
    call textobj#user#plugin('piece', {'star': textobj_star, 'bar': textobj_bar, 'dot': textobj_dot})
  endfunction
  let g:textobj_piece_no_default_key_mappings = 1
  xmap i* <Plug>(textobj-piece-star-i)
  xmap a* <Plug>(textobj-piece-star-a)
  omap i* <Plug>(textobj-piece-star-i)
  omap a* <Plug>(textobj-piece-star-a)
  xmap i<Bar> <Plug>(textobj-piece-bar-i)
  xmap a<Bar> <Plug>(textobj-piece-bar-a)
  omap i<Bar> <Plug>(textobj-piece-bar-i)
  omap a<Bar> <Plug>(textobj-piece-bar-a)
  xmap i.. <Plug>(textobj-piece-dot-i)
  xmap a.. <Plug>(textobj-piece-dot-a)
  omap i.. <Plug>(textobj-piece-dot-i)
  omap a.. <Plug>(textobj-piece-dot-a)

  function! s:Textobj_star_a() "{{{
    return s:_textobj_piece('*', 'a')
  endfunction
  "}}}
  function! s:Textobj_star_i() "{{{
    return s:_textobj_piece('*', 'i')
  endfunction
  "}}}
  function! s:Textobj_bar_a() "{{{
    return s:_textobj_piece('|', 'a')
  endfunction
  "}}}
  function! s:Textobj_bar_i() "{{{
    return s:_textobj_piece('|', 'i')
  endfunction
  "}}}
  function! s:Textobj_dot_a() "{{{
    return s:_textobj_piece('.', 'a')
  endfunction
  "}}}
  function! s:Textobj_dot_i() "{{{
    return s:_textobj_piece('.', 'i')
  endfunction
  "}}}
  function! s:_textobj_piece(char, i6a) "{{{
    let save_view = winsaveview()
    let crrline = line('.')
    if a:i6a == 'i'
      "charの後のcharじゃないものを探す
      let _match_b = search('\M'. a:char.'\[^'.a:char .']', 'bce', crrline)
    else
      let _match_b = search('\M'. a:char, 'bce', crrline)
    endif
    let bgn = getpos('.')

    if a:i6a == 'i'
      let _match_e = search('\M\[^'. a:char .']\ze'. a:char, '', crrline)
    else
      let _match_e = search('\M'. a:char, '', crrline)
    endif
    let end = getpos('.')

    if _match_b==0 || _match_e==0 || len(a:char)>1
      return
    endif
    call winrestview(save_view)
    return ['v', bgn, end]
  endfunction
  "}}}
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-textovj-wiw') "{{{
  let g:textobj_wiw_no_default_key_mappings = 1
  xmap aw <Plug>(textobj-wiw-a)
  xmap iw <Plug>(textobj-wiw-i)
  omap aw <Plug>(textobj-wiw-a)
  omap iw <Plug>(textobj-wiw-i)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-textovj-plugins') "between {{{
  let g:textobj_between_no_default_key_mappings = 1
  xmap ag <Plug>(textobj-between-a)
  xmap ig <Plug>(textobj-between-i)
  omap ag <Plug>(textobj-between-a)
  omap ig <Plug>(textobj-between-i)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-textovj-parameter') "{{{
  let g:textobj_parameter_no_default_key_mappings = 1
  xmap a8 <Plug>(textobj-parameter-a)
  xmap i8 <Plug>(textobj-parameter-i)
  omap a8 <Plug>(textobj-parameter-a)
  omap i8 <Plug>(textobj-parameter-i)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-textobj-multiblock') "{{{
  let g:textobj_multiblock_no_default_key_mappings = 1
  omap ab <Plug>(textobj-multiblock-a)
  omap ib <Plug>(textobj-multiblock-i)
  vmap ab <Plug>(textobj-multiblock-a)
  vmap ib <Plug>(textobj-multiblock-i)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-surround') "{{{
  call s:bundle_config({'autoload': {'mappings': ['<Plug>Ysurround', '<Plug>Csurround', '<Plug>Ygsurround', '<Plug>Dsurround', ['i', '<Plug>ISurround'], ['sx', '<Plug>VgSurround'], ['sx', '<Plug>Vsurround'], '<Plug>SurroundRepeat', '<Plug>Yssurround', ['i', '<Plug>Isurround'], ['sx', '<Plug>Vgsurround'], '<Plug>Ygssurround', ['sx', '<Plug>VSurround']]}})
  function! s:tapped_bundle.hooks.on_source(bundle)
    let g:surround_no_mappings = 1
  endfunction
  nmap      ds   <Plug>Dsurround
  nmap      cs   <Plug>Csurround
  xmap      s    <Plug>Vsurround
  nmap      ys   <Plug>Ysurround
  nmap      yS   <Plug>Ygsurround
  nmap      yss  <Plug>Yssurround
  nmap      ysys  <Plug>Yssurround
  nmap      ySs  <Plug>Ygssurround
  nmap      ySS  <Plug>Ygssurround
endif
"}}}

"======================================
"Moving
runtime macros/matchit.vim
let b:match_ignorecase = 1
let b:batch_words = &matchpairs . ",\<if\>:\<endif\>"
"--------------------------------------
if s:bundle_tap('vim-smartword') "{{{
  map w <Plug>(smartword-w)
  map b <Plug>(smartword-b)
  map e <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)
endif
"}}}
"--------------------------------------
if s:bundle_tap('jasegment.vim') "{{{
  call s:bundle_config({'autoload': {'mappings': [['sxno', '<Plug>JaSegment']], 'commands': ['JaSegmentSplit']}})
endif
"}}}
"--------------------------------------
if s:bundle_tap('CamelCaseMotion') "{{{
  map <silent> mw <Plug>CamelCaseMotion_w
  map <silent> mb <Plug>CamelCaseMotion_b
  map <silent> me <Plug>CamelCaseMotion_e
  nmap <silent> mx <Plug>CamelCaseMotion_w
  nmap <silent> mr <Plug>CamelCaseMotion_b
  "nmap <silent> mc <Plug>CamelCaseMotion_e
  omap <silent> x <Plug>CamelCaseMotion_w
  omap <silent> r <Plug>CamelCaseMotion_b
  omap <silent> c <Plug>CamelCaseMotion_e
  nmap <silent> cd c<Plug>CamelCaseMotion_ie
  "omap <silent> e <Plug>CamelCaseMotion_ie
  "テキストオブジェクトに対応させる
  "omap <silent> ib <Plug>CamelCaseMotion_ib
  "vmap <silent> ib <Plug>CamelCaseMotion_ib
  omap <silent> ie <Plug>CamelCaseMotion_ie
  vmap <silent> ie <Plug>CamelCaseMotion_ie
endif
"}}}
"--------------------------------------
if s:bundle_tap('columnjump') "{{{
  nmap <expr>gj   &wrap && winwidth(0) < col('$') ? "\<SID>j" : "\<Plug>(columnjump-forward)"
  nmap <expr>gk   &wrap && winwidth(0) < col('$') ? "\<SID>k" : "\<Plug>(columnjump-backward)"
  vmap <expr>gj   &wrap && winwidth(0) < col('$') ? "\<SID>j" : "\<Plug>(columnjump-forward)"
  vmap <expr>gk   &wrap && winwidth(0) < col('$') ? "\<SID>k" : "\<Plug>(columnjump-backward)"
  nnoremap <SID>j j
  vnoremap <SID>j j
  nnoremap <SID>k k
  vnoremap <SID>k k
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-poslist') "{{{
  call s:bundle_config({})
  function! s:tapped_bundle.hooks.on_source(bundle)
  endfunction
  nmap <M-o> <Plug>(poslist-prev-pos)
  nmap <M-i> <Plug>(poslist-next-pos)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-visualstar') "{{{
  noremap <SID>put_searchstart_sign  :<C-u>call <SID>put_searchstart_sign(0)<CR>
  "nmap <silent>* <Plug>(visualstar-*)N<SID>put_searchstart_sign
  vmap <silent>* <Plug>(visualstar-*)N<SID>put_searchstart_sign
  "map # <Plug>(visualstar-#)N:<C-u>sign unplace 333<CR>
endif
"}}}

"======================================
"Writing
"syster.vim
let g:Syster_dir = $BASEDIR. '/syster'

"======================================
"Buffer&Win&Tabpage
"lastbuf
let g:lastbuf_level= 2
exe 'noremap <silent>'. s:bind.win. 'u :LastBuf<CR>'
"--------------------------------------
if s:bundle_tap('vim-gf-user') "{{{
  function! s:tapped_bundle.hooks.on_post_source(bundle)
    NeoBundleSource vim-gf-autoload
  endfunction
  let g:gf_user_no_default_key_mappings = 1
  nmap gf   <Plug>(gf-user-gf)
  vmap gf   <Plug>(gf-user-gf)
  nmap gF   <Plug>(gf-user-gF)
  vmap gF   <Plug>(gf-user-gF)
  nmap <C-w>f   <Plug>(gf-user-<C-w>f)
  vmap <C-w>f   <Plug>(gf-user-<C-w>f)
  nmap <C-w>F   <Plug>(gf-user-<C-w>F)
  vmap <C-w>F   <Plug>(gf-user-<C-w>F)
  nmap <C-w>gf   <Plug>(gf-user-<C-w>gf)
  vmap <C-w>gf   <Plug>(gf-user-<C-w>gf)
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-automatic') "{{{
  let g:automatic_config = [{'match': {'bufname': '[\[\*]unite[\]\*]', 'any_unite_sources': ['quickfix']}, 'set': {'height': '30%'}}]
endif
"}}}

"======================================
"Bind&Command
"if s:bundle_tap('vim-arpeggio') "{{{
  "let g:arpeggio_timeoutlen = 80
  "call arpeggio#load()
  "call arpeggio#map('nicv', '', 0, 'fj', '<Esc>')
"endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-ambicmd') "{{{
  "cnoremap <expr> <C-l>   getcmdtype()==':' && getcmdpos()==1 ? 'let ' : ambicmd#expand("\<Right>")
  cnoremap <expr><C-n>    ambicmd#expand("\<C-n>")
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-submode') "{{{
  let g:submode_timeoutlen = 5000

  "; ,
  call submode#enter_with('nextChar', 'nv', '', 'z;', ';')
  call submode#enter_with('nextChar', 'nv', '', 'z,,', ',')
  call submode#leave_with('nextChar', 'nv', '', 'z')
  call submode#map('nextChar', 'nv', '', ';', ';')
  call submode#map('nextChar', 'nv', '', ',', ',')

  "Fontzoom
  let g:fontzoom_no_default_key_mappings = 1
  call submode#enter_with('fontzoom', 'n', 'r', ',+', '<Plug>(fontzoom-larger)')
  call submode#enter_with('fontzoom', 'n', 'r', ',-', '<Plug>(fontzoom-smaller)')
  call submode#map('fontzoom', 'n', 'r', '+', '<Plug>(fontzoom-larger)')
  call submode#map('fontzoom', 'n', 'r', '-', '<Plug>(fontzoom-smaller)')

  "winmove
  ",zwmでgui窓を動かす
  let [g:wm_move_down, g:wm_move_up, g:wm_move_left, g:wm_move_right] = ['', '', '', '']
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

  ",zwsで窓の高さ調整
  call submode#enter_with('win-size', 'n', '', ',zws', '<Nop>')
  call submode#enter_with('win-size', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('win-size', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('win-size', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('win-size', 'n', '', '<C-w>-', '<C-w>-')
  call submode#leave_with('win-size', 'n', '', '<Esc>')
  call submode#map('win-size', 'n', '', '+', '<C-w>+')
  call submode#map('win-size', 'n', '', '-', '<C-w>-')
  call submode#map('win-size', 'n', '', '<', '<C-w><')
  call submode#map('win-size', 'n', '', '>', '<C-w>>')
  call submode#map('win-size', 'n', 'x', '=', '<C-w>=')
  "変更リストブラウズ
  call submode#enter_with('changelist', 'n', '', 'g,', 'g,zv')
  "call submode#enter_with('changelist', 'n', '', 'g;', 'g;zv')
  call submode#leave_with('changelist', 'n', '', '<Esc>')
  call submode#map('changelist', 'n', '', ',', 'g,zv')
  call submode#map('changelist', 'n', '', ';', 'g;zv')
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-altercmd') "{{{
  call altercmd#load()
  "neobundle
  AlterCommand nb   Unite neobundle
  AlterCommand nbi  Unite neobundle/install
  AlterCommand nbu  Unite neobundle/update<C-r>=Eat_whitespace('\s')<CR>
  AlterCommand nbl[g]   Unite neobundle/log
  AlterCommand nbus   Unite neobundle/install:unite.vim:vimshell:vimfiler:vimproc:neobundle:neocomplcache:neosnippet
  AlterCommand nbum   Unite neobundle/install:vim-quickrun:vital.vim:open-browser.vim:vim-submode:vim-surround:vimtest:vim-fugitive:vim-anzu:lightline.vim
  AlterCommand nbls NeoBundleList
  AlterCommand nbc NeoBundleClean
  command! -nargs=0 NeoBundleUpdateShougo
    \ NeoBundleUpdate
    \ unite.vim vimshell vimfiler vimproc neobundle.vim neocomplcache neosnippet
  command! -nargs=0 NeoBundleUpdateMain
    \ NeoBundleUpdate
    \ vim-quickrun vital.vim open-browser.vim vim-submode vim-surround CamelCaseMotion

  "unite.vim
  AlterCommand u[nite] Unite
  AlterCommand ua Unite -auto-preview
  AlterCommand una Unite -auto-preview
  AlterCommand unp Unite -auto-preview
  AlterCommand upp UPP

  "ref.vim
  AlterCommand zh  Ref webdict ej
  AlterCommand zj  Ref webdict je
  AlterCommand zk  Ref webdict kok
  AlterCommand za  Ref webdict alc
  AlterCommand zw  Ref webdict wip
  AlterCommand zv  Ref javadoc

  AlterCommand gi[t]     Git
  AlterCommand gir  Git remote add origin git@github.com:LeafCage/.git<Left><Left><Left><Left>
  AlterCommand c[tags]  !start ctags %
  AlterCommand vit[alize]     Vitalize <C-r>=expand('%:p:h:h')<CR>
  AlterCommand sf     setf
  AlterCommand ft     setf
  AlterCommand so     so %
  AlterCommand me    mes
  AlterCommand rv source $MYVIMRC
  AlterCommand fl    h function-list
  AlterCommand h41    h function-list
  AlterCommand ja[va]     !java
  AlterCommand jc   !javac -d ../classes
endif
"}}}

"======================================
"Info
if s:bundle_tap('foldCC') "{{{
  set fdt =FoldCCtext()
  let g:foldCCtext_tail = 'v:foldend-v:foldstart+1'
  let g:foldCCtext_enable_autofdc_adjuster = 1
  let g:foldCCnavi_maxchars = 30
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-anzu') "{{{
  let g:anzu_status_format = '%p(%i/%l) %#WarningMsg#%w'
  let g:anzu_no_match_word = '%#ErrorMsg#E486: Pattern not found: %p'
  nmap n <Plug>(anzu-n-with-echo)zv
  nmap N <Plug>(anzu-N-with-echo)zv
  nmap * <Plug>(anzu-star-with-echo)Nzz
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-hier') "{{{
  " ハイライトの設定
  execute "highlight ucurl_my gui=undercurl guisp=Red"
  let g:hier_highlight_group_qf = "ucurl_my"
  " ハイライト箇所を更新
  "nnoremap <Space>hiu :HierUpdate<CR>
  " ハイライトを削除
  "nnoremap <Space>hic :HierClear<CR>
endif
"}}}

"======================================
"GUI
if s:bundle_tap('lightline.vim') "{{{
  command! -bar LightlineUpdate    call lightline#init()| call lightline#colorscheme()| call lightline#update()
  let g:lightline = {'subseparator': {'left': '', 'right': ''}, 'tabline_subseparator': {'left': '|', 'right': ''}}
  let g:lightline.tabline = {'right': [['rows'], ['cd'], ['fugitive', 'tabstop']]}
  let g:lightline.tab = {'active': ['prefix', 'filename']}
  let g:lightline.tab.inactive = g:lightline.tab.active
  let g:lightline.active = {}
  let g:lightline.inactive = {}
  let g:lightline.active.left = [['winbufnum'], ['dir'], ['filename'], ['filetype', 'readonly', 'modified'], ['currentfuncrow']]
  let g:lightline.active.right = [['lineinfo'], ['percent'], ['fileformat', 'fileencoding'], ['cfi']]
  let g:lightline.inactive.left = [['winbufnum'], ['dir'], ['filename'], ['filetype', 'readonly', 'modified']]
  let g:lightline.inactive.right = [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]

  let g:lightline.component = {'dir': '%.35(%{expand("%:h:s?\\S$?\\0/?")}%)', 'winbufnum': '%n%{repeat(",", winnr())}%<', 'rows': '%L', 'cd': '%.35(%{fnamemodify(getcwd(), ":~")}%)','tabstop': '%{&et?"et":""}%{&ts}:%{&sw}:%{&sts},%{&tw}', 'lineinfo': '%3l:%-3v'}
  let g:lightline.component_function = {'fugitive': 'StlFugitive', 'cfi': 'StlCurrentFuncInfo', 'currentfuncrow': 'StlCurrentFuncRow', 'anzu': 'anzu#search_status'}
  function! StlFugitive() "{{{
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
      endif
    endtry
    return ''
  endfunction
  "}}}
  function! StlCurrentFuncInfo() "{{{
    try
      return cfi#format('%.43s()', '')
    endtry
    return ''
  endfunction
  "}}}
  function! StlCurrentFuncRow() "{{{
    let funcbgn = search('^\s*\<fu\%[nction]\>', 'bcnW', search('^\s*\<endf\%[unction]\>', 'bcnW'))
    if funcbgn > 0
      let row = line('.') - funcbgn
      return row ? row : ''
    endif
    return ''
  endfunction
  "}}}
  let g:lightline.tab_component_function = {'prefix': 'TalPrefix', 'filename': 'TalFilename'}
  function! TalPrefix(n) "{{{
    return lightline#tab#tabnum(a:n). TalTabwins(a:n)
  endfunction
  "}}}
  function! TalTabwins(n) "{{{
    return repeat(',', len(tabpagebuflist(a:n)))
  endfunction
  "}}}
  function! TalFilename(n) "{{{
    return TalBufnum(a:n). '-'. substitute(lightline#tab#filename(a:n), '.\{16}\zs.\{-}\(\.\w\+\)\?$', '~\1', '')
  endfunction
  "}}}
  function! TalBufnum(n) "{{{
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return buflist[winnr - 1]
  endfunction
  "}}}

  let g:lightline.colorscheme = 'lclightline'
  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'visual': {}, 'tabline': {}}
  let s:p.inactive.middle = [['black', 'Gray80', 16, 0]]
  let s:p.inactive.left = [s:p.inactive.middle[0], ['black', 'azure', 16, 0], ['black', 'MistyRose', 16, 0], ['white', 'SlateGray', 231, 0], ['black', 'azure', 16, 0]]
  let s:p.inactive.right = [['black', 'NavajoWhite1', 16, 0], ['black', 'MistyRose', 16, 0], ['white', 'SlateGray', 231, 0], ['black', 'azure', 16, 0]]
  let s:p.normal.middle = s:p.inactive.middle
  let s:p.normal.left = map(deepcopy(s:p.inactive.left), 'extend(v:val, ["bold"])')
  let s:p.normal.right = map(deepcopy(s:p.inactive.right), 'extend(v:val, ["bold"])')
  let s:p.insert.middle = [['black', 'DarkKhaki', 16, 0, 'bold']]
  let s:p.insert.left = [s:p.insert.middle[0], ['black', 'LightSkyBlue1', 16, 0, 'bold'], ['black', 'RosyBrown1', 16, 0, 'bold'], ['white', 'SlateGray', 231, 0, 'bold'], ['black', 'LightSkyBlue1', 16, 0, 'bold']]
  let s:p.insert.right = [s:p.insert.middle[0], ['black', 'RosyBrown1', 16, 0, 'bold'], ['white', 'SlateGray', 231, 0, 'bold'], ['black', 'LightSkyBlue1', 16, 0, 'bold']]
  "let s:p.visual.middle = [['black', 'thistle3', 0, 0, 'bold']]
  let s:p.visual.middle = [['white', 'darkslateblue', 231, 0, 'bold']]
  let s:p.visual.middle = [['white', 'mediumpurple4', 231, 0, 'bold']]
  let s:p.visual.middle = [['black', 'thistle2', 16, 0, 'bold']]
  let s:p.visual.left = deepcopy(s:p.insert.left)
  let s:p.visual.left[0] = s:p.visual.middle[0]
  let s:p.visual.right = deepcopy(s:p.insert.right)
  let s:p.visual.right[0] = s:p.visual.middle[0]
  let s:p.tabline.middle = [['black', 'gray', 16, 0]]
  let s:p.tabline.left = [['black', 'gray60', 16, 0]]
  let s:p.tabline.tabsel = [['white', '#002451', 231, 17, 'underline']]
  let s:p.tabline.right = [['black', 'Gray80', 16, 0], ['white', '#002451', 231, 17], ['black', 'DarkGray', 16, 0]]
  let g:lightline#colorscheme#lclightline#palette = s:p
  unlet s:p
endif
"}}}
"--------------------------------------
if s:bundle_tap('vim-quickhl') "{{{
  call s:bundle_config({'autoload': {'mappings': ['<Plug>(quickhl-'], 'commands':
    \ ['QuickhlList', 'QuickhlReset', 'QuickhlDump', 'QuickhlColors', 'QuickhlReloadColors', 'QuickhlAdd', 'QuickhlLock', 'QuickhlMatch']}})
  function! s:tapped_bundle.hooks.on_source(bundle)
  endfunction
  map ,xh <Plug>(quickhl-toggle)
  map ,xH <Plug>(quickhl-reset)
endif
"}}}

"======================================
"Maintenance
if s:bundle_tap('savevers.vim') "{{{
  set patchmode=.vbcu
  let g:savevers_types = "*"
  "let g:savevers_dirs = &backupdir
  let g:savevers_dirs = '/tmp/auBcu/,$TEMP,$TMP,.'
  let g:versdiff_no_resize=1
  nmap <silent> <F7> :VersDiff -<cr>
  nmap <silent> <F8> :VersDiff +<cr>
  nmap <silent> <F9> :VersDiff -c<cr>
  call s:bundle_untap()
endif
"}}}
"--------------------------------------
filetype plugin indent on  "ファイル判定をonにする
unlet s:tapped_bundle
delf s:bundle_tap | delf s:bundle_config | delf s:bundle_untap
let g:loaded_getscriptPlugin = 1 | let g:loaded_netrwPlugin = 1 | let g:loaded_vimballPlugin = 1

if filereadable(fnamemodify('~/.privacy/.vimrc_privacy.vim', ':p'))
  source ~/.privacy/.vimrc_privacy.vim  "lingr.vimのパスワードとか
endif



"=========================================================
"Autocmd
autocmd vimrc VimResized * exe "normal! \<c-w>="
autocmd vimrc QuickfixCmdPost * if !empty(getqflist()) | cwindow | endif
"改行時にコメントしない(上手く動いていない(上書きされてる))
"autocmd vimrc FileType * setlocal fo-=ro
"--------------------------------------
"au_filetype
autocmd vimrc BufRead,BufNewFile *.markdown,*.md    setl ft=markdown nofoldenable
autocmd vimrc FileType js   setlocal ft=javascript
"--------------------------------------
"au_option
autocmd vimrc FileType gitcommit  setl nofoldenable nomodeline tw=60 fenc=utf-8
autocmd vimrc FileType vim   setl ff=unix
"--------------------------------------
"au_keymappings
autocmd vimrc FileType help   nnoremap <buffer><expr>q winnr('$')==1 ? ":\<C-u>bd\<CR>" : "\<C-w>c"
autocmd vimrc FileType vim    inoremap <expr><buffer>\
  \ getline('.') =~ '^\s*$' ? "\\\<Space>" : match(getline('.'), '\S')+1 >= col('.') ? "\\\<Space>" : '\'
autocmd vimrc FileType qf  noremap <buffer>q    :cclose<CR>
autocmd vimrc FileType qf  noremap <buffer><CR>    :.cc<CR>
autocmd vimrc FileType java  inoremap <expr><C-q>    <SID>IsEndSemicolon() ? "<C-O>$;<CR>" : "<C-O>$<CR>"
function! s:IsEndSemicolon() "{{{
  let c = getline(".")[col("$")-2]
  if c != ';'
    return 1
  else
    return 0
  endif
endfunction
"}}}
autocmd vimrc FileType java  inoremap <C-_>    <C-o>${<CR>
autocmd vimrc FileType java  nnoremap ,c    :!javac %<CR>
"--------------------------------------
aug vimrc_colorscheme
  au!
  autocmd ColorScheme *  call <SID>define_CursorIM_on_highlight() | call <SID>define_other_highlight()
  autocmd Syntax,BufNewFile,BufRead,StdinReadPost *  syntax match ZenkakuSpace containedin=ALL /　/
aug END
function! s:define_CursorIM_on_highlight() "{{{
  if has('multi_byte_ime') || has('xim')
    hi CursorIM guibg=#ffb700 guifg=NONE
  endif
endfunction
"}}}
function! s:define_other_highlight()  "{{{
  hi Pmenu          guifg=white  guibg=#6A5CB4  gui=NONE
  "hi CursorTrack    guibg=darkslategray4
  hi ZenkakuSpace   cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction
"}}}
"窓にカーソルの痕跡を残す
"autocmd vimrc_colorscheme WinLeave * match CursorTrack /\%#/
"autocmd vimrc_colorscheme WinEnter * match none
"--------------------------------------
"Window位置の保存と復帰 "{{{
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
"--------------------------------------
"ファイルを開いたら前回のカーソル位置へ移動
"autocmd vimrc BufReadPost *  if line("'\"")>1 && line("'\"")<=line('$') | exe 'norm! g`"' | endif
aug vimrc
  autocmd BufLeave * if expand('%')!='' && &buftype=='' | mkview | endif
  autocmd BufReadPost * if !has_key(b:, 'view_loaded') && expand('%')!='' && &buftype==''
    \ | silent! loadview | let b:view_loaded = 1 | endif
  autocmd VimLeave * call map(split(glob(&viewdir . '/*'), "\n"),  'delete(v:val)')
aug END

"=========================================================
"Commands
command! -nargs=*   VimElements    UPP lib#vimelements#collect(<f-args>)
"Vim script計測
command! -bar TimerStart let start_time = reltime()
command! -bar TimerEnd   echo reltimestr(reltime(start_time)) | unlet start_time
"plugin撮影用にウィンドウのサイズを一時的に変更する
command! GuiWinShorten     set lines=30 columns=100
command! GuiWinRest        set lines=40 columns=140
"パターンとファイル名を逆にしたgrep
function! s:perg(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction
command! -complete=file -nargs=+ Perg  call s:perg([<f-args>])
AlterCommand perg Perg
"現在ファイルのあるディレクトリでvimgrep
function! s:CurrentGrep(args)
  execute 'vimgrep' '/'.a:args[0].'/ '.expand(a:args[1]).'/**/*'
  cwindow
endfunction
command! -nargs=+   CurrentGrep  call s:CurrentGrep([<f-args>])
AlterCommand crrg[rep] CurrentGrep %:h<Left><Left><Left><Left>
"失敗したaugを無効にする
command! -nargs=1 -complete=augroup  KillAug  autocmd! <args>
command! -nargs=1 -complete=augroup  AugKiller  autocmd! <args>
"Rename
function! s:rename(name, bang) "{{{
  let crrpath = expand("%:p")
  let v:errmsg = ""
  silent! exe "saveas" . a:bang . " " . a:name
  if v:errmsg =~# '^$\|^E329'
    if expand("%:p") !=# crrpath && filewritable(expand("%:p"))
      silent exe "bwipe! " . crrpath
      if delete(crrpath)
        echoerr "Could not delete " . crrpath
      endif
    endif
  else
    echoerr v:errmsg
  endif
endfunction
"}}}
command! -nargs=* -complete=file -bang Rename :call <SID>rename("<args>", "<bang>")
AlterCommand ren[ame] Rename

"=========================================================
"Functions
function! Eat_whitespace(pat) "{{{
  let c = nr2char(getchar(0))
  return c=~a:pat ? '' : c
endfunction
"}}}
" Call a script local function.
" Usage:
" - S('local_func')
"   -> call s:local_func() in current file.
" - S('plugin/hoge.vim:local_func', 'string', 10)
"   -> call s:local_func('string', 10) in *plugin/hoge.vim.
" - S('plugin/hoge:local_func("string", 10)')
"   -> call s:local_func("string", 10) in *plugin/hoge(.vim)?.
function! S(f, ...) "{{{
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
endfunction
"}}}
"YankRingっぽくyank/historiesを使う
noremap <silent><Plug>(yank-replace-n) :call <SID>yank_replace(1)<CR>
noremap <silent><Plug>(yank-replace-p) :call <SID>yank_replace(-1)<CR>
let s:yank_histories_replace_idx = 0
function! s:yank_replace(fluct) "{{{
  let yank_histories = s:_get_yank_histories()
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
function! s:_get_yank_histories() "{{{
  let l = []
  let c = unite#sources#history_yank#define().gather_candidates('','')
  for pkd in c
    call add(l, pkd.word)
  endfor
  return l
endfunction
"}}}



"=============================================================================
"KeyMappings
let mapleader = '\'
let maplocalleader = '\\'
noremap [space] <nop>
nmap <Space> [space]
nmap <C-k> [C-k]
map @ [@]
"--------------------------------------
"No operation
"誤爆防止
nnoremap ZZ <Nop>
nnoremap q <Nop>
nnoremap <C-q> <Nop>
noremap m <Nop>
"インサートモードで間違って出してほしくないキー
noremap <F15> <Nop>
noremap! <F15> <Nop>
noremap <F16> <Nop>
noremap! <F16> <Nop>
noremap! <S-F16> <Nop>
inoremap <M-j> <Nop>
"--------------------------------------
"インサートモードでの削除コマンドにundoを有効化させる
inoremap <C-h> <C-g>u<C-h>
inoremap <C-u> <C-g>u<C-u>
"inoremap <c-w> <c-g>u<c-w>
"--------------------------------------
"参照操作
cnoremap <F1>   <C-u>h function-list<CR>
nnoremap <expr><F1>   v:count==1 ? ":\<C-u>h :command-completion-custom\<CR>" : ":\<C-u>h function-list\<CR>"
nnoremap <C-h>  :<C-u>h<Space>
cnoremap <expr><C-h>    getcmdtype()==':' ? getcmdpos()==1 ? 'h ' : "\<C-h>" : "\<C-h>"
cnoremap <expr><C-e>    getcmdtype()==':' ? getcmdline()=~'^\s*$\\|^h $' ? "<C-u>ec " : "\<C-e>" : "\<C-e>"
"--------------------------------------
"クリップボード
noremap ,y "*y
noremap <silent>,yu :<C-u>let @* = @"<CR>
noremap ,Y "*y$
noremap ,p "*p
noremap <F3> "+
noremap! <F3>   <C-r>+
noremap <C-z> "+
inoremap <C-r><C-y>   <C-r>+
cnoremap <C-r><C-y>   <C-r>=substitute(@+, '\n$', '', 'g')<CR>
nnoremap <C-c> "+y
vnoremap <C-c> "+y
vnoremap <C-y> "+y
snoremap <C-c> <C-c>a
vnoremap <expr><C-v> mode()=="\<C-v>" ? "\<Esc>\"+p" : "\<C-v>"
"レジスタ
exe 'nnoremap '. s:bind.reg. '    "'
exe 'nnoremap '. s:bind.reg. '+   "+'
exe 'vnoremap '. s:bind.reg. '    "'
exe 'vnoremap '. s:bind.reg. '+   "+'
"--------------------------------------
"Sticky Keys
"nmap <expr> ,;  <SID>sticky_func()
"omap <expr> ;  <SID>sticky_func()
"xmap <expr> ;  <SID>sticky_func()
"nnoremap .. .
"nnoremap z.. z.
exe 'map <expr> '. s:bind.sticky ' <SID>sticky_func()'
exe 'map <expr> g'. s:bind.sticky ' "g". <SID>sticky_func()'
exe 'map <expr> z'. s:bind.sticky ' "z". <SID>sticky_func()'
exe 'map <expr> ,'. s:bind.sticky ' ",". <SID>sticky_func()'
exe 'map <expr> "'. s:bind.sticky ' "\"". <SID>sticky_func()'
exe 'omap <expr> i'. s:bind.sticky ' "i". <SID>sticky_func()'
exe 'omap <expr> a'. s:bind.sticky ' "a". <SID>sticky_func()'
exe 'xmap <expr> i'. s:bind.sticky ' "i". <SID>sticky_func()'
exe 'xmap <expr> a'. s:bind.sticky ' "a". <SID>sticky_func()'
function! s:sticky_func() "{{{
  let l:sticky_table = { ',' : '<', '.' : '>', '/' : '?',
    \'1' : '!', '2' : '"', '3' : '#', '4' : '$', '5' : '%', '6' : '&', '7' : "'", '8' : '(', '9' : ')', '0' : '_',
    \ '-' : '=', '^' : '~', ';' : '+', ':' : '*', '[' : '{', ']' : '}', '@' : '`', '\' : '|'}
  let l:special_table = {"\<ESC>" : "\<ESC>", "\<Space>" : "\<Space>", "\<CR>" : ";\<CR>"}
  let key = nr2char(getchar())
  if key =~ '\l'
    return toupper(key)
  elseif has_key(l:sticky_table, key)
    return l:sticky_table[key]
  elseif has_key(l:special_table, key)
    return l:special_table[key]
  else
    return mode()=='n'? "\<Esc>" : ''
  endif
endfunction
"}}}

"======================================
"Normal mode
map Y y$
nnoremap ; :
vnoremap ; :
nnoremap [space]/ :<C-u>%s/
nnoremap j gj|nnoremap k gk
vnoremap <expr>j mode()==#'V' ? 'j' : 'gj'|vnoremap <expr>k mode()==#'V' ? 'k' : 'gk'
nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'
noremap zq q
noremap z@ @
map + *
nnoremap : ;
nnoremap <silent>,w :<C-u>up<CR>
nnoremap ,qu :<C-u>qa<CR>
nnoremap ,7   :<C-u>se fenc=euc-jp<CR>
nnoremap ,8   :<C-u>se fenc=utf-8<CR>
nnoremap ,9   :<C-u>se fenc=cp932<CR>
nnoremap <silent>,0   :<C-u>let &ff = &ff=='dos' ? 'unix' : &ff=='unix' ? 'mac' : 'dos'<CR>
"Normal mode 編集
nnoremap guu  gU
"Normal modeで挿入
nnoremap <silent>go :<C-u>call append(foldclosedend('.')==-1 ? '.': foldclosedend('.'), repeat([''], v:count1))<Bar>exe 'norm!' v:count1. 'j'<CR>
nnoremap gO :i<CR><CR>.<CR>
"空白を挿入する
nnoremap [space]a a<Space><Esc>
"nnoremap <C-Space> a<Space><Esc>
nnoremap [space]i i<Space><Esc>
nnoremap [space]s i<Space><Esc>la<Space><Esc>h
"--------------------------------------
"Win/Buf Open/Close
exe 'nnoremap '. s:bind.win. 's <C-w>s'
exe 'nnoremap '. s:bind.win. 'v <C-w>v'
exe 'nnoremap '. s:bind.win. 'o <C-w>o'
exe 'nnoremap <silent> '. s:bind.win. 't :tab split<CR>'
nmap dv <SID>bd
nnoremap <SID>bd :bd<CR>
nmap dn <SID>KeepWinBd
nnoremap <silent><SID>KeepWinBd    :KeepWinBd<CR>
"ウィンドウレイアウトを保持したままバッファを閉じる
com! KeepWinBd let save_bufnr= bufnr("%") |bnext |exe "bd ".save_bufnr |unlet save_bufnr
nmap dq <C-w>c
exe 'nnoremap '. s:bind.win. 'dd <C-w>c'
exe 'nnoremap '. s:bind.win. 'q <C-w>c'
"Window Layout
nnoremap ,0 <C-w>=
exe 'nnoremap '. s:bind.win. '0 <C-w>='
nnoremap ,\ <C-w>_
nnoremap <C-w>\ <C-w>_
exe 'nnoremap '. s:bind.win. '\ <C-w>_'
exe 'nnoremap '. s:bind.win. 'J <C-w>J'
exe 'nnoremap '. s:bind.win. 'K <C-w>K'
exe 'nnoremap '. s:bind.win. 'H <C-w>H'
exe 'nnoremap '. s:bind.win. 'L <C-w>L'
"ある窓を大きく開く
"nnoremap <silent>,0 :call <SID>enlarge_win(0)<CR>
nnoremap <silent>,1 :call <SID>enlarge_win(1)<CR>
nnoremap <silent>,2 :call <SID>enlarge_win(2)<CR>
nnoremap <silent>,3 :call <SID>enlarge_win(3)<CR>
nnoremap <silent>,4 :call <SID>enlarge_win(4)<CR>
nnoremap <silent>,5 :call <SID>enlarge_win(5)<CR>
nnoremap <silent>,6 :call <SID>enlarge_win(6)<CR>
function! s:enlarge_win(winnr) "{{{
  let targetWinnr = a:winnr ? a:winnr : winnr()
  let [save_winnr, save_wh, save_wiw] = [winnr(), &winheight, &winwidth]
  set wh=20 wiw=20
  exe targetWinnr. 'wincmd w'
  exe 'wincmd ='
  let [&wh, &wiw] = [save_wh, save_wiw]
  exe save_winnr. 'wincmd w'
endfunction
"}}}
"指定した番号の窓を閉じる
nmap ct <SID>close_remotewin1
nmap cz <SID>close_remotewin$
nmap c1 <SID>close_remotewin1
nmap c2 <SID>close_remotewin2
nmap c3 <SID>close_remotewin3
nmap c4 <SID>close_remotewin4
nmap c5 <SID>close_remotewin5
nmap c6 <SID>close_remotewin6
nmap d,t <SID>close_remotewin1
nmap d,z <SID>close_remotewin$
nmap d,1 <SID>close_remotewin1
nmap d,2 <SID>close_remotewin2
nmap d,3 <SID>close_remotewin3
nmap d,4 <SID>close_remotewin4
nmap d,5 <SID>close_remotewin5
nmap d,6 <SID>close_remotewin6
nmap mdt <SID>close_remotewin1
nmap mdz <SID>close_remotewin$
nmap md1 <SID>close_remotewin1
nmap md2 <SID>close_remotewin2
nmap md3 <SID>close_remotewin3
nmap md4 <SID>close_remotewin4
nmap md5 <SID>close_remotewin5
nmap md6 <SID>close_remotewin6
nnoremap <SID>close_remotewin$ :call <SID>close_remotewin(winnr('$'))<CR>
nnoremap <SID>close_remotewin1 :call <SID>close_remotewin(1)<CR>
nnoremap <SID>close_remotewin2 :call <SID>close_remotewin(2)<CR>
nnoremap <SID>close_remotewin3 :call <SID>close_remotewin(3)<CR>
nnoremap <SID>close_remotewin4 :call <SID>close_remotewin(4)<CR>
nnoremap <SID>close_remotewin5 :call <SID>close_remotewin(5)<CR>
nnoremap <SID>close_remotewin6 :call <SID>close_remotewin(6)<CR>
function! s:close_remotewin(winnr)
  let save_winnr = winnr()
  exe a:winnr. 'wincmd w'
  hide
  if save_winnr == a:winnr
    return
  endif
  let save_winnr = s:_get_ajusted_savewinnr(save_winnr, [a:winnr])
  exe save_winnr. 'wincmd w'
endfunction
"Specialwin Open/Close
nnoremap <silent><SID>close_whole_specialwins :call <SID>close_whole_specialwins(['&previewwindow'], ['quickfix'], ['unite'])<CR>
nmap cq <SID>close_whole_specialwins
nmap d,q <SID>close_whole_specialwins
function! s:close_whole_specialwins(options, buftypes, filetypes) "{{{
  let save_winnr = winnr()
  let killedwinnr_list = []
  windo call add(killedwinnr_list, s:_close_win(s:_should_close(a:options, a:buftypes, a:filetypes)))
  let save_winnr = s:_get_ajusted_savewinnr(save_winnr, killedwinnr_list)
  exe save_winnr.'wincmd w'
endfunction
"}}}
function! s:_close_win(should_close) "{{{
  if !a:should_close
    return 0
  endif
  let winnr = winnr()
  hide
  return winnr
endfunction "}}}
function! s:_should_close(options, buftypes, filetypes) "{{{
  if index(a:options, 1)!=-1
    return 1
  endif
  if index(a:buftypes, &bt)!=-1
    return 1
  endif
  if index(a:filetypes, &ft)!=-1
    return 1
  endif
endfunction
"}}}
function! s:_get_ajusted_savewinnr(save_winnr, killedwinnr_list)  "{{{
  let save_winnr = a:save_winnr
  for killedwinnr in reverse(a:killedwinnr_list)
    if killedwinnr == 0
      continue
    elseif killedwinnr < save_winnr
      let save_winnr -= 1
    endif
  endfor
  return save_winnr
endfunction
"}}}
"Tabpage Open/Close
noremap <SID>tabc :tabc<CR>
nmap <silent>dy <SID>tabc
nmap <silent>du <SID>tabc
nnoremap <silent> myo :tabonly<CR>
nnoremap <silent> myv :tabe $VIM/.vimrc<CR>
nnoremap <silent> my] :execute "tab tag ".expand('<cword>')<CR>|"カーソルドタグを新規タブページで開く
nnoremap <silent> myK :execute "tab help ".expand('<cword>')<CR>|"カーソルドワードを新規タブページで:helpする
"--------------------------------------
"Buf Switching
nnoremap <silent> [space]h :bp<CR>
nnoremap <silent> [space]l :bn<CR>
"Win Switching
nnoremap [space]n gt
nnoremap [space]p gT
"noremap <S-C-i> gt
nnoremap <silent> <S-C-Tab> :tabp<CR>
nnoremap <silent> <C-Tab> :tabn<CR>
nnoremap <silent>[space]j :call <SID>Roop_switchWin("j")<CR>
nnoremap <silent>[space]k :call <SID>Roop_switchWin("k")<CR>
function! s:Roop_switchWin(bind) "{{{
  let save_winnr = winnr()
  exe 'wincmd '. a:bind
  if winnr() == save_winnr
    let antiBind = a:bind=='h'?'l' : a:bind=='j'?'k' : a:bind=='k'?'j' : 'h'
    exe '16wincmd '. antiBind
  endif
endfunction
"}}}
exe 'nnoremap <silent>'. s:bind.win. 'h :call <SID>Roop_switchWin("h")<CR>'
exe 'nnoremap <silent>'. s:bind.win. 'j :call <SID>Roop_switchWin("j")<CR>'
exe 'nnoremap <silent>'. s:bind.win. 'k :call <SID>Roop_switchWin("k")<CR>'
exe 'nnoremap <silent>'. s:bind.win. 'l :call <SID>Roop_switchWin("l")<CR>'
"指定した窓に跳ぶ
nnoremap [space]1 1<C-w><C-w>
nnoremap [space]2 2<C-w><C-w>
nnoremap [space]3 3<C-w><C-w>
nnoremap [space]4 4<C-w><C-w>
nnoremap [space]5 5<C-w><C-w>
nnoremap [space]6 6<C-w><C-w>
exe 'nnoremap '. s:bind.win. '1 1<C-w><C-w>'
exe 'nnoremap '. s:bind.win. '2 2<C-w><C-w>'
exe 'nnoremap '. s:bind.win. '3 3<C-w><C-w>'
exe 'nnoremap '. s:bind.win. '4 4<C-w><C-w>'
exe 'nnoremap '. s:bind.win. '5 5<C-w><C-w>'
exe 'nnoremap '. s:bind.win. '6 6<C-w><C-w>'
"Specialwin Switching
"QuickFixコマンド
nmap cn <SID>c_n
nnoremap <SID>c_n    :cn<CR>zv
nmap cp <SID>c_p
nnoremap <SID>c_p    :cp<CR>zv
nmap cv <SID>c_window
nnoremap <SID>c_window    :cw<CR>
"--------------------------------------
"Open the Particular Buf
nnoremap <SID>o_vimrc :e $MYVIMRC_SUBSTANCEDIR/.vimrc<CR>
nmap cov <SID>o_vimrc
nnoremap <SID>o_gitconfig :e $DOTFILES/.gitconfig<CR>
nmap cog <SID>o_gitconfig
"--------------------------------------
"Info
nnoremap <C-g><C-z> :<C-u>echo <SID>get_fileinfo()<CR>
function! s:get_fileinfo() "{{{
  let ret = ''
  let ret .= printf('"%s" (upd:%s) [%schrs] tw=%d (%d/%dv)%d',
    \ bufname("%"),
    \ strftime("%Y_%m%d %H:%M",getftime(bufname("%"))),
    \ (exists('b:charCounterCount') ? b:charCounterCount : ''),
    \ &tw,
    \ virtcol('.'), virtcol('$'), winwidth(0),
    \ )[:&co-2]
  let ret .= "\n". FoldCCnavi()
  return ret
endfunction
"}}}
nnoremap mz :mes<CR>
nnoremap mc :scrip<CR>
"nnoremap ma :marks<CR>
"nnoremap ma :<C-u>Unite mark<CR>
"検索ハイライト
sign define SearchStart text=索 texthl=Search
noremap <silent> z/ :nohlsearch<CR>:sign unplace 333<CR>
"noremap <silent>n :<C-u>call <SID>put_searchstart_sign(1)<CR>nzv
function! s:put_searchstart_sign(is_nN_bindsearch) "{{{
  let [lnr, bufnr] = [line('.'), bufnr('%')]
  if a:is_nN_bindsearch && s:_get_crrsigns(bufnr)=~'=333'
    return
  endif
  sign unplace 333
  exe 'sign place 333 line='. lnr. ' name=SearchStart buffer='. bufnr
endfunction
function! s:_get_crrsigns(crrbufnr)
  redir => chksign
  silent exe 'sign place buffer='. a:crrbufnr
  redir END
  return chksign
endfunction
"}}}
nnoremap <silent> g/ :exe 'sign jump 333 buffer='.bufnr('%')<CR>
"--------------------------------------
"Moving
noremap + ;
nnoremap g*   g*N
noremap L $
noremap <expr>H   col('.') == match(getline('.'), '^\s*\zs\S')+1 ? '0' : '^'
noremap <silent>M   :<C-u>call <SID>smart_M('M')<CR>
function! s:smart_M(move) "{{{
  let s:smart_M_count = get(s:, 'smart_M_count', 0)
  let s:origin_view = s:smart_M_count==0 ? winsaveview() : get(s:, 'origin_view', winsaveview())
  let oldview = winsaveview()
  keepj exe ['norm! H', 'norm! M', 'norm! L', 'call winrestview(s:origin_view)'][s:smart_M_count-1]
  if winsaveview() != oldview
    let s:origin_view = winsaveview()
    let s:smart_M_count = 0
  endif
  keepj exe ['norm! H', 'norm! M', 'norm! L', 'call winrestview(s:origin_view)'][s:smart_M_count]
  let s:smart_M_count = s:smart_M_count==3 ? 0 : s:smart_M_count+1
endfunction
"}}}
noremap [space]w W
noremap [space]b B
noremap [space]e E
noremap [space]ge gE
omap <C-w> iW
"mark jump
exe 'noremap '. s:bind.markj. ' `'
exe 'noremap '. s:bind.markj. '@ ``'
exe 'noremap '. s:bind.markj. '<C-k> `"'
"次の折り畳みに移動
nnoremap <silent>zj :<C-u>call <SID>smart_foldjump('j')<CR>
nnoremap <silent>zk :<C-u>call <SID>smart_foldjump('k')<CR>
function! s:smart_foldjump(direction) "{{{
  if a:direction == 'j'
    let [cross, trace, compare] = ['zj', ']z', '<']
  else
    let [cross, trace, compare] = ['zk', '[z', '>']
  endif
 
  let i = v:count1
  while i
    let save_lnum = line('.')
    exe 'keepj norm! '. trace
    let trace_lnum = line('.')
    exe save_lnum
 
    exe 'keepj norm! '. cross
    let cross_lnum = line('.')
    if cross_lnum != save_lnum && eval('cross_lnum '. compare. ' trace_lnum') || trace_lnum == save_lnum
      let i -= 1
      continue
    endif
 
    exe trace_lnum
    let i -= 1
  endwhile
  mark `
  norm! zz
endfunction
"}}}
"--------------------------------------
"折り畳み操作
nnoremap <silent><C-_> :call <SID>smart_foldcloser()<CR>
function! s:smart_foldcloser() "{{{
  if foldlevel('.') == 0
    norm! zM
    return
  endif
 
  let foldc_lnum = foldclosed('.')
  norm! zc
  if foldc_lnum == -1
    return
  endif
 
  if foldclosed('.') != foldc_lnum
    return
  endif
  norm! zM
endfunction
"}}}
"現在地にfoldlevelを合わせる
nnoremap <silent>zu    :set foldlevel=<C-r>=foldlevel('.')-1<CR><CR>
nnoremap <silent>zu    zMzvzc
nnoremap <silent>z<C-_>    zMzvzc
nnoremap <silent>z0    :set foldlevel=<C-r>=foldlevel('.')<CR><CR>
nnoremap zf A <Esc>^zf
nnoremap z[     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap z]     :<C-u>call <SID>put_foldmarker(1)<CR>
function! s:put_foldmarker(foldclose_p) "{{{
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction
"}}}
"--------------------------------------
"編集バインド(Normal)
function! s:delete_trailing_whitespaces() "{{{
  let save_view = winsaveview()
  let save_search=@/
  %s/\s\+$//e
  let @/=save_search
  nohl
  call winrestview(save_view)
endfunction
"}}}
nnoremap <silent>,es    :<C-u>call <SID>delete_trailing_whitespaces()<CR>
"直前のコマンドを再度実行する
"nnoremap ,. q:k<CR>
nnoremap [@]: @:
nmap c. @:
"ペーストしたテキストを再選択するBible3-15
onoremap <expr> [@]@ '`[' . strpart(getregtype(), 0,1) . '`]'
vnoremap <expr> [@]@ '`[' . strpart(getregtype(), 0,1) . '`]'
onoremap <silent> gv :normal gv<CR>
"前回保存した状態にまでアンドゥ
nnoremap [space]u :earlier 1f<CR>
nnoremap [space]<C-r> :later 1f<CR>
nnoremap =p p`[=`]
nnoremap =P P`[=`]
"テスト変数
nnoremap <silent>[C-k]<C-t>u :call <SID>unlet_testvars()<CR>
function! s:unlet_testvars() "{{{
  for n in range(30)
    let v = 'g:test'. printf('%02d', n)
    if exists(v)
      exe 'unlet '. v
    endif
  endfor
endfunction
"}}}
nnoremap [C-k]<C-t><C-t> :echo <SID>display_testvars()<CR>
function! s:display_testvars() "{{{
  let display = ''
  for n in range(30)
    let v = 'g:test'. printf('%02d', n)
    if exists(v)
      let display .= v. '='. string(eval(v)). "\n"
    endif
  endfor
  return display
endfunction
"}}}
nnoremap [C-k]<C-t>k :call PeekEcho()<CR>
":source
"nnoremap  [C-k]v     source $MYVIMRC<CR>
nnoremap  ,xv    source $MYVIMRC<CR>
nnoremap  [C-k]<C-s> :so %<CR>

"======================================
"Visual mode
vnoremap zf :call <SID>Fixed_zf()<CR>
function! s:Fixed_zf() range "{{{
  let cmsStart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
  let cmsEnd = matchstr(&cms,'\V%s\zs\.\+')
  let fmr = split(&fmr,',')
  call setline(a:firstline, getline(a:firstline). ' '. cmsStart.fmr[0].cmsEnd)
  call setline(a:lastline, getline(a:lastline). cmsStart.fmr[1].cmsEnd)
endfunction
"}}}
vnoremap <expr>v mode()=="v" ? "$h" : "v"
"改良版ビジュアルインサート from TIM Labs kana
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')
function! s:force_blockwise_visual(next_key) "{{{
  if mode() ==# 'v'
    return "\<C-v>" . a:next_key
  elseif mode() ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else  " mode() ==# "\<C-v>"
    return a:next_key
  endif
endfunction
"}}}
exe 'vnoremap '. s:bind.mode. ' <C-g>'
exe 'vnoremap '. s:bind.esc. ' <Esc>'
"0,0,0などの並んだ数字を選択して連番にするコマンドhttp://d.hatena.ne.jp/fuenor/20090907/1252315621
vnoremap <silent> <F4><C-a> :ContinuousNumber <C-a><CR>
vnoremap <silent> <F4><C-x> :ContinuousNumber <C-x><CR>
command! -count -nargs=1 ContinuousNumber
  \ let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"======================================
"Insert & CommandLine mode
"Moving
noremap! <C-k> <Left>
noremap! <C-f> <Right>
inoremap <C-g>  <Esc><Plug>(smartword-w)i
inoremap <C-b>  <Esc><Plug>(smartword-b)i
cnoremap <C-g> <S-Right>
cnoremap <C-b> <S-Left>
noremap! <C-a> <Home>
inoremap <C-e> <End>
"cnoremap <C-e> <End>
"--------------------------------------
"挿入バインド(Insert CommandLine)
inoremap <C-r><C-e> <C-r>"
cnoremap <C-r><C-e>   <C-r>=substitute(substitute(@", '\n$', '', ''), '\n', '<Bar> ', 'g')<CR>
noremap! <C-r><C-f> <C-r>=expand('%:t')<CR>
inoremap <S-C-Tab> <C-d>
inoremap <C-r><C-t> <C-d>
inoremap <C-x><C-a> <C-a>
inoremap <expr><C-Tab>  &et ? "\<C-v>\<C-i>" : repeat(' ', &sts ? &sts : &ts)
imap <M-Space>    <Tab><Tab>
cnoremap <expr> <C-x> expand('%:p:h') . "/"
cnoremap <expr> <C-z> expand('%:p:r')
"cnoremap <expr><C-s>    getcmdtype()==':' ? getcmdpos()==1 ? 'set ' : "\<C-s>" : "\<C-s>"
cnoreabb <expr>ss getcmdtype()==':' ? '%s/<C-r>=Eat_whitespace(''\s\\|;\\|:'')<CR>' : 'ss'
cnoreabb <expr>sg getcmdtype()==':' ? '%s/<C-r>=Eat_whitespace(''\s\\|;\\|:'')<CR>' : 'sg'
cnoremap <expr> / getcmdtype()=='/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype()=='?' ? '\?' : '?'
"--------------------------------------
"編集バインド(Insert CommandLine)
noremap! <C-d>  <Del>
inoremap <C-w>    <C-o>db
"後方単語を大文字・小文字化(from thinca)
"gU v(文字指向にする/これによってカーソル上の文字も範囲にする :h o_v) b gi
inoremap <C-x>U <ESC>gUvbgi
inoremap <C-x>u <ESC>guvbgi
imap <C-_> <Esc>
cmap <C-_> <C-c>
imap <C-@> <Esc>
cmap <C-@> <C-c>
vmap <C-@> <C-c>
exe 'inoremap '. s:bind.esc. ' <Esc>'
exe 'cmap '. s:bind.esc. ' <C-c>'
"TODO 現在のコマンドラインをyankする
"cnoremap <C-y>

"======================================
"CommandlineWindow
"Enter
exe 'cnoremap '. s:bind.mode. ' <C-f>'
nnoremap c; q:
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
let &mouse = has('mouse') ? 'a': ''
se browsedir=buffer " :bro[wse]ダイアログで開かれる初期dir
se autoread confirm
se winaltkeys =no
se timeout timeoutlen=5000 ttimeoutlen=100
se nrformats=hex "<C-a><C-x>に影響
se showmatch matchtime=1
se clipboard=
se history=50  " :コマンド履歴保存数
se modeline
se wrap
se fdm=marker cms=%s foldcolumn=3
se showtabline=2
se completeopt=menu,menuone,preview "補完

"======================================
"Backup
"backupfile
":h backup-table
se nobk nowb
  "NOTE: 'nobk'で'wb'だと書き込みに失敗したときのみbackupfileが残される
se bex=.bcu
se bdir=/tmp/auBcu/,$TEMP,$TMP,.
"--------------------------------------
"swapfile
se swf
if !isdirectory($VIMSYSTEM. '/vimswap')
  call mkdir($VIMSYSTEM. '/vimswap', 'p')
endif
se dir=$VIMSYSTEM/vimswap,.
for s:dir in split(&dir, ',')[:-2]
  if !isdirectory(s:dir)
    call mkdir(s:dir, "p")
  endif
endfor
unlet s:dir
"--------------------------------------
"undofile
if version >= 703
  se undofile
  let &undodir = &bdir
endif
"--------------------------------------
se viminfo=
se vi+='20  "marks
se vi+=<50  "register limit (line)
se vi+=s10  "register limit (Kbyte)
se vi+=%  "buffers list
se vi+=h  "viminfoを読み込むとき 'hlsearch' を無効にする
se vi+=ra:,rb:  "removable mediaの指定 (mark履歴対象外にする)
"se vi+=n$VIM/.viminfo  "viminfo file name (作成する場所)
se vi+=n~/.viminfo  "viminfo file name (作成する場所)
"--------------------------------------
"views (カーソル位置などを復元)
set viewdir=$VIMSYSTEM/viewdir viewoptions=folds,cursor,slash,unix

"======================================
"編集設定
"--------------------------------------
"Indent, 自動整形
se expandtab ts=8 sw=2 sts=2 autoindent
  "'ts'   見かけ
  "'sts'  <Tab>の挿入や<BS>の使用等の編集操作
  "'sw'   'ci'や'ai'や>>で挿入されるindent
let g:vim_indent_cont = &sw "行継続の際、挿入されるindent量 :h ft-vim-indent
se cindent cinoptions& cinoptions+=:0 "'cinoptions' については実際使うときになって考え直す必要性 :h cinoptions-values
se smartindent
"auto-format
se formatoptions=
"se fo +=t  "'textwidth' を使ってテキストを自動折返しする
se fo +=q  ""gq" でコメントを整形する。
se fo +=n  "番号付きリスト等を認識して折り返す
se fo +=M  "マルチバイト文字連結時空白を挿入しない
se fo +=m  "マルチバイト文字でも整形を有効にする

"--------------------------------------
"検索
se wrapscan hlsearch incsearch
se tags=./tags,tags,../tags  "tagsファイルの読み込み先
set grepprg=jvgrep ""-n;:行番表示-H;:ファイル名表示
"set grepprg=internal  " vimgrep をデフォルトのgrepとする場合internal
"set grepprg=D:/bnr/cmd/cygwingrep/bin/cyggrep.exe\ -nH ""-n;:行番表示-H;:ファイル名表示
"set grepprg=cyggrep.exe\ -nH

"--------------------------------------
"Window
"se lines=40 co=130 "時間かかりすぎ
"se scrolloff=2
se helpheight=0 previewheight=0 equalalways cmdheight=2
se winminwidth=0

"--------------------------------------
"カーソルの挙動
se virtualedit =block,onemore "実際に文字がないところにカーソルを置けるようにする
"カーソル左右の動き
se whichwrap=
se ww+=b  "<BS>
se ww+=s  "<Space>
se ww+=h
se ww+=l
se ww+=<  "<Left>  (nv)
se ww+=>  "<Right> (nv)
se ww+=[  "<Left>  (i Replace)
se ww+=]  "<Right> (i Replace)
se backspace=indent,eol,start "<BS>等をindentやeolを越えて有効にする


" ファイルを開いたら前回のカーソル位置へ移動 TODO:mkviewに置き換える
"aug vimrc_editting
"  au BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line('$') |
"    \   exe "normal! g`\"" |
"    \ endif
"aug END

"-----------------------------------------------------------------------------


"a:groupnameの:hiを返す
function! s:__Gs_hi(groupname) "{{{
  redir => hl
  silent exe 'hi '. a:groupname
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
se cpoptions +=n  "'showbreak'を行番号の間に表示させる


se guioptions=
"se go +=c  "単純な選択にはポップアップダイアログでなくコンソールダイアログを使う
se go +=r  "l/rスクロールバーを常に表示
se go +=L  "垂直分割されたときL/Rスクロールバーを表示
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
  set printfont=Migu_1M:h7 "注意: windowsでは encoding=cp932 でないとhardcopyできない

  if hostname() == 'SIICP11ALJ'
    set gfn=Migu_1M:h13:cSHIFTJIS,\ MeiryoKe_Console:h11,\ MS_Gothic:h14:cSHIFTJIS
  elseif hostname() == 'ATSUTO'
    "set gfn=Migu_1M:h15:cSHIFTJIS,\ MS_Gothic:h14:cSHIFTJIS
    "set gfn=Migu_1M:h17:cSHIFTJIS,\ MS_Gothic:h14:cSHIFTJIS
    set gfn=Migu_1M:h11:cSHIFTJIS,\ MS_Gothic:h10:cSHIFTJIS
  elseif hostname() =~ '\u\+-PC'
    set gfn=Migu_1M:h11:cSHIFTJIS,\ MS_Gothic:h10:cSHIFTJIS
  else
    set gfn=Migu_1M:h11:cSHIFTJIS,\ MeiryoKe_Console:h10,\ MS_Gothic:h10:cSHIFTJIS
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














"=============================================================================
"=============================================================================





"=============================================================================
"未整理空間 "{{{1



"vim-vcs.vim
"設定用辞書変数
"    let g:vcs#config = {'alias':{'st':'status'},}



"smartchr
"autocmd FileType vim, inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', '=')
"cnoremap <expr> [  smartchr#one_of('[', '\[', {'ctype': '/?'})






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




unlet s:bind

"-----------------------------------------------------------------------------






"# 縦最大化しつつWindowを移動
"nnoremap <C-j> <C-w>j<C-w>_
"nnoremap <C-k> <C-w>k<C-w>_



NeoBundleLazy 'kana/vim-niceblock'

"# TagHighlight 
NeoBundleLazy 't9md/vim-unite-ack' "grepみたいなの



"終了時エラー確認
set verbosefile=/tmp/vim.log


"=============================================================================
"TODO
"
"vimfilerにハードリンク(2000~XP)などを作らせるコマンド用意
"
"unite printout
"
"Idea etc
"
"カーソル位置から前後数行を対象にコマンドを実行する（画面から見える位置に限定して）
"自動で関数の始まりから終わりまでが見える大きさにウィンドウサイズ変更
"コメント接頭辞に<CR>で属性変更 ] c] a]
"前回の保存からの変更点をhlさせる
"アンド検索（一件目がhitした後二件目のwordで一件目の前後数行を検索
"
"-----------------------------------------------------------------------------
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

"unite より使いやすいカラー一覧
"u]コマンドライン型unite
"uniteをメモ帳・todoリストとして使う。要素の追加・削除がその場で行える
"uniteチートシート.同上。
"hisbird ファイル閲覧履歴


