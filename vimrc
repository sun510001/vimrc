set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'skywind3000/asyncrun.vim'
" Plugin 'vim-scripts/Conque-Shell'
" code format and auto complete 
Plugin 'tell-k/vim-autopep8'
" Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Valloric/YouCompleteMe'
Plugin 'taglist.vim'
Plugin 'Yggdroot/indentLine'
" below two is to auto complete (){}[]
Plugin 'jiangmiao/auto-pairs'
" Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/LeaderF'
Plugin 'vim-latex/vim-latex'
" Plugin 'lervag/vimtex'
"Big Boss
" Plugin 'python-mode/python-mode'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" colorschemes ------------ 
" Plugin 'tomasr/molokai'
" Plugin 'blueshirts/darcula'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" appearance -----------------
" set number
set guifont=SourceCodePro-Regular:h12
set cursorline
" set cursorcolumn
set background=dark
" colorscheme desert
" colorscheme darcula
colorscheme gruvbox
set guioptions-=r
set guioptions-=L
set guioptions-=b
set showtabline=0
" set t_Co=256
" accessiblity ------------
syntax on
set nowrap
set fileformat=unix
set cindent
set tabstop=4
set shiftwidth=4
set showmatch
set scrolloff=5
set laststatus=2
" others ------------------
set fenc=utf-8
set backspace=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase  
set incsearch
" hotkey --------------------


"set hlsearch      
autocmd cursorhold * set nohlsearch 
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

" nnoremap <c-h> :call DisableHighlight()<cr>
" function! DisableHighlight()
    " set nohlsearch
" endfunc

set noexpandtab    
set whichwrap+=<,>,h,l
set autoread
" set foldlevelstart=99
" set foldlevel=99
" set nofoldenable    " disable folding
" 按照PEP8标准来配置vim
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix

" indentline -----------
" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'   

" 使indentline生效
let g:indentLine_enabled = 1

" YCM -------------------
" 补全菜单的开启与关闭
" set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口
" 下面不用
" 补全菜单中各项之间进行切换和选取：默认使用tab  s-tab进行上下切换，使用空格选取。可进行自定义设置：
"let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']      " 通过上下键在补全菜单中进行切换
"let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中补全菜单中的当前项
" 上面不用
" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全
" 语义补全
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

" 关闭自动弹出的函数原型预览窗口
set completeopt=longest,menu
let g:ycm_add_preview_to_completeopt = 0
" 关闭显示诊断信息
let g:ycm_show_diagnostics_ui = 0

" 重映射快捷键
"上下左右键的行为 会显示其他信息,inoremap由i 插入模式和noremap不重映射组成，只映射一层，不会映射到映射的映射
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>”

" nnoremap <F4> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>    "open locationlist
" nnoremap <leader>lc :lclose<CR>    "close locationlist
" inoremap <leader><leader> <C-x><C-o>

let g:ycm_confirm_extra_conf=0                  " 关闭加载.ycm_extra_conf.py确认提示
let g:ycm_filetype_blacklist= {                 
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1,
	  \ 'tex': 1,
	  \ 'json': 1,
	  \ 'csv': 1,
	  \ 'txt': 1
      \}
nmap <leader>2 :YcmCompleter GoTo<CR>
nmap <leader>1 :YcmCompleter GetDoc<CR>
let g:ycm_python_interpreter_path = ''
    " \ '/usr/local/lib/python3.7/site-packages',   for brew install 
let g:ycm_python_sys_path = [
    \ '/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/',
    \ '/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/',
    \ '/Users/sun/python_third_party/'
    \]
let g:ycm_extra_conf_vim_data = [
    \ 'g:ycm_python_interpreter_path',
    \ 'g:ycm_python_sys_path'
    \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
" nerdcommenter ---------------
let g:NERDSpaceDelims=1

" taglist ---------------------
let Tlist_Use_Right_Window = 1          " 让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1      " 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1             " 只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name'             " Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1       " Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32             " 设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'  
" 这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
map t :TlistToggle<CR>              
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
" set tags=tags;
" set autochdir
" NERDTree --------------------
"使用n键快速调出和隐藏它
" map n :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开vim时自动打开NERDTree
" autocmd vimenter * NERDTree           
" How can I open NERDTree automatically when vim starts up on opening a directory?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plugin,配置信息如下
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
" 显示隐藏文件
let NERDTreeShowHidden=0
" --------------------------------
" 指定屏幕上可以进行分割布局的区域
set splitbelow               " 允许在下部分割布局
set splitright               " 允许在右侧分隔布局

" 组合快捷键：
nnoremap <S-S> <C-W><C-J>    " 组合快捷键：- Ctrl-j 切换到下方的分割窗口
nnoremap <S-W> <C-W><C-K>    " 组合快捷键：- Ctrl-k 切换到上方的分割窗口
nnoremap <S-D> <C-W><C-L>    " 组合快捷键：- Ctrl-l 切换到右侧的分割窗口
nnoremap <S-A> <C-W><C-H>    " 组合快捷键：- Ctrl-h 切换到左侧的分割窗口

" Run Python and others --------------------
map <D-2> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "! python3 %"
	elseif &filetype == 'html'
		exec "!chrome % &"
	elseif &filetype == 'go'
		"exec "!go build <"
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!chrome %.html &"
	endif
	endfunc

" syntastic ------------------- 
" 每次自动调用 :SyntasticSetLocList, 将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list = 1
" 自动拉起/关闭错误窗口, 不需要手动调用 :Errors
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='x>'
let g:syntastic_warning_symbol='!>'
" map <D-3> :SyntasticToggleMode<CR>
let g:syntastic_python_checkers=['flake8']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		" Nothing was closed, open syntastic error location panel
		Errors
	endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>

" autopep8 code format ---------------------
" Disable show diff window-
let g:autopep8_disable_show_diff=1
" vim-autopep8自1.11版本之后取消了F8快捷键，需要用户自己为:Autopep8设置快捷键：-
autocmd FileType python noremap <buffer> <D-1> :call Autopep8()<CR>
let g:pymode_python = 'python3'
" autocmd VimEnter *.py python3 sys.path.append('.')-
autocmd BufWritePost *.py call Flake8()
" using flake8 as a python syntax checker -
" let g:syntastic_python_checkers=['flake8']-
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:autopep8_aggressive=2

" auto-pairs ------------------------
let g:AutoPairsShortcutJump = ''

" Vim-LaTeX ----------------------------------
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_AutoFolding = 0
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
" let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
" let g:Tex_ViewRule_pdf = 'Skim'
"let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'Preview'
let g:tex_conceal = ""
" statusline -----------------------------
function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction
set statusline=%<%1*[B-%n]%*
" TOT is an abbreviation for total
set statusline+=%2*[TOT:%{Buf_total_num()}]%*
set statusline+=%3*\ %{File_size(@%)}\ %*
set statusline+=%4*\ %F\ %*
set statusline+=%5*『\ %{exists('g:loaded_ale')?ALEGetStatusLine():''}』%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
set statusline+=%6*\ %m%r%y\ %*
set statusline+=%=%7*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-14.(%l:%c%V%)%*
set statusline+=%8*\ %P\ %*
" default bg for statusline is 236 in space-vim-dark
hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=208 ctermbg=238
hi User6 cterm=None ctermfg=246 ctermbg=237
hi User7 cterm=None ctermfg=250 ctermbg=238
hi User8 cterm=None ctermfg=249 ctermbg=240

