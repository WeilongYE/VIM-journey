# VIM-journey
VIM configuration, install, tips

## Install taglist for gvim7.4 on win7
* Download from http://vim.sourceforge.net/scripts/script.php?script_id=273
* Copy doc/taglist.txt to <vim_install_path>/vimfiles/doc
* Copy plugin/taglis.vim to <vim_install_path>/vimfiles/plugin
* .vimrc 设置 <转载自http://www.vimer.cn>
```C
"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
```

## Install ctag for gvim7.4 on win7
* Download from http://www.vim.org/scripts/script.php?script_id=2288
* Copy ctag.exe to <vim_install_path>/vim74/

## Install cscope for gvim7.4 on win7
* Download from https://code.google.com/p/cscope-win32/downloads/list
* Copy cscope.exe to <vim_install_path>/vim74/
* .vimrc 设置 <转载自http://www.vimer.cn>
```C
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction
```

## Install omnicppcomplete for gvim7.4 on win7
* Download from http://www.vim.org/scripts/script.php?script_id=1520
* Install, directory like this:
```C
 after\ftplugin\cpp.vim
    after\ftplugin\c.vim
 
    autoload\omni\common\debug.vim
                        \utils.vim
 
    autoload\omni\cpp\complete.vim
                     \includes.vim
                     \items.vim
                     \maycomplete.vim
                     \namespaces.vim
                     \settings.vim
                     \tokenizer.vim
                     \utils.vim
 
    doc\omnicppcomplete.txt
```
* not done yet, error" no patten"

## Install NerdTree(ref:http://www.cnblogs.com/feichexia/archive/2012/11/07/Vim_NerdTree.html)
* Download from http://www.vim.org/scripts/script.php?script_id=1658
* Copy NERD_tree.txt to <vim_install_path>/vimfiles/doc
* Copy NERD_tree.vim to <vim_install_path>/vimfiles/plugin
* .vimrc设置
```C
map <C-E> :NERDTreeMirror<CR>
map <C-E> :NERDTreeToggle<CR>
```
