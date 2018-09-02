"--------------------------------------------------------
"                     基本设置                          |
"--------------------------------------------------------
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set wrap                    " Wrap lines
set shiftwidth=2            " 设定 << 和 >> 命令移动时的宽度为 2
set softtabstop=4           " 使得按退格键时可以一次删掉4个空格
set tabstop=4               " 设定 tab 长度为 4
set autoindent              " auto indent
set expandtab
set mouse=a                 " Have the mouse enabled all the time:
set nobackup                " 覆盖文件时不备份
set autoread                " auto read when file changed outside
"set autowrite
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
filetype on                 " 检测文件的类型
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable
if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
  set t_Co=256
else
  set t_Co=88
endif

" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif
" 配置多语言环境
if has("multi_byte")
  " Set fileencoding priority
  if getfsize(expand("%")) > 0
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
  else
    set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
  endif
  " UTF-8 编码
  set encoding=utf-8
  set termencoding=utf-8
  "set termencoding=gbk      "终端的编码
  "let &termencoding=&encoding
  set formatoptions+=mM
  set fencs=utf-8,gbk
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
    set helplang=cn
  endif
  if has("win32")
    "source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "language messages zh_CN.utf-8
    language messages en_US.utf-8
    set langmenu=none  "设置英文菜单，貌似无效哦
  endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
if has("win32")
  let Tlist_Ctags_Cmd=$VIMRUNTIME.'/ctags.exe'
else
  let Tlist_Ctags_Cmd='/usr/bin/ctags'
endif
"""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
"set foldmethod=indent      " 设置缩进折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=100      " 设置折叠层数为
"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
" vimrc文件修改之后自动加载, windows
"autocmd! bufwritepost _vimrc source %
"vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
"command! ZoomToggle call s:ZoomToggle()
"nnoremap <silent> <leader>z :ZoomToggle<CR>
