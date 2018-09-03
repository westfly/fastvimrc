" VIM 优秀插件介绍网站: http://vimawesome.com/
" set the runtime path to include Vundle and initialize
" 将该工程软链到 ~/.vim下
set nocompatible
"filetype off " required! turn off
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
call vundle#begin()
" inspired by spf13, 自定义需要的插件集合
if !exists('g:bundle_groups')
    "let g:bundle_groups=['python', 'php', 'golang', 'shell', 'javascript', \
    "			 'nginx', 'markdown', 'html', 'tmux', 'json']
    let g:bundle_groups=['json', 'golang']
endif
if count(g:bundle_groups, 'golang')
    " 1. vim a.go
    " 2. :GoInstallBinaries
    " vimgo  https://github.com/fatih/vim-go
    Bundle 'fatih/vim-go', {'for': 'go'}
    Plugin 'jnwhiteh/vim-golang'
    " golang
    let g:go_highlight_operators = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
endif
if count(g:bundle_groups, 'json')
    "json
    Bundle 'elzr/vim-json', {'for': 'json'}
endif
if count(g:bundle_groups, 'tmux')
    " tmux
    " For tmux navigator Ctrl-hjkl
    Plug 'christoomey/vim-tmux-navigator'
endif
if count(g:bundle_groups, 'nginx')
    Bundle 'evanmiller/nginx-vim-syntax'
endif
if count(g:bundle_groups, 'php')
    Bundle 'spf13/PIV'
endif
Plugin 'VundleVim/Vundle.vim'
" 文件树
Plugin 'scrooloose/nerdtree'
" Fuzzy file, buffer, mru, tag, etc finder
" Ctrl + p / Esc 打开和关闭
Plugin 'ctrlpvim/ctrlp.vim'
" 主题
Plugin 'sickill/vim-monokai'
" 状态栏
Plugin 'bling/vim-airline'
" 自动补齐括号/引号
Plugin 'jiangmiao/auto-pairs'
" 代码注释
Plugin 'scrooloose/nerdcommenter'
call vundle#end()

" [[ vim-airline ]]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" 自定义的自动补全 包括一些自动高亮的插件"
Plugin 'westfly/vim-rabbit'

" syntastic
if v:version < 800
    Plugin 'scrooloose/syntastic'
else
  " 重启 :YcmRestartServer
    Plugin 'Valloric/YouCompleteMe'
    if has("python3")
        let g:ycm_server_python_interpreter='/usr/local/bin/python3'
    else
        let g:ycm_server_python_interpreter='/usr/bin/python'
    end
    let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
    Plugin 'w0rp/ale'
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"               自定义函数
""""""""""""""""""""""""""""""""""""""""""""""""
" 当新添加的shell脚本添加可执行权限
function AddExecuteMode()
  if getline(1) =~ "^#!/bin/*"
    silent !chmod a+x <afile>
  endif
endfunction
au BufWritePost * call AddExecuteMode()

""""""""""""""""""""""""""""""""""""""""""""""""
"                Color & Front solarized
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

" 快速去行尾空格 [, + <Space>]
" Plug 'bronson/vim-trailing-whitespace'
" easyalign
""""""""""""""""""""""""""""""""""""""""""""""""
" 快速赋值语句对齐
""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'junegunn/vim-easy-align'
"http://www.wklken.me/posts/2015/06/07/vim-plugin-easyalign.html
" vi\a[=,space,,etc]
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" quick movement
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""
"   更高效的移动 [,, + w/fx/h/j/k/l]
""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Lokaltog/vim-easymotion'
" 更改快捷键 http://www.dreamxu.com/books/vim/plugin/vim-easymotion.html
map f <Plug>(easymotion-prefix)
map ff <Plug>(easymotion-f)
map fs <Plug>(easymotion-s)
map fl <Plug>(easymotion-lineforward)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)
map fh <Plug>(easymotion-linebackward)
" 忽略大小写
let g:EasyMotion_smartcase = 1
