"source-buffer ファイル名に色を付ける
au Syntax unite   syntax match uniteSource__Buffer_Fname "[^/]\{-1,}\ze\s\[" contained containedin=uniteSource__Buffer
hi default link uniteSource__Buffer_Fname Constant

"=============================================================================
"Buffer keymappings
let g:unite_no_default_keymappings = 1

"unite basic-Keymaps "{{{
au FileType unite nmap <buffer> i         <Plug>(unite_insert_enter)
au FileType unite nmap <buffer> I         <Plug>(unite_insert_enter)
au FileType unite nmap <silent><buffer><expr> a  unite#smart_map("\<Plug>(unite_append_enter)", "\<Plug>(unite_choose_action)")
au FileType unite nmap <buffer> A         <Plug>(unite_append_end)
"au FileType unite nmap <buffer><expr> q   winnr('$')==1 ? ":\<C-u>bd\<CR>" : ":\<C-u>close\<CR>"
au FileType unite nmap <buffer> q         <Plug>(unite_exit)
au FileType unite imap <buffer> <C-q>         <Plug>(unite_exit)
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
au FileType unite nnoremap <silent><buffer><expr> dd
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
"sorter
au FileType unite nnoremap <buffer><expr>sr      unite#mappings#set_current_filters(
  \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
au FileType unite nnoremap <buffer><expr>sw      unite#mappings#set_current_filters(
  \ empty(unite#mappings#get_current_filters()) ? ['sorter_word'] : [])
au FileType unite nnoremap <buffer><expr>sl      unite#mappings#set_current_filters(
  \ empty(unite#mappings#get_current_filters()) ? ['sorter_length'] : [])
"no_quit切換
au FileType unite nnoremap <buffer><C-@>   :let b:unite.context.no_quit = !b:unite.context.no_quit<Bar>echo b:unite.context.no_quit<CR>

"=============================================================================
"echo action (from thinca)
"uniteのアクションがどんなことを行うのかをプレビューする(candidateを一覧する)
let s:unite_action = {'description': 'Echo the candidates for debug.', 'is_selectable': 1,}
function! s:unite_action.func(candidates)
  PP a:candidates
endfunction
call unite#custom_action('common', 'echo', s:unite_action)
unlet! s:unite_action

"=============================================================================
"unite menu
let g:unite_source_menu_menus = get(g:, 'unite_source_menu_menus', {})
"--------------------------------------
let s:main = {}
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
let s:main.candidates['put_vim_modeline'] = 'call Put_vim_modeline()'

let g:unite_source_menu_menus.main = s:main
unlet s:main
"------------------
function! Put_vim_modeline() " {{{
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

"--------------------------------------
let s:menubar = {}
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

let g:unite_source_menu_menus.menubar = s:menubar
unlet s:menubar

