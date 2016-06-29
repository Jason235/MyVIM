"定义快捷键的前缀 <Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 跟据侦测到的不同类型加载对应插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap LB 0
nmap LS $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴版类容粘贴至 VIM
nmap <Leader>p "+p
" 定义快捷键关闭当前窗口类容
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口类容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口类容并退出
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 VIM 
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜锁时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令模式智能补全
set wildmenu

set exrc
set secure

filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

"set colorcolumn=110
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止拆行
set nowrap

syntax enable
syntax on
set background=dark
colorscheme solarized
" colorscheme molokai
" colorscheme phd

set guifont=Hack

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 基于缩进或者语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 win 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf 
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

" filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()


" filetype plugin indent on

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
"let g:airline_left_sep="\u2b80"
"let g:airline_left_alt_sep="\u2b81"
"let g:airline_right_sep="\u2b82"
"let g:airline_right_alt_sep="\u2b83"
"let g:airline_symbols.linenr="\u2b61"
"let g:airline_symbols.branch="\u2b60"
"let g:airline_symbols.readonly="\u2b64"
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
"let g:airline#extensions#tabline#left_sep="\u2b80"
"let g:airline#extensions#tabline#left_alt_sep="\u2b81"


" 缩进
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

filetype plugin indent on



