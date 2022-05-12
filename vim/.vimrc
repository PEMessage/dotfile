" File: .vimrc
" Author: PEMessage
" Description: This is my vim8+ configuratio
" Last Modified: 4, 24, 2022
" ---------------------------------------------
" VIM-Plug Auto Install and Detect
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set termguicolors

" Basic Setting Zone
"
set nocompatible " 禁用 vi 兼容模式
set helplang=cn  " 设置中文帮助手册
set nowrap       " 关闭自动换行
set ruler        " 显示光标位置

" Coding Zone
"
if has('multi_byte')
    " 内部工作编码
    set encoding=utf-8

    " 文件默认编码
    set fileencoding=utf-8

    " 打开文件时自动尝试下面顺序的编码
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif




" Search Setting Zone
"
set smartcase   " 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set incsearch   " 查找输入时动态增量显示查找结果
set hlsearch    " 高亮搜索内容
 

" Syntax Setting Zone
"
if has('syntax')  
    syntax enable 
    syntax on 
endif

" Tab and Indent Setting 
set tabstop=4                  " Tab 长度，默认为8
set smarttab                   " 根据文件中其他地方的缩进空格个数来确定一个tab是多少个空格
set expandtab                  " 展开Tab

set shiftwidth=4               " 缩进长度，设置为4
set autoindent                 " 自动缩进
set cindent                    " C语言更好的缩进

set backspace=eol,start,indent " 类似所有编辑器的删除键

if has('autocmd')
	filetype plugin indent on  " 允许 Vim 自带脚本根据文件类型自动设置缩进等
endif

" Tab Line Setting Zone
set nohidden



" KeyBinding Setting Zone ( Input Mode  )
inoremap jj <ESC>

" KeyBinding Setting Zone ( Normal Mode  )
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

nnoremap <leader>rc :w<CR> :source $MYVIMRC<CR>
nnoremap <leader>` :nohlsearch<CR>
nnoremap <leader>l :Leaderf line<CR>

nnoremap _ 5kzz
nnoremap + 5jzz

" VIM Style Setting
set laststatus=2            " 总是显示状态栏
set showtabline=2           " 总是显示标签栏
set splitright              " 水平切割窗口时，默认在右边显示新窗口
"
set statusline=                                 " 清空状态了
set statusline+=\ %F                            " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
set statusline+=%=                              " 向右对齐
set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)
" VIM Plug-in Zone
call plug#begin()
Plug 'jayli/vim-easycomplete'
Plug 'SirVer/ultisnips'

Plug 'brglng/vim-im-select'
Plug 'https://gitee.com/vue-then/vimdoc-cn.git'

Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()
let g:indentLine_defaultGroup = 'SpecialKey'
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ }
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#ffaf87", "cterm": "216", "cterm16": "7"}
\}

colorscheme onedark
