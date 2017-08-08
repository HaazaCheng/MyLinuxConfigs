""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:DoxygenToolkit_authorName="HazzaCheng@gmail.com" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 显示相关  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
syntax on
set go=             " 不要图形按钮  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set cursorline      " 突出显示当前行
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}   "状态行显示的内容  
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
set helplang=cn     " 显示中文帮助
colorscheme ron " 设置配色方案


func! Compile()
  exec "w"
  if &filetype == 'c'
    exec "!clang % -o %< -std=c11"
    exec "! ./%<"
  elseif &filetype == 'cpp'
    if expand('%:e') == 'cc' || expand('%:e') == 'cpp'
      exec "!clang++ -std=c++14 -Wall -DDEBUG -pthread % -o %<"
      exec "! ./%<"
    else
      exec "!clang++ -std=c++14 -pthread % -o /dev/null"
    endif
  elseif &filetype == "go"
    exec "!go fmt %; and go run %"
  elseif &filetype == 'java' 
    exec "!javac %" 
    exec "!java %<"
  elseif &filetype == 'sh'
    :!./%
  elseif &filetype == 'python'
    exec "!python3 %"
  elseif &filetype == "javascript"
    exec "!node %"
  elseif &filetype == "scala"
    exec "!scala %"
  elseif &filetype == "coffee"
    exec "!coffee %"
  elseif &filetype == "lua"
    exec "!lua %"
  elseif &filetype == "cs"
    exec "!mcs % -out:a.exe ; and ./a.exe"
  endif
endfunc

func! Debug()
  exec "w"
  if &filetype == "c"
    exec "!gcc % -g -o %<"
    exec "!cgdb ./%<"
  elseif &filetype == "cpp"
    exec "!g++ -DDEBUG -pthread -std=c++14 -g  % -o %<"
    exec "!cgdb ./%<"
  elseif &filetype == "javascript"
    exec "!jshint %; and node-debug %"
  endif
endfunc



""实用设置
set autoread                " 设置当文件被改动时自动载入
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
set clipboard+=unnamed      "共享剪贴板  
set nobackup                "从不备份  
set makeprg=g++\ -Wall\ \ % "make 运行
set autowrite               "自动保存
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoindent              " 自动缩进
set cindent
set tabstop=4               " Tab键的宽度
set softtabstop=4           " 统一缩进为4
set shiftwidth=4
set expandtab               " 不要用空格代替制表符
set smarttab                " 在行和段开始处使用制表符
set number                  " 显示行号
set history=1000            " 历史记录数
set nobackup                "禁止生成临时文件
set noswapfile
set ignorecase              "搜索忽略大小写
set hlsearch                "搜索逐字符高亮
set incsearch
set gdefault                "行内替换
set enc=utf-8               "编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8    "语言设置
set laststatus=2            
set cursorline

filetype on                 " 侦测文件类型
filetype plugin on          " 载入文件类型插件
filetype indent on          " 为特定文件类型载入相关缩进文件
set viminfo+=!              " 保存全局变量
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set linespace=0             " 字符间插入的像素行数目
set wildmenu                " 增强模式中的命令行自动完成操作
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l      " 允许backspace和光标键跨越行边界

set mouse=a                 " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
set report=0                " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白，便于阅读
set showmatch               " 高亮显示匹配的括号
set matchtime=1             " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3             " 光标移动到buffer的顶部和底部时保持3行距离
set smartindent             " 为C程序提供自动缩进
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
au BufWinLeave        * silent mkview
au BufWinEnter        * silent loadview
au BufRead,BufNewFile *  setfiletype txt    " 高亮显示普通txt文件（需要txt.vim脚本）

augroup filetype            " 高亮显示llvm
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap {<CR> {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction


"ctags
set tags=tags;/
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
map<F12> :TlistToggle <CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" nerdtree
nmap <Leader>f :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" 键盘映射
" 映射全选+复制 ctrl+a
map <C-a> ggVG$
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" format
nnoremap <F4> :!clang-format -style="{BasedOnStyle: google, IndentWidth: 4, AccessModifierOffset: -4, ColumnLimit: 100}" -i %<CR>
"比较文件  
nnoremap <C-F2> :vert diffsplit 
nmap <Leader>c :call Compile()<CR>
nmap <Leader>d :call Debug()<CR>
nmap <Leader>m :exec "!make"<CR>
map <F5> :call Compile()<CR>
map <F6> :call Debug()<CR>
map <F7> :exec "!make"<CR>
map <F8> :exec "!make debug"<CR>

"airline
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
set t_Co=256
