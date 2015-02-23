" VIM Configuration File
" Optimized for C/C++ development
" @author: Weilong YE
" @version: 1.0
" @date 2015-2-19

"=========================================
" => basic configuration
"=========================================
if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif
"字体的设置
set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替哦
set gfw=幼圆:h10:cGB2312

"=========================================
" => set Tlist
"=========================================
" Download from http://vim.sourceforge.net/scripts/script.php?script_id=273
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1

"=========================================
" => set ctags
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=2288
"Copy ctag.exe to <vim_install_path>/vim74/
"map <F12> :call Do_CsTag()<CR>
map <F12> <C-]>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q E:/SoCal/Boardwalk/Private/GAS-vs2013 .<CR>

"=========================================
" => set omnicppcomplete
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=1520
set nocp
filetype plugin on
set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1    "打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1  "打开显示函数原型
let OmniCpp_SelectFirstItem=2 "自动弹出时自动跳至第一个

"=========================================
" => set NERDTree
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=1658
map <C-E> :silent! NERDTreeMirror<CR>
map <C-E> :silent! NERDTreeToggle<CR>

"=========================================
" => set NERD_comment
"=========================================
" Download from http://www.vim.org/scripts/script.php?script_id=1218
let NERDShutUp=1

"=========================================
" => set DoxygenToolkit
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=987
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Weilong YE"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"=========================================
" => set a.vim
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=31

"=========================================
" => set Conque Shell
"=========================================
"Download from http://www.vim.org/scripts/script.php?script_id=2771
" not done yet

"=========================================
" => search
"=========================================
map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
let w = expand("<cword>") " 在当前光标位置抓词
execute "vimgrep " . w . " *"
endfunction