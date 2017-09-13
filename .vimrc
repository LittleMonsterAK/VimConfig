
" 定义快捷键的前缀，即 <Leader>
let mapleader=","

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
"filetype plugin on

" <<

" >>
" vim 自身（非插件）快捷键

" 设置快捷键将选中文本块复制至系统剪贴板(mac下好像无效)
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
"nmap <Leader>p "+p



"mac下的clipboard使用设置(设置mac下共享系统剪贴板)
set clipboard=unnamed

" 定义快捷键关闭当前分割窗口
"nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
"nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
"nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
"nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap <Leader>w <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
"nmap <Leader>M %

" <<

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" >>
" VIM 触发插件时间 git的那个插件会用到
set updatetime=200
" <<

" >>
" BUFFER操作
" 切换最近的两个buffer
:map <Leader>e :e#<CR>

"打开下一个buffer
:map <Leader>n :bn<CR>

"打开上一个buffer
:map <Leader>p :bp<CR>

"打开buffer列表
:map <Leader>ls :ls<CR>

" >>
" 其他

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<


" >>
" 营造专注气氛

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

" 设置行的最大长度
set colorcolumn=120

" 使backspace能够删除一些特殊文件的字符
set backspace=2

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<


" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
"set cursorline
"set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" <<

" >>
" 保存时去除末尾空格
autocmd BufWritePre * %s/\s\+$//e
" <<

" >>
" 记住上次光标位置
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
"<<


" >>>>
" 插件安装
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized' "配色方案
Plugin 'tomasr/molokai' "配色方案
Plugin 'vim-scripts/phd' "配色方案
Plugin 'w0ng/vim-hybrid' " 配色方案
Plugin 'dracula/vim'
Plugin 'Lokaltog/vim-powerline' "状态栏
"Plugin 'vim-scripts/indexer.tar.gz' "以下三个插件一起配合生成ctags的
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim' "多文件查找，且列出各个所查找的自负出现的位置
Plugin 'terryma/vim-multiple-cursors' "光标多位置选择修改
Plugin 'scrooloose/nerdcommenter' "快速开关注释
Plugin 'vim-scripts/DrawIt' "ASCII art 风格的注释
Plugin 'SirVer/ultisnips' "代码片段收藏
Plugin 'honza/vim-snippets' "代码片段
"Plugin 'Valloric/YouCompleteMe' "自动补全插件(屌炸天,node 需要配合tern使用)
Plugin 'scrooloose/nerdtree' " 目录树
Plugin 'bufexplorer.zip' " buffer 列表查看
Plugin 'gcmt/wildfire.vim' "快速选择对应区域如 括号等的内容
Plugin 'sjl/gundo.vim' " undo的快速查看恢复
Plugin 'Lokaltog/vim-easymotion' "快速移动
Plugin 'suan/vim-instant-markdown' "编写markdown时即时打开浏览器预览
Plugin 'junegunn/vim-easy-align' "快速对齐
Plugin 'raimondi/delimitmate' "自动补全括号
Plugin 'airblade/vim-gitgutter' "git的diff实时显示
Plugin 'jelera/vim-javascript-syntax' "高亮javascript语法
"Plugin 'ervandew/supertab'
Plugin 'eslint/eslint' " ES检测
Plugin 'svermeulen/vim-easyclip' "剪贴板的一些设置
Plugin 'tpope/vim-repeat' "vim easyclip 要依赖
Plugin 'yggdroot/indentline' "设置竖线对齐
Plugin 'shougo/neocomplete.vim' " 代码补全选择
Plugin 'jiangmiao/auto-pairs' " 成对删除或插入括号引号
Plugin 'w0rp/ale' " 异步代码检查
Plugin 'kien/ctrlp.vim' " 文件查找匹配
Plugin 'jeroenbourgois/vim-actionscript' "actionscript 语法提示
Plugin 'editorconfig/editorconfig-vim'

" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<

" 配色方案
"set background=dark
" solarized options
" 这里需要特别注意，与官网配置不一样
"if !has("gui_running")
  "let g:solarized_termtrans=1
  "let g:solarized_termcolors=256
"endif
"colorscheme solarized
color dracula

"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1
"colorscheme hybrid
"colorscheme molokai
"colorscheme phd



" >>
" 其他美化

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" 忽略node_modules
let g:ctrlsf_ignore_dir = ["node_modules"]

" <<

" >>
" 内容替换

" 快捷替换
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute '%s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" <<

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


" >>
" 代码导航

" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
"nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
"nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航

"nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
"nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#708090
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0

" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1

" <<

" >>
" 由接口快速生成实现框架

" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" <<

" >>
" 工程文件浏览

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>f :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" <<
"
" >>
" 环境恢复

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

"保存swp文件。
set directory=~/.vim_swp_dir/

"保存backup文件位置
set backupdir=~/.vim_backup/
set backup

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
"map <leader>rs :source my.vim<cr>

" 快速选中结对符内的文本

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>"]

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

">>
"EasyAlign 配置 对齐工具
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"<<
"
">>
" markdown 实时预览插件配置
let g:instant_markdown_autostart = 0 "不要自动打开浏览器
:nmap <leader>md :InstantMarkdownPreview<CR>
"<<

">>
" easyclip 配置
nnoremap gm m "使用m来剪切黏贴,系统的d操作会被丢到黑洞里
"<<

" indentLine插件
" >>
" set list lcs=tab:\ \|
"let g:indentLine_color_term = 239 " for vim
"let g:indentLine_color_gui = '#A4E57E' " for gvim
let g:indentLine_char = '¦'
" <<

" AutoComplPop 配置
" >>
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2
let g:AutoComplPop_BehaviorHtmlOmniLength = 0
" <<

" newcomplete 配置
" >>
source ~/.vim/neocomplete.vim
" <<

" ale 插件
" >>
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" set statusline = %{ALEGetStatusLine()} + statusline
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" <<
" commenter 注释设置
" >>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"<<

" >>
"  ctrlp setting
set wildignore+=*/dist/*,*/node_modules/*
" <<

" >>
" ctrlsf setting
let g:ctrlsf_ignore_dir = ["node_modules", "dist"]
let g:ctrlsf_auto_close = 0
" <<
