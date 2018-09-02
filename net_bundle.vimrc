" VIM 优秀插件介绍网站: http://vimawesome.com/
" set the runtime path to include Vundle and initialize
" 将该工程软链到 ~/.vim下
set nocompatible
filetype off " required! turn off
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
    Plug 'fatih/vim-go', {'for': 'go'}
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
