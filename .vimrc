" vim: set fdm=marker sw=2 sts=2 cms="%s :


"=============================================================================

" �X�^�[�g�A�b�v
"==============
" scriptencoding�ƁA���̃t�@�C���̃G���R�[�h����v����悤���ӁI
  " scriptencoding�́Avim�̓����G���R�[�h�Ɠ����ɂ���Ɩ�肪�N���ɂ����B
  " ���s�R�[�h�� set fileformat=unix �ɐݒ肷���unix�ł��g���܂��B
    scriptencoding cp932


" �V�X�e���ݒ�{{{1
"=============
"\.vim��\vimfiles��$CFGHOME�ƒ�`����: unix,win32�ł�path�̈Ⴂ���z��"{{{
  "$CFGHOME�̓��[�U�[�����^�C���f�B���N�g���������B
  "�����^�C���p�X��ʂ��K�v�̂���v���O�C�����g�p����ꍇ�A
  "$CFGHOME���g�p����� Windows/Linux�Ő؂蕪����K�v�������Ȃ�B
  "��) vimfiles/qfixapp (Linux�ł�~/.vim/qfixapp)�Ƀ����^�C���p�X��ʂ��ꍇ�B
  "set runtimepath+=$CFGHOME/qfixapp
    if has('unix')
      let $CFGHOME=$HOME.'/.vim'
    else
      let $CFGHOME=$VIM.'\vimfiles'
      "let $CFGHOME=$VIM.'\.vim'
    endif"}}}

" ���ϐ�HOME���Ȃ��Ƃ���$VIM/HOME��$HOME�ɂ���
  if !exists("$HOME")
    let $HOME=$VIM/HOME
  endif

" UTF-8����_vimrc�ōs���ꍇ�ȉ���L���ɂ��ĂˁB
  "source $CFGHOME/pluginjp/encode.vim
" _vimrc��scriptencoding�ƈقȂ�����G���R�[�f�B���O�ɕύX����ꍇ�A�ύX��ɉ��߂�scriptencoding���w�肵�Ă����Ɩ�肪�N���ɂ����Ȃ�܂��B
  "scriptencoding cp932

" �}�E�X��L���ɂ���B
  if has('mouse')
    set mouse=a
  endif


" �o�b�N�A�b�v�֌W"{{{
  "�t�@�C���̏㏑���̑O�Ƀo�b�N�A�b�v�����/���Ȃ�
    "set writebackup���w�肵�Ă��I�v�V���� 'backup' ���I���łȂ�����A�o�b�N�A�b�v�͏㏑���ɐ���������ɍ폜�����B
      set nowritebackup
  "�o�b�N�A�b�v/�X���b�v�t�@�C�����쐬����/���Ȃ��B
    set nobackup
    "set noswapfile

    "set backup  " �o�b�N�A�b�v��L���ɂ���
    set backupext=.bcu  " �o�b�N�A�b�v�t�@�C���̊g���q
  "�o�b�N�A�b�v�t�@�C�������f�B���N�g��
    set backupdir=~/auBcu/,~/yobi/,.	"�o�b�N�A�b�v��/auBcu���܂��͕ҏW���ꂽ�t�@�C���Ɠ����f�B���N�g���Ɏ��
    set directory=~/vimswap/,. "�X���b�v�t�@�C��swapfile�̍쐬�ꏊ
    "let &directory = &backupdir  " �X���b�v�t�@�C���i�N���b�V�����ɕ����p�j���o�b�N�A�b�v�f�B���N�g���ɍ쐬

    if version >= 703
      "�ēǍ��Avim�I������p������A���h�D(7.3)
       set undofile
      "�A���h�D�̕ۑ��ꏊ(7.3)
       set undodir=~/auBcu/,.
    endif

  " viminfo���쐬���Ȃ��B
    "set viminfo=

  " ���t���O����F'�}�[�N,<���W�X�^�s,s���W�X�^(kb),h'hlsearch'����,r�����[�o�����f�B�A,%�o�b�t�@���X�g�̕ۑ�����
    set viminfo='20,<50,s10,h,ra:,rb:,% "viminfo-file�ɕۑ��������e
    set viminfo+=n$VIM/.viminfo "viminfo���쐬����ꏊ
"}}} }}}1


" ���E����"{{{
"=========
" �ݒ�
  set winaltkeys =no  "���j���[�o�[��<M->��������Ƃ��ɁA���j���[�o�[�ɃA�N�Z�X���Ȃ�
  set virtualedit=block "Visual block���[�h�Ńt���[�J�[�\��(���z�ҏW:�����̂Ȃ��ꏊ�ɂ��J�[�\����u����)��L���ɂ���
  set nrformats-=octal "+ 8�i���𖳌��ɂ���B<C-a>,<C-x>�i���Z�ƌ��Z�j�Ȃǂɉe������B
  set clipboard=


  set modeline  "���[�h���C���i�t�@�C���̃w�b�_�A�t�b�^�ɏ����ꂽvi�p�I�v�V�����j��L���ɂ���
  set formatoptions& formatoptions+=mM "���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ��B�e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������

  set completeopt=menu,menuone,longest,preview  " �⊮�@�\��L���ɂ���
  set browsedir=buffer   " �t�@�C���u���E�U�J�n���̏����f�B���N�g�� �ilast �O��Ƀt�@�C���u���E�U�Ńt�@�C����I�������f�B���N�g�� buffer �o�b�t�@�ŊJ���Ă���t�@�C���̃f�B���N�g�� current �J�����g�f�B���N�g���j
  "set wildmode=list:full " �R�}���h���C���ŁA���X�g�\���C�Œ��}�b�`���[�h�i�vwildchr�j

  "�C�x���g�n���h��
    set confirm  " �o�b�t�@�ւ̕ύX��ۑ����Ȃ��ŏI������Ƃ��A�m�F����
    set autoread   " ���ŏ���������ꂽ�玩���œǂݒ���

"windows��gvim�ŁA�����ime��on��ԂŎn�܂�̂𐥐�
  "set iminsert=0
  "set imsearch=-1

  "�G���R�[�f�B���O"{{{
    setglobal fileencoding=cp932 " +�V�K�쐬�����t�@�C���G���R�[�h��cp932�ɂ�����
    "setglobal fileencoding=japan " +�V�K�쐬�����t�@�C���G���R�[�h��cp932�ɂ�����
    set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,default,latin "�ǂݍ��݂ŕ����R�[�h�F���ԈႢ���Ȃ�ׂ����炷
    set fileformats=dos,unix,mac " +���s�R�[�h�̎����F���i�V�K�쐬�����t�@�C���t�H�[�}�b�g��dos�ɂ������j
    set termencoding=utf-8 "vimshell�ɑ������"}}}

  "�^�u������󔒕����A�C���f���g�̈���"{{{
    set expandtab "�^�u���g�킸�A�󔒂ő�s�i�^�u����͂���Ƃ���c-v<TAB>�j
    set foldmethod=marker "+�܂��݂̎��
    set tabstop=2  " ������^I�̌������̃^�u���B�t�@�C������ <tab>
    set shiftwidth=2  "cindent��autoindent����>>���^�C�v�����Ƃ��ɑ}�������^�u�̕��itabstop�Ƒ����Ă����Ƃ����j
    "set shiftwidth=4  "cindent��autoindent����>>���^�C�v�����Ƃ��ɑ}�������^�u�̕��itabstop�Ƒ����Ă����Ƃ����j
    set softtabstop=2 "<Tab>�̑}����<BS>�̎g�p�Ȃǂ̕ҏW���������Ƃ���<Tab>���Ή�����󔒂̐�
    "set softtabstop=4 "<Tab>�̑}����<BS>�̎g�p�Ȃǂ̕ҏW���������Ƃ���<Tab>���Ή�����󔒂̐�
    set autoindent  " �V�����s��}�������Ƃ��A���ݍs�Ɠ����C���f���g��K�p����(noautoindent:�C���f���g���Ȃ�)
    set cindent  " c�v���O�����t�@�C���̎����C���f���g���s��
    set cinoptions& cinoptions+=:0  "C�C���f���g�̐ݒ�(:h cinoptions-values�Q��)"}}}

  set timeoutlen=3500  "�L�[�R�[�h��}�b�s���O���ꂽ�L�[�񂪊�������̂�҂���(�~���b)�B�L�[�^�C�v�̃^�C���A�E�g����
  set history=50  " : �ɂ��R�}���h�ƈȑO�Ɏg���������p�^�[���̗����q�X�g���̕ۑ���

"�����ɃJ���}��؂�œo�^���ꂽ�p�X�ɒu���ꂽ�t�@�C���́A�t�@�C�����݂̂ŃA�N�Z�X�ł���B
  ""let &path +=$VIM/siic/settings,$VIMRUNTIME/plugin/myinstallplugin
  set path& path +=$VIM/siic/settings/

  set whichwrap=b,s,[,],<,>,h,l "�ȉ��̃t���O�Ŏw�肵���ړ��R�}���h�ŃL�����b�g���s�̒[�܂ŗ����玟�^�O�̍s��
"}}}
set commentstring=%s

" �\���ݒ�"{{{
"=========
" ��gvim�̐F�e�[�}��.gvimrc�Ŏw�肷��B

" ��{�ݒ�
  set wrap  " �s��܂�Ԃ�
  set textwidth=0 "�K�蕶�������z����Ǝ����ŉ��s�����̂���߂�����i�Ȃ���78�ɂȂ��Ă��j���ł�78�ɂ���Ă�

  " �}�N�����s���Ȃǂ̉�ʍĕ`����s��Ȃ��B
    "set lazyredraw

" �E�B���h�E�T�C�Y�E���C�A�E�g"{{{
  set lines=40  " �E�B���h�E�T�C�Y�c���@�f�t�H���g��24
  set columns=100  " �E�B���h�E�T�C�Y�����@�f�t�H���g��80
  "set helpheight=20  "�w���v�t�@�C�����J�����Ƃ��̃E�B���h�E�̍���(�f�t�H���g�l=20�j
  set scrolloff=2  " �J�[�\���̏�܂��͉��ɂ́A�Œ�ł����̃I�v�V�����Ɏw�肵�����̍s���\�������
  set winwidth=90 "�E�B���h�E�������J�����g�E�B���h�E�̃f�t�H���g��
  "set splitbelow "�������ő�����ɉ����ɍ��
  "}}}

" ���\���i�C���t�H���[�V�����j
  set shm=filmnrwxToO "<C-g>�ȂǂŁA�\���������̃t�H�[�}�b�g
  set shm+=I "Vim�J�n���Ƀ��b�Z�[�W��\�����Ȃ�
  set foldcolumn=5 "���[�ɐ܂��݂̊K�w��\��
  se fcs=vert:\|  "�󔒂𖄂߂镶��

" ���o���
  set list  "�s������(Tab���)��\������B
  set listchars=tab:>-,trail:_,extends:>,precedes:<,eol:$ " �s�������̕\�����@��
  set showmatch matchtime=1  "���ʂ̑Ή��\������

  set foldtext=FoldCCtext()  "�܂��݃e�L�X�g�����Ŏg���֐�


"}}}


" ����"{{{
"=======
  set wrapscan  "�������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
  set hlsearch  "���������̋���(�n�C���C�g)�\��
  set tags=./tags,tags,../tags  "tags�t�@�C���̓ǂݍ��ݐ�


" w,b�̈ړ��ŔF�����镶��
  "set iskeyword=a-z,A-Z,48-57,_,.,-,>
"grep�R�}���h�Ŏg���v���O���������ɂ��邩
  "set grepprg=internal  " vimgrep ���f�t�H���g��grep�Ƃ���ꍇinternal
  "set grepprg=D:/bnr/cmd/cygwingrep/bin/cyggrep.exe\ -nH ""-n;:�s�ԕ\��-H;:�t�@�C�����\��
  set grepprg=jvgrep ""-n;:�s�ԕ\��-H;:�t�@�C�����\��
  "set grepprg=cyggrep.exe\ -nH

" diff�̐ݒ�"{{{
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

" difforig�i�o�b�t�@�ƌ��t�@�C���ł̍X�V���r�E�ύX�ӏ��\���j���g�p�\�ɂ���B
  command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" �t�@�C���܂��̓o�b�t�@�ԍ����w�肵�č����\���B#�Ȃ痠�o�b�t�@�Ɣ�r
  command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
" �p�b�`�R�}���h
  set patchexpr=MyPatch()
  function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
  endfunction
"}}}"}}}


" �P���ȃX�N���v�g"{{{
"==============
" �t�@�C�����J������O��̃J�[�\���ʒu�ֈړ�
  augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line('$') |
      \   exe "normal! g`\"" |
      \ endif
  augroup END



"grep,tags�̂��߃J�����g�f�B���N�g�����t�@�C���Ɠ����f�B���N�g���Ɉړ�����B
  "if exists('+autochdir')
    ""autochdir������ꍇ�J�����g�f�B���N�g�����ړ�
    "set autochdir
  "else
    ""autochdir�����݂��Ȃ����A�J�����g�f�B���N�g�����ړ��������ꍇ
    "au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
  "endif
"}}}

" ����t�@�C���̎�荞��
"======================
source $VIM/vimfiles/vimrc/privacy.vim

"�\���ݒ�F���̑����h���Estatusline�Ȃ�
source $VIM/vimfiles/vimrc/colorCstm.vim

let maplocalleader = ','
" �L�[�}�b�v"{{{
"==========
  " <Leader>����сA<LocalLeader>�Ɏg���L�[�����߂�
    let mapleader = '\'
  "s��Ǝ��L�[�����<LocalLeader>�ɂ���is���g�������Ƃ���cl�g���΂�����j
    "nnoremap s <nop>
    nnoremap S <nop>
    "nnoremap <C-h> s

"�ݒ�Efix�ɋ߂�"{{{
  "�J�[�\���ړ��𒼊��I��gjgk�ɕς���
    nnoremap j gj|nnoremap k gk|vnoremap j gj|vnoremap k gk
    nnoremap gj j|nnoremap gk k|vnoremap gj j|vnoremap gk k
  "�C���T�[�g���[�h�ł̍폜�R�}���h��undo��L����������
    inoremap <c-h> <c-g>u<c-h>
    inoremap <c-u> <c-g>u<c-u>
    "inoremap <c-w> <c-g>u<c-w>
"}}}

"����L�[�̖������E�Ĕz�u"{{{
  "�C���T�[�g���[�h�ŊԈ���ďo���Ăق����Ȃ��L�[�𖳌��ɂ���"{{{
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
  "�딚���Ăق����Ȃ��L�[�𖳌���
    "�����S�ۑ��I���𖳌����B
      nnoremap ZZ <Nop>
    "���R�[�f�B���O�𖳌����E�Ĕz�u
      noremap zq q
      noremap q <Nop>
      noremap <silent>q :call <SID>close_specialwin()<CR>
        "q�͓��ꑋ�����u�ŕ���R�}���h�ɂ���
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
" �����L�[�}�b�v���y�ȃL�[�}�b�v�Ɋ��蓖�Ċ�����"{{{
  "�g���Â炢�L�[�̍Ĕz�u
    "�g���Â炢':'�ƁA�g�p�p�x���Ⴂ';'','�̏���
      noremap ; :
      "noremap :: '
        "�P�i:����nmap :call���̃R�}���h�ŕs�
      noremap ,; ;
      vnoremap ,; ;
      noremap z; ;
      vnoremap z; ;
      noremap z, ,
      vnoremap z, ,
    "^�������Â炢�̂�-�ɕύX
      noremap - ^
      noremap z- -
    "�}�N����@��z@�ɂ���@�Ō딚���Ȃ�&���R�Ɏg����悤�ɂ���
      noremap z@ @
    "�}�[�N�W�����v�������₷���L�[��
      noremap gm `
      noremap ,, `
    "undo�t���O��ctrl���������ςȂ��ł��L��
      inoremap <c-g><c-u> <c-g>u
"}}}"}}}


"�m�[�}�����[�h�œ��͂�����"{{{
  "���s��}������
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
  "�󔒂���}������a bb a
    nnoremap <S-SPACE> i<Space><Esc>
    "nnoremap <M-SPACE> a<Space><Esc>
    nnoremap <M-SPACE> i<Space><Esc>la<Space><Esc>h
    nnoremap <SID>[space]1 i<Space><Esc>la<Space><Esc>h
    nnoremap <SID>[space]2 i<Space><Esc>lla<Space><Esc>h
    nnoremap <SID>[space]3 i<Space><Esc>llla<Space><Esc>h
    nnoremap <SID>[space]4 i<Space><Esc>lllla<Space><Esc>h
    nnoremap <SID>[space]5 i<Space><Esc>llllla<Space><Esc>h

"}}}


"window/buffer����"{{{
  "�E�B���h�E��o�b�t�@��^�u�y�[�W�����
    "���C�A�E�g��ێ����ăo�b�t�@�����R�}���h
      com! Kwbd let kwbd_bn= bufnr("%")|bn|exe "bdel ".kwbd_bn|unlet kwbd_bn|"�E�B���h�E���C�A�E�g��ێ������܂܃o�b�t�@�����R�}���h
    nmap dv :bd<CR>|"�o�b�t�@�����
    nmap dn :Kwbd<cr>|"���C�A�E�g��ێ����ăo�b�t�@�����
    nmap dc <C-w>c|"�������
    nmap dq <C-w>c|"�������
    nmap d<C-w> <C-w>c|"�������
    nmap dz :tabc<CR>|"�^�u�y�[�W�����
    nmap du :tabc<CR>|"�^�u�y�[�W�����
    nmap dm :tabc<CR>|"�^�u�y�[�W�����
    nmap dgt :tabc<CR>|"�^�u�y�[�W�����
    "nmap cd :Kwbd<cr>|"���C�A�E�g��ێ����ăo�b�t�@�����

  "�E�B���h�E����
    "noremap <silent> <C-w>[ :split|execute "help ".expand('<cword>')<CR>|"�J�[�\���h���[�h��V�K�E�B���h�E��:help����
    "emacs���̑�����
      "noremap <C-w>0 <C-w>c
      "noremap <c-w>1 <c-w>o
      "noremap <C-w>3 <C-w>v
      "noremap <C-w>2 <C-w>s

  "�^�u�y�[�W���� *tabpage*
    "noremap <M-t> gt
    "inoremap <M-t> <Esc>gt
    "nmap <C-t> [\Tabcmd]

    "noremap <silent> <C-t> :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    noremap <silent> <C-w>gt :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    noremap <silent> <C-w>u :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    noremap <silent> <C-w>m :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    nmap <M-t>  <sid>(Tabcmd)
    "noremap <sid>(Tabcmd)<C-t> gt
    noremap <SID>(Tabcmd)<C-t> <C-t>
    "nnoremap <silent> <SID>(Tabcmd)p :<c-u>TabRecent<cr>|"���O�̃^�u�y�[�W�ɖ߂�i�܂��������j
    noremap <silent> <SID>(Tabcmd)0 :tabclose<cr>|"�^�u�y�[�W����
    noremap <silent> <SID>(Tabcmd)1 :tabonly<cr>|"���݃^�u�y�[�W�ȊO�����
    noremap <silent> <SID>(Tabcmd)o :tabonly<cr>|"���݃^�u�y�[�W�ȊO�����
    noremap <silent> <SID>(Tabcmd)c :tabclose<cr>|"�^�u�y�[�W����
    "noremap <silent> <SID>(Tabcmd)w :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    "noremap <silent> <SID>(Tabcmd)d :tab split<CR>|"���݃y�[�W��V�����^�u�y�[�W�ŊJ��
    noremap <silent> <SID>(Tabcmd)fv :tabe $VIM/.vimrc<CR>
    noremap <silent> <SID>(Tabcmd)] :execute "tab tag ".expand('<cword>')<CR>|"�J�[�\���h�^�O��V�K�^�u�y�[�W�ŊJ��
    noremap <silent> <SID>(Tabcmd)[ :execute "tab help ".expand('<cword>')<CR>|"�J�[�\���h���[�h��V�K�^�u�y�[�W��:help����
    noremap <silent> <SID>(Tabcmd)K :execute "tab help ".expand('<cword>')<CR>|"�J�[�\���h���[�h��V�K�^�u�y�[�W��:help����
    noremap <silent> <SID>(Tabcmd)L :call <SID>lingrlaunch_in_newtab()<CR>|"Lingr.vim��ʃ^�u�y�[�W�ŊJ��

  "���^�O�̃o�b�t�@����ю��^�O�^�u�y�[�W�փi�r�Q�[�g
    noremap <silent> <M-h> :bp<CR>
    noremap <silent> <M-l> :bn<CR>
    noremap <silent> [space]h :bp<CR>
    noremap <silent> [space]l :bn<CR>
    noremap gr gT
    noremap <silent> [space]n gt
    noremap <silent> [space]p gT
    "noremap <M-i> <C-^>
  "���̃E�B���h�E�E�O�̃E�B���h�E��
    noremap <M-j> <C-W>w
    noremap <M-k> <C-W>W
    noremap [space]j <C-W>w
    noremap [space]k <C-W>W
    inoremap <M-j> <Esc><C-W>w
    inoremap <M-k> <Esc><C-W>W
  "�G���[���X�g��������
    noremap <C-n> :cn<CR>
    noremap <C-p> :cp<CR>


  " �c������window�̕��𑀍�
    "noremap <C-w>a <C-w>=
    "noremap <C-w>A 5<C-w><lt>
  "window�̍����𑀍�
    noremap <C-w>e 5<C-w>+
    noremap <C-w>E <C-W>=10<C-w>+
    noremap <C-w>y 5<C-w>-
    noremap <C-w>Y <C-W>=10<C-w>-
    noremap <C-w>a <C-w>w20<C-W>+
  "window����
    noremap <silent><C-w>S :botright wincmd s<CR>
  "�����╝��ύX����}�b�v�ɒu��������^�߂�
    "noremap <silent> <C-W>\ :call <SID>RemapWindowCtrl()<CR>
  "���{�V�t�g�ŃE�B���h�E���ύX
    nnoremap <silent> <S-Left>  :5wincmd <<CR>
    nnoremap <silent> <S-Right> :5wincmd ><CR>
    nnoremap <silent> <S-Up>    :5wincmd -<CR>
    nnoremap <silent> <S-Down>  :5wincmd +<CR>


   "�A�v���P�[�V���������ő剻����/���ɖ߂�
    "noremap <M-w>x :simalt ~x<CR>
    "noremap <M-w><M-x> :simalt ~x<CR>
    "noremap <M-w>r :simalt ~r<CR>
    "noremap <M-w><M-r> :simalt ~r<CR>


"�֐�
  "�E�B���h�E����ύX����֐���
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

" �J�[�\���ړ��R�}���h"{{{
  "����̑������X�N���[��������
    noremap <S-A-f> <C-w>w<C-f><C-w>W
    noremap <S-A-b> <C-w>w<C-b><C-w>W
    noremap <S-A-j> <C-w>w<C-e><C-w>W
    noremap <S-A-k> <C-w>w<C-y><C-w>W
  "�����C���f���g���x�����ړ�
    nn z] :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
    nn z[ k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
"}}}

"<space>�L�[�Ŏn�܂�R�}���h"{{{
  noremap [space] <nop>
  nmap <Space> [space]

  "�����C���f���g���x�����ړ�
  nn <C-k>. :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
  nn <C-k>, k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^

  "�܂��ݑ���n"{{{
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


"�m�[�}�����[�h�ł�Tips��ǉ�����"{{{
  "�\���n"{{{
    "<C-g>�ŁA�\���������������D�݂ɂ���
      noremap <C-g> :echo bufname("%")'['&fenc']['&ff']'(strftime("%Y-%m-%d %X",getftime(bufname("%")))) "["b:charCounterCount"��]" "0x"FencB()"\n"FoldCCnavi()<CR>
    ":reg�̒Z�k�R�}���h
      noremap <LocalLeader>:r :reg<CR>
    "Esc�A�łŃn�C���C�g����
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
    "fold�̊J���ȒP�ɂ��� �ins9tks���񂩂�p�N�����j
      nnoremap <expr> <C-h>
            \ col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'zc'
      nnoremap <expr><silent> l
            \ foldclosed(line('.')) != -1 ? 'zo' : 'l'
  "}}}
  "�ҏW�p�R�}���h"{{{
    "���O�̃R�}���h���ēx���s����
      nnoremap c. q:k<Cr>
    "Y�ōs���܂ŃR�s�[����
      map Y y$
    "�^�O������Unite�Œu��������
      nnoremap <buffer> <C-]>
            \ :<C-u>UniteWithCursorWord -immediately tag<CR>
    "'+'��<F4>�ŃN���b�v�{�[�h�A�N�Z�X
      noremap <F4> "+
      map cy "*y
      map zy "*y
      map cp "*p
      map zp "*p
    "���݂̃t�@�C�����㏑���ۑ�����
"      nnoremap <C-q><C-s> :<c-u>w<CR>
"      nnoremap <C-q>s :<c-u>w<CR>
      nnoremap <C-s> :<c-u>w<cr>
      nnoremap ,w :<c-u>w<cr>
      "nnoremap <SID>[space]w :<c-u>w<cr>
      nnoremap <M-w> :<c-u>w<cr>
    "vim���I������
      nnoremap <C-q> :<c-u>qa<CR>
      nnoremap ,q :<c-u>qa<CR>
    "���݃o�b�t�@��write���Ă���Vim���I������
"      nnoremap <C-q><C-w> :if !empty(bufname('%'))|w|endif|qa<CR>
"      nnoremap <C-q>w :if !empty(bufname('%'))|w|endif|qa<CR>
      nnoremap ZZ :if !empty(bufname('%'))|w|endif|qa<CR>
    "�O��ۑ�������Ԃɂ܂ŃA���h�D
      noremap <M-u> :earlier 1f<CR>
    "�Ō�ɕҏW�����Ƃ����I������
      nnoremap gv. `[v`]
      nnoremap gvv gv
    "�y�[�X�g�����e�L�X�g���đI������Bible3-15
      nnoremap <expr> gp '`[' . strpart(getregtype(), 0,1) . '`]'
    "�����I��number����rnu�Ɂ�zf���ɃR�����g���󔒕t����
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
  "�Ǝ��L�[�œ����R�}���h"{{{
    "so %����
      noremap <LocalLeader>S :so %<CR>
    ".vimrc�������ɊJ���R�}���h
      noremap <LocalLeader>. :e $MYVIMRC<CR>
      "noremap <LocalLeader>fv :e $MYVIMRC<CR>
    "junkFile
      "noremap <LocalLeader>fj :JunkFile<CR>
    "vimscripttips
      "noremap <LocalLeader>ft :e ~/vimscripttips.vim<CR>

    "�����R�[�h��ύX����
      noremap <LocalLeader>8   :se fenc=utf-8<CR>
      noremap <LocalLeader>9   :se fenc=cp932<CR>
      noremap <LocalLeader>0   :se fenc=euc-jp<CR>
    "�^�u���̕ύX
      noremap <LocalLeader>2   :set sw=2 sts=2<CR>
      noremap <LocalLeader>4   :set sw=4 sts=4<CR>
    "�t�@�C���^�C�v��ǉ�����
      "�����Ńo�b�N�A�b�v����^�C�v�ɂȂ�
        noremap <LocalLeader>t  :set filetype+=.autowrite<CR>
        noremap <LocalLeader>T  :set filetype-=.autowrite|
              \ if exists('#autowrite')| augroup! autowrite| endif<CR>
"}}}

"}}}

"==========================================

"�C���T�[�g���[�h�ňړ��R�}���h"{{{
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
"�C���T�[�g���[�h�ł̕ҏW"{{{
  "�C���T�[�g���[�h��<C-d>�f���[�g�@�\
    inoremap <C-d> <Del>
  "C-Tab�Ń^�u�}���iTab�P�Ɖ����ŕ⊮�����s����Ƃ��̑�փL�[�j
    inoremap <C-Tab> <Tab>
  "�C���f���g���x�����グ��i�^�u�������j
    inoremap <M-d>  <C-d>
  "2�{�^�u����
    inoremap <C-M-t> <C-t><C-t>
    inoremap <C-M-d> <C-d><C-d>
  "�C���T�[�g���[�h�ŃL�����y�[�X�g
    inoremap <c-g><C-k> <ESC>d$i
    inoremap <F4> <C-r>+
  "i_<C-w>�ł�����n��i�{���͒P��폜�j
    inoremap <C-w> <Esc><C-w>
  "���O�̓��͂�xp����i����ւ���j�E���ʂ�T���o���ē����
    inoremap <C-@> <Esc>hxpa
    function! s:insert_brackets()
      call search('()\|[]\|',,,,)
    endfunction
"}}}


"==========================================

  "�R�}���h���[�h�ł̈ړ��R�}���h"{{{
    "cnoremap <M-h> <Left>
    "cnoremap <M-l> <Right>
    "cnoremap <M-f> <S-Right>
    "cnoremap <M-b> <S-Left>
"}}}
"�R�}���h���[�h�ł�maps
"  cnoremap ; :
"  cnoremap : ;
"�R�}���h���[�h�ł�Tips"{{{
  "�ҏW���̃t�@�C���̏ꏊ���J�����g�f�B���N�g���ɐݒ肷��
    cnoremap <C-x> %:h
  "�R�}���h���[�h�ŃN���b�v�{�[�h���e���y�[�X�g
    cnoremap <F4> <C-r>+


  "�R�}���h���C���E�B���h�E��ʏ�Ŏg��(Hack #161)
    nnoremap <sid>(command-line-enter) q:
    xnoremap <sid>(command-line-enter) q:
    nnoremap <sid>(command-line-norange) q:<C-u>

    nmap c;  <sid>(command-line-enter)
    xmap c;  <sid>(command-line-enter)
    nmap c:  <sid>(command-line-enter)
    xmap c:  <sid>(command-line-enter)

    "�R�}���h���C���E�B���h�E�̃L�[�}�b�v���g���₷���悤�ɕύX"{{{
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
"�r�W���A�����[�h�ł�maps"{{{
  "�C���f���g���Ă��I���������Ȃ�
    "vnoremap > >gv
    "vnoremap < <gv
  "�r�W���A�����[�h��v�ōs���܂őI��
    vnoremap v $h
"}}}
"�r�W���A�����[�h�ł�Tips"{{{
  "0,0,0�Ȃǂ̕��񂾐�����I�����ĘA�Ԃɂ���R�}���hhttp://d.hatena.ne.jp/fuenor/20090907/1252315621
    vnoremap <silent> <F4><C-a> :ContinuousNumber <C-a><CR>
    vnoremap <silent> <F4><C-x> :ContinuousNumber <C-x><CR>
    command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}"}}}
let maplocalleader = "_"

" �R�}���h"{{{
" ========
" �w���v��ʂ̃^�u�ŊJ��
  command! -nargs=* -complete=help H  tab help <args>
"ctags�Ō��݃t�@�C���̃^�O�t�@�C������
  com! -nargs=0 Ctags !ctags %
".vimrc�������[�h����
  command! ReloadVimrc  source $MYVIMRC
"lingr.vim��ʃ^�u�y�[�W�ŊJ��
  command! Lt call <SID>lingrlaunch_in_newtab()
"�p�^�[���ƃt�@�C�������t�ɂ���grep
  command! -complete=file -nargs=+ Perg  call s:perg([<f-args>])
  function! s:perg(args)
    execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
  endfunction
"���݃t�@�C���̂���f�B���N�g����vimgrep
  command! -nargs=+   CurrentGrep  call s:CurrentGrep([<f-args>])
  function! s:CurrentGrep(args)
    execute 'vimgrep' '/'.a:args[0].'/ '.expand(a:args[1]).'/**/*'
    cwindow
  endfunction
"}}}

" �֐�
"=====
"FencB() : <C-g>�Ŏg�p;�J�[�\����̕����R�[�h�̃G���R�[�h�ɉ������\����Ԃ�"{{{
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

"lingr.vim��ʃ^�u�y�[�W�ŋN������֐��B"{{{
  function! s:lingrlaunch_in_newtab()
    tabnew
    LingrLaunch
    exe 3 . "wincmd w"
  endfunction
"}}}

"s:bracketTour �C���T�[�g���[�h�p�B�ȑO�̊��ʂɔ��"{{{
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

"�w�肵���X�N���v�g�t�@�C���̃X�N���v�g���[�J���ϐ����擾���� - ���ӂ��ӂ�"{{{
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
" �e��v���O�C���ݒ�"{{{
"===================
" �P���ɁA�O���[�o���ϐ�������ݒ肵������"{{{
  "�`�F���W���O�ŃG���g���쐬���ɕ\������郆�[�U��
    let g:changelog_username ="siic <>"
  "vimball.vim�ŃC���X�g�[������v���O�C���̃C���X�g�[�����ύX����
    "let g:vimball_home = "$CFGHOME/bundle/vba"
  "vimwiki.vim�Ŏg��wiki�̃��X�g
    let g:vimwiki_list = [{'path':'~/dc/stgmemwk/','index':'stgmemwk' },{'path':'~/dc/siicwk/','index':'siicwk' },{'path':'~/dc/yukokwk/','index':'yukokwk' },{'path':'~/dc/kywrd/','index':'kywrd' },]

  "buftabs.vim�i�X�e�[�^�X���C���Ƀo�b�t�@���X�g��\���j
    let g:buftabs_only_basename=1  "�o�b�t�@�^�u�Ƀp�X���ȗ����ăt�@�C�����̂ݕ\������
    "let g:buftabs_in_statusline=1  "�o�b�t�@�^�u���X�e�[�^�X���C�����ɕ\������
    ""let g:buftabs_active_highlight_group="Visual"  "�J�����g�o�b�t�@�𕪂���Ղ�����
    ""let g:buftabs_marker_start = "["
    ""let g:buftabs_marker_end = "]"       
    " "" �X�e�[�^�X���C���ɏ]����vim�ŕ\������Ă������e���\���i�������j
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



" �P���ɁA�}�b�s���O������ݒ肵������"{{{
  "smartword.vim�̃R�}���h�ɒu��������
    "map w  <Plug>(smartword-w)
    "map b  <Plug>(smartword-b)
    "map e  <Plug>(smartword-e)
    "map ge  <Plug>(smartword-ge)
  "camelcasemotion.vim�̃R�}���h�ɒu��������
    "�O���E����ړ����L�������P�[�X�P�ʂɂ���
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    "omap <silent> e <Plug>CamelCaseMotion_ie
    "�e�L�X�g�I�u�W�F�N�g�ɑΉ�������
    "omap <silent> iw <Plug>CamelCaseMotion_iw
    "vmap <silent> iw <Plug>CamelCaseMotion_iw
    omap <silent> ib <Plug>CamelCaseMotion_ib
    vmap <silent> ib <Plug>CamelCaseMotion_ib
    omap <silent> ie <Plug>CamelCaseMotion_ie
    vmap <silent> ie <Plug>CamelCaseMotion_ie
  "h1mesuke/textobj-wiw
    let g:textobj_wiw_no_default_key_mappings = 1 "�f�t�H���g�ŗp�ӂ���Ă�}�b�s���O�𖳌���
    "map @w <Plug>(textobj-wiw-n)
    "map @b <Plug>(textobj-wiw-p)
    "map @e <Plug>(textobj-wiw-N)
    "map @ge <Plug>(textobj-wiw-P)
    vmap a@ <Plug>(textobj-wiw-a)
    vmap i@ <Plug>(textobj-wiw-i)
    omap a@ <Plug>(textobj-wiw-a)
    omap i@ <Plug>(textobj-wiw-i)
  "openbrowser.vim�i�J�[�\������URL,URI���u���E�U�ŊJ���A�܂��͒P����u���E�U�Ō�������j
    nmap <LocalLeader>xo <Plug>(openbrowser-smart-search)
    vmap <LocalLeader>xo <Plug>(openbrowser-smart-search)
  "ambicmd.vim(�R�}���h���[�h�ň��̃��[���ŃR�}���h�⊮
    cnoremap <expr> <C-l> ambicmd#expand("\<Right>")
  "textmanip.vim�i�����I�ȃe�L�X�g�̈ړ��E�����j
    " �I�������e�L�X�g�̈ړ�
      vmap <C-j> <Plug>(textmanip-move-down)
      vmap <C-k> <Plug>(textmanip-move-up)
      vmap <C-h> <Plug>(textmanip-move-left)
      vmap <C-l> <Plug>(textmanip-move-right)
    " �s�̕���
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
    "�}�[�N��S�폜
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
    sign define SearchStart text=�� texthl=Search
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
      if a:nN "nN�L�[�ł̌���
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

  "�S�R�֌W�Ȃ����ǓƎ��R�����g�A�E�g�o�C���h�B���t�@�N�^�����O���Ɉڂ��ւ���
  nmap <silent> gcd :call <SID>CommToggleDelMarker()<CR>
  function! s:CommToggleDelMarker() "{{{
    let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cmsend = matchstr(&cms,'\V%s\zs\.\+')
    let crrstr = getline('.')
    if matchstr(crrstr, '\[��]') == '[��]'
      call setline('.',substitute(crrstr, cmsstart.'\[��]', '', 'g'))
    else
      exe 'normal! I'.cmsstart.'[��]'
    endif
  endfunction "}}}
  nmap <silent> gco :call <SID>CommAddStar(0)<CR>
  nmap <silent> gcO :call <SID>CommAddStar(1)<CR>
  function! s:CommAddStar(append) "{{{
    let cmsstart = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cmsend = matchstr(&cms,'\V%s\zs\.\+')
    if a:append
      exe 'normal! O'.cmsstart.'��'
    else
      exe 'normal! o'.cmsstart.'��'
    endif
  endfunction "}}}



"}}}

"vim-vcs.vim
  "�ݒ�p�����ϐ�
"    let g:vcs#config = {'alias':{'st':'status'},}

"yankring.vim"{{{
"    "�O���[�o���ϐ�
"        let g:yankring_max_history = 50
"        let g:yankring_history_dir = '$VIM'
"        let g:yankring_clipboard_monitor = 1
"    "�}�b�s���O
"        noremap <Leader>y :YRShow<CR>
"}}}

"utl.vim�i�����N��t�@�C�����J������ʃv���O�����ɓn���j"{{{
  "Enter�Ń����N����J��
    "nnoremap <silent> <cr> :silent exe 'Utl'<cr>
  "URL �� Firefox �ŊJ��(URL���܂܂��s�� \gu �j
    "let g:utl_rc_app_browser = 'silent !start C:\Program Files\Mozilla Firefox\firefox.exe %u'
  "�f�B���N�g�������ӂŊJ���i :Gu . �ŃJ�����g�f�B���N�g�����J����j
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
    "vimp�݂����ȃq���g�ړ�
  NeoBundle 'thinca/vim-fontzoom'
  NeoBundle 'pocket7878/presen-vim'
  "NeoBundle 'nathanaelkane/vim-indent-guides'
    "#Bible4-14 �C���f���g���x�����n�C���C�g�\��

  NeoBundle 'thinca/vim-visualstar'
    "#Bible3-14
  NeoBundle 'mattn/gist-vim'
  NeoBundle 'tyru/vim-altercmd'
  NeoBundle 'h1mesuke/textobj-wiw'


  "NeoBundle 'https://github.com/kien/ctrlp.vim.git'
    "�J�����g�t�@�C���ɃA�N�Z�X����

  "NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'https://github.com/thinca/vim-openbuf.git'
    "unite-vim_hacks������Ɉˑ����Ă���ۂ�
  NeoBundle 'choplin/unite-vim_hacks'
    "openbuf����Ȃ���unite���G���[��f���đ��̃v���O�C�����g�p�s�\�ɂȂ�
  "NeoBundle 'git@github.com:vim-jp/vimdoc-ja.git'
  NeoBundle 'https://github.com/tyru/open-browser.vim.git'
  NeoBundle 'kana/vim-tabpagecd'

  "NeoBundle 'thinca/vim-tabrecent'
    "���O�ɂ����^�u�֖߂�R�}���h
  NeoBundle 'https://github.com/mrtazz/simplenote.vim.git'
    "�I�����C���m�[�gsimplenote���g��
  NeoBundle 'https://github.com/tacroe/unite-mark.git'
    "�}�[�N�ꗗ��\��
  NeoBundle 'https://github.com/tpope/vim-speeddating.git'
  NeoBundle 'https://github.com/ujihisa/mdv.git'
    "VimHacks�Ŏg���Ă���g��Markdown
  NeoBundle 'https://github.com/ujihisa/neco-look.git'
  NeoBundle 'https://github.com/mattn/wwwrenderer-vim.git'
  NeoBundle 'https://github.com/mattn/webapi-vim.git'
  NeoBundle 'https://github.com/t9md/vim-textmanip.git'
    "�e�L�X�g�𒼊��I�Ɉړ�����
  NeoBundle 'https://github.com/vim-scripts/DrawIt.git'
    "�}��`�ʂ��� #Bible5-4
  NeoBundle 'https://github.com/vim-scripts/Align.git'
    "���@�\�ȃe�L�X�g�t�@�C�����`�c�[�� #Bible5-11

  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'tomtom/ttoc_vim'
  NeoBundle 'tomtom/tlib_vim'
  NeoBundle 'motemen/hatena-vim'
  "NeoBundle 'vim-scripts/vimwiki'

  "NeoBundle 'https://github.com/fuenor/qfixhowm.git'
  NeoBundle 'gregsexton/gitv'
  NeoBundle 'kana/vim-smartinput'
    "insertmode�őΉ����銇�ʂ�⊮����

  filetype plugin indent on  "�t�@�C�������on�ɂ���
"}}}

"pathogen.vim"{{{
  filetype off "��x�t�@�C�������off�ɂ��Ȃ���ftdetect�����[�h���Ă���Ȃ��̂ŁB
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on  "�t�@�C�������on�ɂ���
"}}}

"smartchr
  "autocmd FileType vim, inoremap <buffer> <expr> = smartchr#one_of(' = ', ' == ', '=')
  "cnoremap <expr> [  smartchr#one_of('[', '\[', {'ctype': '/?'})


"savevers.vim�Ő���ʃo�b�N�A�b�v�����"{{{
  "�o�b�N�A�b�v�t�@�C���̐ݒ�" savevers.vim�̂��߂Ƀp�b�`���[�h�ɂ��܂�
    set patchmode=.vbcu
  "�J���}�ŋ�؂�ꂽ�o�b�N�A�b�v���쐬����t�@�C�����ł� "*.c,*.h,*.vim"
    let savevers_types = "*"
  "�o�b�N�A�b�v�t�@�C�����������܂��f�B���N�g���ł� �����ł́A�I�v�V����"backupdir"�Ɠ����f�B���N�g���ɂ��Ă��܂�
    let savevers_dirs = &backupdir
  "�o�b�N�A�b�v�t�@�C���Ƃ̔�r�ŃE�B���h�E�̃T�C�Y��ύX����ꍇ��0
    let versdiff_no_resize=1
  "�E�B���h�E�̃T�C�Y��ύX����ꍇ�ɂǂꂾ���̕��܂ł������邩
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
  "lynx.exe �̐�΃p�X
    let s:lynx = "D:/bnr/txe/vim/lynx.exe"
  "lynx.cfg �̐�΃p�X
    let s:cfg  = "D:/bnr/txe/vim/lynx.cfg"
  let g:ref_alc_cmd = s:lynx.' -cfg='.s:cfg.' -dump %s'
  "let g:ref_alc_cmd = ':wwwrenderer#render("%s")'
  let g:ref_phpmanual_path = 'D:/dict/php-chunked-xhtml/'
  let g:ref_alc_start_linenumber = 47 " �J�����Ƃ��̏����J�[�\���ʒu
  let g:ref_alc_encoding = 'Shift-JIS' " ������������Ȃ炱���ŕ����R�[�h���w�肵�Ă݂�

  nmap <LocalLeader>xra :<C-u>Ref alc<Space>
  au FileType ref-* nnoremap <silent><buffer>   q   :close<CR>
  nnoremap <silent> <LocalLeader>xrK :<C-u>call ref#jump('normal', 'alc')<CR>
  vnoremap <silent> <LocalLeader>xrK :<C-u>call ref#jump('visual', 'alc')<CR>
"}}}

"unite.vim"{{{
  "���̓��[�h�ŊJ�n����
    "let g:unite_enable_start_insert=1
  "unite-history/yank��L��������i�����N�����e�L�X�g�̗����j
    let g:unite_source_history_yank_enable =1
  "grep�R�}���h
    let g:unite_source_grep_command = 'jvgrep'
  "���̕\���ʒu
    let g:unite_split_rule = 'botright'
  "���̐F�ݒ�
    "let g:unite_cursor_line_highlight = 'Search'
    "let g:unite_abbr_highlight = 'Normal'
  nnoremap <silent> <LocalLeader>aa :<C-u>UniteBookmarkAdd<CR>
  "�o�b�t�@�ꗗ�E�t�@�C���ꗗ�E���W�X�^�ꗗ�Emru�i�ŋߗ��p�����t�@�C���j�ꗗ�E�S�Ĉꗗ
    nnoremap <silent> <LocalLeader>ga :<C-u>Unite bookmark<CR>
    "nnoremap <silent> <Leader>b :<C-u>Unite buffer -auto-preview<CR>
    nnoremap <silent> <LocalLeader>gg :<C-u>Unite buffer file_mru -start-insert<CR>
    nnoremap <silent> <LocalLeader>gb :<C-u>Unite buffer_tab<CR>
    "nnoremap <silent> <LocalLeader>gb :<C-u>Unite buffer -start-insert<CR>
    nnoremap <silent> <LocalLeader>gf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> <LocalLeader>gr :<C-u>Unite -buffer-name=register register<CR>
    nnoremap <silent> <LocalLeader>gm :<C-u>Unite file_mru<CR>
    nnoremap <silent> <LocalLeader>ga :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
  "Unite�̃\�[�X���̑�
    "Unite mark
      nnoremap <silent> <LocalLeader>g' :<C-u>Unite mark<CR>
      let g:unite_source_mark_marks = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012'
    "unite-buffer_deleted
      nnoremap <silent> <LocalLeader>gu :<C-u>Unite buffer_deleted<CR>
    "unite-history/yank�i�����N���������j
      nnoremap <silent> <LocalLeader>gy :<C-u>Unite history/yank<CR>
      nnoremap <silent> <M-y> :<C-u>Unite history/yank<CR>
    "unite-outline
      nnoremap <silent> <LocalLeader>go :<C-u>Unite outline<CR>
    "unite-font
      nnoremap <silent> <LocalLeader>g,f :<C-u>Unite font<CR>
    "unite-outline_indent
      nnoremap <silent> <LocalLeader>gi :<C-u>Unite outline_indent<CR>
      nnoremap <silent> <LocalLeader>gI :<C-u>Unite outline_indent:a<CR>
  "�E�B���h�E�𕪊����ĊJ��
    au FileType unite nnoremap <silent><buffer><expr>   <C-k>   unite#do_action('split')
    au FileType unite inoremap <silent><buffer><expr>   <C-k>   unite#do_action('split')
  "�E�B���h�E���c�ɕ������ĊJ��
    au FileType unite nnoremap <silent><buffer><expr>   <C-l>   unite#do_action('vsplit')
    au FileType unite inoremap <silent><buffer><expr>   <C-l>   unite#do_action('vsplit')
  "ESC�L�[��2�񉟂��ƏI������
    "au FileType unite nnoremap <silent><buffer> <ESC><ESC> <C-w>z:bd<CR>
    au FileType unite imap <silent><buffer> <C-q> <Plug>(unite_exit)
  "�m���<c-j>�ł�
    "au FileType unite noremap <silent> <buffer> <expr> <C-j> unite#do_action('open')
    au FileType unite nmap <silent><buffer> <C-j> <Plug>(unite_do_default_action)
    au FileType unite imap <silent><buffer> <C-j> <Plug>(unite_do_default_action)
    au FileType unite nmap <silent><buffer> <C-k> <Plug>(unite_quick_match_default_action)
    au FileType unite nnoremap <buffer><expr> <C-s>      unite#mappings#set_current_filters(
      \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
"}}}



"neocomplcache.vim"{{{
  "�O���[�o���ϐ�
    let g:neocomplcache_enable_at_startup = 1 "�l�I�R���L����
     let g:neocomplcache_enable_prefetch=1 "�ȑO�̃o�[�W�����̋����ɂ���B
    "let g:neocomplcache_disable_auto_complete = 1 "�����⊮�𖳌��ɂ���
    let g:neocomplcache_enable_smart_case = 1 "�X�}�[�g�P�B�X�i�啶�����܂܂�Ă���ꍇ�͋�ʂ���j
    let g:neocomplcache_enable_underbar_completion = 1 "�A���_�[�o�[_����؂�Ƃ����B������
    let g:neocomplcache_enable_camel_case_completion = 1 "�啶������؂�Ƃ����B������
    "let g:neocomplcache_enable_auto_select = 1 "�|�b�v�A�b�v���o���Ƃ������I�Ɉ�ԏ�̌���I�����
    let g:neocomplcache_auto_completion_start_length = 1 "�|�b�v�A�b�v���o���n�߂镶�����i�����l2�j
    let g:neocomplcache_min_syntax_length = 3 "�V���^�b�N�X�ŏ��L���b�V��������
    let g:neocomplcache_snippets_dir = $VIM.'/settings/neocon_snippets' "�X�j�y�b�g�v���O�C���f�B���N�g��
    let g:neocomplcache_temporary_dir = $VIM.'/settings/.neocon' "�l�I�R���̈ꎞ���������o���f�B���N�g��
    "let g:neocomplcache_enable_quick_match = 1 "-�������ƕ⊮�̉��ɏȓ��͉p������\��
    let g:neocomplcache_min_keyword_length = 2 "�⊮���s���L�[���[�h�̍ŏ������i�����l4�j
    "�l�I�R�������Ή��̃t�@�C���^�C�v�ł̃L�[���[�h���W�p�^�[���i�t�@�C���^�C�v�ʂɎw��j
      if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
      endif
      let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "�P��̃w�b�h\�P����\�����镶���i������A���t�@�x�b�g�j*
      "let g:neocomplcache_keyword_patterns['sfd'] = '\c\[:\%(\h\w*:\]\)\?\| &\h[[:alnum:]_:]*\| \$\h\w*\|-\h\w*=\?\| <SID>\%(\h\w*(\?\)\?\| <Plug>([^)]*)\?\| <\h[[:alnum:]_-]*>\?\| \h[[:alnum:]_:#]*\%(!\| ()\?\)\?\| `\h\w*'
  " �t�@�C���^�C�v�Ɏ����t�@�C���p�X���֘A�Â���f�B�N�V���i���isfd�̃^�O�t�@�C���ۊǂɖ𗧂����j
      let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vim' : $VIM.'/settings/neocon_dict/vim.dict',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

  "�}�b�s���O
    "Vim�W���̕⊮���l�I�R���ɒu��������
      "�t�@�C�����⊮
        inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
      "�I���j�⊮
        inoremap <expr><C-x><C-o>  neocomplcache#manual_omni_complete()
      "�L�[���[�h�⊮
        inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()

      "�l�I�R����{����
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? �g\<Plug>(neocomplcache_snippets_expand)�h : pumvisible() ? �g\<C-n>�h : �g\<TAB>�h
        "�J�[�\���O�̕����񂪃X�j�y�b�g�̃g���K�ł���Ȃ�A�X�j�y�b�g��W�J����
          imap <expr><C-s>   neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
        "���̋��ʉӏ��܂ŕ⊮����
          inoremap <expr><C-l>     neocomplcache#complete_common_string()
        "���肵�ă|�b�v�A�b�v�����
          inoremap <expr><C-y>  neocomplcache#close_popup()
        "�L�����Z�����ă|�b�v�A�b�v�����
          "inoremap <expr><C-e>  neocomplcache#cancel_popup()
        "�l�I�R���ɂ���đ}�������⊮�����ɖ߂�
          inoremap <expr><C-x><C-g>     neocomplcache#undo_completion()
          inoremap <expr><C-x>g     neocomplcache#undo_completion()
      "�|�b�v�A�b�v���o�Ă���Ƃ��̋��������K�ɂ���
        "�o�b�N�X�y�[�X�����Ƃ��|�b�v�A�b�v�����
          "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
      "�l�I�R���ݒ�ύX����
        "�X�j�y�b�g��ҏW����
          noremap ,Ns :<C-u>vertical belowright NeoComplCacheEditSnippets<CR>
"}}}

"vimshell.vim"{{{
  nmap <LocalLeader>xS <Plug>(vimshell_split_switch)
  nmap <LocalLeader>xs :setglobal fileencoding=utf-8|  VimShellTab<CR>
  nmap <LocalLeader>x,s <Plug>(vimshell_switch)
  "<Esc>�A�łŉ����ƉB���
    au FileType vimshell nmap <silent> <buffer> <ESC><ESC> <Plug>(vimshell_hide)
    au FileType vimshell nmap <silent> <buffer> <C-j> <Plug>(vimshell_enter)
    au FileType vimshell imap <silent> <buffer> <C-j> <Plug>(vimshell_enter)
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")' "���[�U�v�����v�g�ɃJ�����g�f�B���N�g����\��
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
  " netrw�͏��tree view
  let g:netrw_liststyle = 3

"vimfilter
  let g:vimfiler_as_default_explorer = 1




"  "--------------QFixHowm----------------"{{{
let QFixHowm_Key           = '_'
" �L�[�}�b�v(2�X�g���[�N��)
let QFixHowm_KeyB          = ''

" �����t�@�C���̕ۑ��ꏊ
let howm_dir               = '~/howm'
" �����t�@�C���̃t�@�C����
let howm_filename          = "%Y/%m/%Y-%m-%d-%H%M%S.txt"
" �����t�@�C���̃G���R�[�f�B���O
let howm_fileencoding      = &enc
" �����t�@�C���̉��s�R�[�h
let howm_fileformat        = &ff
" �t�@�C���^�C�v�w��
let QFixHowm_FileType      = 'howm_memo'


"�t�@�C��/�e���v���[�g"{{{
"�u�V�K�G���g���̃e���v���[�g�v

" �N�C�b�N�����t�@�C��
let QFixHowm_QuickMemoFile = 'Quickmemo.txt'
" ���L�����t�@�C��
let QFixHowm_DiaryFile     = '%Y/%m/%Y-%m-%d-000000.txt'
" �y�A�t�@�C���ۑ��ꏊ
let QFixHowm_PairLinkDir   = 'pairlink'
" �L�[���[�h�ۑ��t�@�C��
let QFixHowm_keywordfile   = '~/.howm-keys'

" �^�C�g���L��
let QFixHowm_Title = '='
" �e���v���[�g
let QFixHowm_Template = [
  \ "%TITLE% %TAG%",
  \ "%DATE%",
  \ ""
\]
" �e���v���[�g(�J�[�\���ړ�)
let QFixHowm_Cmd_NewEntry = "$a"
" �e���v���[�g�ɑ}�������^�O
let QFixHowm_DefaultTag   = ''
"}}}
"�I�[�g�����N�Ńt�@�C�����J��
let QFixHowm_Wiki = 1
" Wiki�X�^�C�������N�͑Ή��t�@�C�����J���ꍇ�̕ۑ��f�B���N�g��
let QFixHowm_WikiDir = 'wiki'


"  " QFixHowm�ŁA�������Ƃ�
"  let howm_dir = '$VIM/siic/howm'
"  let howm_filename = '%Y-%m-%d-%H%M%S.howm'
"  let howm_fileencoding = 'cp932'
"  let howm_fileformat = 'dos'
"  
"  "Howm�R�}���h�L�[�}�b�v
"  let QFixHowm_Key = ','
"  "Howm�R�}���h��2�X�g���[�N�ڃL�[�}�b�v
"  let QFixHowm_KeyB = ''
"  
"  "�N�C�b�N�����t�@�C����
"  "let QFixHowm_QuickMemoFile = 'Qmem-00-%Y-%m-00-000000.howm'
"  let QFixHowm_QuickMemoFile = 'Qmem001.howm'
"  
"  "�I�[�g�����N��̃^�O�W�����v���g�p����/���Ȃ�
"  let QFixHowm_UseAutoLinkTags = 1
"  "tags�t�@�C�����쐬����f�B���N�g��
"  let QFixHowm_TagsDir = howm_dir
"  
"  
"  "Quickfix�E�B���h�E��ON/OFF
"  "���̐ݒ��ł�gs���g�p�ł��Ȃ��Ȃ�܂��B�D�݂ɉ����ĕύX���ĉ������B
"  nnoremap <silent> ,q :ToggleQFixWin<CR>
"  
"  " �J�e�S���^�O���[�U�A�N�V�������b�N([ ]�̏��<CR>�ŃJ�e�S���؂�ւ�)
"  nnoremap <silent> g,ht :<C-u>call QFixHowmCreateNewFileWithTag('[ ]')<CR>
"  let QFixHowm_UserSwActionLock = ['[ ]', '[:private]', '[:work]', '[:vim]']
"  
"  
"  "---==�^�C�g����t����̂��ʓ|�ȏꍇ==---
"  "�^�C�g���ɉ���������Ă��Ȃ��ꍇ�A�G���g��������K���ȕ���T���Đݒ肷��B
"  "�������͔��p���Z�ōő� QFixHowm_Replace_Title_len �����܂Ŏg�p����B0�Ȃ牽�����Ȃ��B
"  let QFixHowm_Replace_Title_Len = 64
"  
"  "�ΏۂɂȂ�̂� QFixHowm_Replace_Title_Pattern �̐��K�\���Ɉ�v����^�C�g���p�^�[���B
"  "�f�t�H���g�ł͎��̐��K�\�����ݒ肳��Ă���B
"  "let QFixHowm_Replace_Title_Pattern = '^'.escape(g:QFixHowm_Title, g:QFixHowm_EscapeTitle).'\s*\(\[[^\]]*\]\s*\)\=$'
"  
"  "�V�K�G���g���̍ہA�{�����珑���n�߂�B
"  "let QFixHowm_Cmd_New = "i"." \<CR>\<C-r>=strftime(\"[%Y-%m-%d %H:%M]\")\<CR>\<CR>\<ESC>$a"
"  ",C�ő}�������V�K�G���g���̃R�}���h
"  "let QFixHowm_Key_Cmd_C = "o<ESC>".QFixHowm_Cmd_New"}}}


""  "--------------VimOrganizer----------------"{{{
""  " stuff below here is necessary for VimOrganizer to work right
""  "
""  " use this colorscheme or integrate it into an existing colorscheme
""  ""colorscheme org_dark	""�J���[�X�L�[���̐ݒ�́A.gvimrc�ɐ錾����
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
""   "" autocmd! ���݂̃O���[�v*.org�ɑ΂��邷�ׂĂ�autocommand���폜
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


" �X�N���b�`
" ==========

"lingr�p�B�󔒍폜�֐��B
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

"'%'�R�}���h���g������#Bible4-10
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

"�I�����G���[�m�F
set verbosefile=/tmp/vim.log
