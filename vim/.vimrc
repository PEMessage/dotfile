let g:startify_custom_header = [
\
\ '   ██████╗ ███████╗███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗ ',
\ '   ██╔══██╗██╔════╝████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝ ',
\ '   ██████╔╝█████╗  ██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗   ',
\ '   ██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝   ',
\ '   ██║     ███████╗██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗ ',
\ '   ╚═╝     ╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ',
\ ]
" +++++++++++++++++++++++++++++++++++++++++++
" File: .vimrc
" Author: PEMessage
" Description: This is my VIM8+/NeoVIM configuratio
" Last Modified: 
" +++++++++++++++++++++++++++++++++++++++++++

" 1. Configure List
" ===========================================
    
    " Plug-Mirror
    let s:PE_VimPlugURL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    " let s:PE_VimPlugURL = 'https://gitee.com/yaozhijin/vim-plug/raw/master/plug.vim'
     
    " let g:plug_url_format='https://git::@hub.fastgit.xyz/%s.git'
    " let g:plug_url_format='https://ghproxy.com/https://github.com/%s.git'

    " TrueColor
    set termguicolors

    " Comment Color
    let s:PeCommentColor = {"gui": "#00af87", "cterm": "246", "cterm16": "7"}
    let g:lightline = {
                \ 'colorscheme': 'onedark',
                \ }


" 2. Auto Install ViM-Plug
" ===========================================
"   
    if has('nvim')
        let g:pe_runtimepath = stdpath('data') . '/site'
    else
        exe 'set rtp+=' . expand('~/.config/vim')
        let g:pe_runtimepath = expand('~/.config/vim') 
    endif
    if empty(glob(pe_runtimepath . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.pe_runtimepath.'/autoload/plug.vim --create-dirs '.s:PE_VimPlugURL
      source $MYVIMRC
    endif


" 3. Some General Setting
" ===========================================

" -------------------------------------------
" 3.1 Basic Setting Zone
" -------------------------------------------
    set nocompatible     " 禁用 vi 兼容模式
    set helplang=cn      " 设置中文帮助手册
    set nowrap           " 关闭自动换行
    set ruler            " 显示光标位置
    set ffs=unix,dos,mac " 文件换行符，默认使用 unix 换行符
    set clipboard=       " 关闭系统剪贴板共享

" -------------------------------------------
" 3.2 Coding Zone
" -------------------------------------------
    if has('multi_byte')
        " 内部工作编码
        set encoding=utf-8

        " 文件默认编码
        set fileencoding=utf-8

        " 打开文件时自动尝试下面顺序的编码
        set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
    endif

    if has('folding')
        " 允许代码折叠
        set foldenable

        " 代码折叠默认使用缩进
        set fdm=indent

        " 默认打开所有缩进
        set foldlevel=99
    endif

    if has('syntax')  
        syntax enable 
        syntax on 
    endif

    if has('mouse')
        set mouse+=a
    endif


" -------------------------------------------
" 3.3 Search Zone
" -------------------------------------------
    set smartcase   " 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
    set incsearch   " 查找输入时动态增量显示查找结果
    set hlsearch    " 高亮搜索内容
 


" -------------------------------------------
" 3.4 Tab and Indent Setting
" -------------------------------------------
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



" 4. Keybending list
" ===========================================
" KeyBinding Setting Zone ( Input Mode  )
    inoremap jj <ESC>
    inoremap <c-a> <home>
    inoremap <c-e> <end>
    inoremap <c-_> <c-k>

" KeyBinding Setting Zone ( Normal Mode  )
    nnoremap <silent><C-N> :bnext<CR>
    nnoremap <silent><C-P> :bprev<CR>

    nnoremap <silent><C-H> :tabp<CR>
    nnoremap <silent><C-L> :tabn<CR>

" KeyBinding Setting Zone ( Better Mouse )
    nnoremap <silent><C-S-TAB> :tabp<CR>
    inoremap <silent><C-S-TAB> <C-o>:tabp<CR>
    nnoremap <silent><C-TAB>   :tabn<CR>
    inoremap <silent><C-TAB>   <C-o>:tabn<CR>
    nnoremap <MiddleMouse>     :tabclose<CR>
    vnoremap <RightMouse>            "+y
    inoremap <RightMouse>       <C-o>"+p

" KeyBinding Setting Zone ( Better Mouse )
    nnoremap <leader>rc :w<CR> :source %<CR>
    nnoremap <leader>`  :nohlsearch<CR>
    nnoremap <leader>11 :set number!<CR>
    nnoremap <leader>12 :set relativenumber!<CR>
    nnoremap <leader>tt :tab ball<CR>
    nnoremap <leader>cl :set cursorline!<CR>

    let g:netrw_banner = 0                      " 设置是否显示横幅
    if argv(0) ==# '.'
        let g:netrw_browse_split = 0
    else
        let g:netrw_browse_split = 4
    endif

    let g:netrw_preview = 1                     " 指针保留于Netrw
    let g:netrw_winsize = 25                    " %25的窗口大小
    let g:netrw_liststyle = 3                   " 设置目录列表的样式：树形
    let g:netrw_sort_sequence = '[\/]$,*'

    if &ft ==# "netrw"
        " your code here
        nmap <MiddleMouse>   t 

    endif
    nnoremap <silent><leader>b  :Lexplore<CR>

    nnoremap + 4kzz
    nnoremap _ 5jzz
" Command Zone
    command! PeWrite w! sudo tee % 

" VIM Style Setting
    set laststatus=2            " 总是显示状态栏
    set showtabline=2           " 总是显示标签栏
    set splitright              " 水平切割窗口时，默认在右边显示新窗口
    
    set statusline=                                 " 清空状态了
    set statusline+=\ %F                            " 文件名
    set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
    set statusline+=%=                              " 向右对齐
    set statusline+=\ %y                            " 文件类型

    " 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
    set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)


" 5. VIM Plug-in Zone
" ===========================================
call plug#begin(pe_runtimepath . '/plugged')

" Basic Funtion
    Plug 'skywind3000/vim-quickui'

" Style PlugIn
    Plug 'itchyny/lightline.vim'

    Plug 'romgrk/github-light.vim'
    Plug 'joshdick/onedark.vim'
    " let g:onedark_color_overrides = {
    "             \ "comment_grey": {"gui": "#00af87", "cterm": "246", "cterm16": "7"}
    "             \}

      Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-startify'
   " Plug 'ap/vim-buftabline'

" Locale
    Plug 'yianwillis/vimcdoc'
    Plug 'brglng/vim-im-select'
    let g:im_select_default = '1033'
   
" Text Object
    Plug 'junegunn/vim-easy-align'
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'

    Plug 'easymotion/vim-easymotion'
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_space_jump_first = 1
        let g:EasyMotion_use_upper = 1
        map / <Plug>(easymotion-sn)
        map <space><space>  <Plug>(easymotion-s)


    Plug 'mg979/vim-visual-multi', {'branch': 'master'}


" Complete System
   Plug 'prabirshrestha/asyncomplete.vim'
   inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
   inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
   inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
   set cpt=.,k,w,b
   set completeopt=menu,menuone,noselect
   set shortmess+=c
   let g:asyncomplete_auto_popup = 1
   let g:asyncomplete_auto_completeopt = 0


   Plug 'Shougo/neosnippet.vim'
   Plug 'Shougo/neosnippet-snippets'
   Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
   imap <C-k>     <Plug>(neosnippet_expand_or_jump)
   smap <C-k>     <Plug>(neosnippet_expand_or_jump)
   xmap <C-k>     <Plug>(neosnippet_expand_target)

   Plug 'prabirshrestha/asyncomplete-buffer.vim'

call plug#end()

" 6. VIM Plug-in Zone (Out Of Plug#end)
" ===========================================

    " Complete System
   call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

   call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

    " Style
    if (has("autocmd"))
        augroup colorextend
            autocmd!
            " Make `Comment`s Another Color in ViM 
            autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": s:PeCommentColor  })
        augroup END
    endif

    colorscheme onedark


    " Quick UI Register
    let g:quickui_color_scheme = 'gruvbox'
    " 安装一个 File 目录，使用 [名称，命令] 的格式表示各个选项。
    call quickui#menu#install('&File', [
                \ [ "&New File\tCtrl+n", 'echo 0' ],
                \ [ "&Open File\t(F3)", 'echo 1' ],
                \ [ "&Close", 'echo 2' ],
                \ [ "--", '' ],
                \ [ "&Save\tCtrl+s", 'echo 3'],
                \ [ "Save &As", 'echo 4' ],
                \ [ "Save All", 'echo 5' ],
                \ [ "--", '' ],
                \ [ "E&xit\tAlt+x", 'echo 6' ],
                \ ])

    " 每个项目还可以多包含一个字段，表示它的帮助文档，光标过去时会被显示到最下方的命令行
    call quickui#menu#install('&Edit', [
                \ [ '&Copy', 'echo 1', 'help 1' ],
                \ [ '&Paste', 'echo 2', 'help 2' ],
                \ [ '&Find', 'echo 3', 'help 3' ],
                \ ])

    " 在 %{...} 内的脚本会被求值并展开成字符串
    call quickui#menu#install("&Option", [
                \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
                \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
                \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
                \ ])


    function! PeCheetMessage()
        let content = 'u <-> <c-r> Undo'
        let opts = {"close":"button", "title":"Vim Messages"}
        call quickui#textbox#open(content, opts)
    endfunc

    " install 命令最后可以加一个 “权重”系数，用于决定目录位置，权重越大越靠右，越小越靠左
    call quickui#menu#install('H&elp', [
                \ ["&PE_CheetThing", ':call PeCheetMessage()', 'Leader+U' ],
                \ ["&Cheatsheet", 'help index', ''],
                \ ['T&ips', 'help tips', ''],
                \ ['--',''],
                \ ["&Tutorial", 'help tutor', ''],
                \ ['&Quick Reference', 'help quickref', ''],
                \ ['&Summary', 'help summary', ''],
                \ ], 10000)

    " 打开下面选项，允许在 vim 的下面命令行部分显示帮助信息
    let g:quickui_show_tip = 1

    " 定义按两次空格就打开上面的目录
    noremap <space>m :call quickui#menu#open()<cr>
    noremap <space>a :call quickui#tools#list_buffer('e')<cr>
    

    let rightmouse_content = [
                \ ["&Help Keyword\t\\ch", 'echo 100' ],
                \ ["&Signature\t\\cs", 'echo 101'],
                \ ['-'],
                \ ["Find in &File\t\\cx", 'echo 200' ],
                \ ["Find in &Project\t\\cp", 'echo 300' ],
                \ ["Find in &Defintion\t\\cd", 'echo 400' ],
                \ ["Search &References\t\\cr", 'echo 500'],
                \ ['-'],
                \ ["&Documentation\t\\cm", 'echo 600'],
                \ ]
    " set cursor to the last position
    let opts = {'index':g:quickui#context#cursor}
    nnoremap <RightMouse> :call quickui#context#open(content, opts)<CR>


" NeoVide Zone
" ===========================================
    if exists('g:neovide')
          " do neovide specific config
    endif

" Self Funtion Zone
" ===========================================
    let s:exitKeyList = [ 'q', "\<ESC>" ]
    let s:delKeyList  = [ 'x', 'd' ]
    let s:pairKeyList = [ 
    \ '(', ')' , 
    \ '<', '>' , 
    \ '{', '}' , 
    \ '[', ']'   
    \ ]
    " Stay in c-w prefix
    function StayinCW()
        echo "VIM Windows Mode"
        while(1)
            let follow = nr2char(getchar())
            if index( s:exitKeyList , follow ) >= 0
                echo "Mode End"
                return
            endif
            exec "normal \<c-w>" . follow 
            redraw
        endwhile
    endfunction
    command! PeWinMode :call StayinCW()
    nnoremap <silent><leader>w :PeWinMode<CR>


    " Surround Viusal Zone
    function SurroundViusalZone()
        echo "VIM Surround"
        let follow = nr2char(getchar())
        if index( s:exitKeyList , follow ) >= 0
            return
        endif
        if index( s:delKeyList , follow ) >= 0
            exec "normal `<hx"
            exec "normal `>x"
            return
        endif

        let pairIndex = index( s:pairKeyList , follow ) 
        if pairIndex >= 0
            if ( pairIndex % 2 ) == 0
                let leftpair = s:pairKeyList[ pairIndex ] 
                let rightpair  = s:pairKeyList[ pairIndex+1 ]
            else
                let rightpair  = s:pairKeyList[ pairIndex ]
                let leftpair = s:pairKeyList[ pairIndex-1 ]
            endif
            exec "normal `<i" .leftpair ."\<esc>"
            exec "normal `>la".rightpair."\<esc>"
            return
        endif

        exec "normal `<i" .follow . "\<esc>"
        exec "normal `>la".follow . "\<esc>"
    endfunction
    noremap <silent><leader>s :call SurroundViusalZone()<CR>

    " Switch Color Theme
    function SwitchTheme()
        if g:colors_name == 'github-light'
            let g:lightline.colorscheme = "onedark"
            colorscheme onedark
        else
            let g:lightline.colorscheme = "github_light"
            colorscheme github-light
        endif
        call lightline#toggle()
        call lightline#toggle()
    endfunction
    nnoremap <silent><leader>dl :call SwitchTheme()<CR>

    
