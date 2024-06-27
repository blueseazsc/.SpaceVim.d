func! myspacevim#before() abort
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" basic
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	exec 'source ~/.SpaceVim.d/autoload/vimrc.before.vim'
    let g:spacevim_disabled_plugins = ['nerdcommenter', 'vim-cpp-enhanced-highlight']
	set rtp+=/opt/homebrew/opt/fzf
    call SpaceVim#custom#SPC('nnoremap', ['s', 'f'], 'Vista finder fzf:coc', 'vista search simbols', 1)
    " call SpaceVim#custom#SPC('nnoremap', ['s', 'F'], 'LeaderfFunction!', 'list functions', 1)
	call SpaceVim#custom#SPC('nnoremap', ['<Space>'], '<ESC><C-W><C-W>', 'switch windows', 1)

	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" rg ag 配置
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    let rg_profile = SpaceVim#mapping#search#getprofile('rg')
    let rg_default_opts = rg_profile.default_opts + ['--follow', '-w']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : rg_default_opts}})

    let ag_profile = SpaceVim#mapping#search#getprofile('ag')
    let ag_default_opts = ag_profile.default_opts + ['--follow', '-w']
    call SpaceVim#mapping#search#profile({'ag' : {'default_opts' : ag_default_opts}})
	
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" vista
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" F4 语法树
	" How each level is indented and what to prepend.
	" This could make the display more compact or more spacious.
	" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
	" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	" Executive used when opening vista sidebar without specifying it.
	" See all the avaliable executives via `:echo g:vista#executives`.
	let g:vista_default_executive = 'coc'
	" To enable fzf's preview window set g:vista_fzf_preview.
	" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
	let g:vista_fzf_preview = ['right:30%']

	let g:vista_echo_cursor_strategy = 'echo'
	let g:vista_close_on_jump = 0
	let g:vista_sidebar_position = "vertical topleft"
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" vim-commentary
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " nerdcommenter 并不智能，比如对于同一行注释两次，
    " nerdcommenter 会得到 /*/* code */*/，但是我期待的是 code
    " SpaceVim 默认使用 nerdcommenter，为了使用 vim-commentary
    " 似乎必须显式地disable掉这个插件
    " https://github.com/SpaceVim/SpaceVim/issues/216
	" This options works well, but 'scrooloose/nerdcommenter' is merged plugin, 
	" so you need call dein#recache_runtimepath(), and restart vim.
	" disabled_plugins: nerdcommenter
    " remap vim-commentary 来保持兼容
    nmap <space>cl gcc
    vmap <space>cl gc
    nmap <space>cu gcc
    vmap <space>cu gc
	" i like
    nmap cc gcc
    vmap cc gc
    nmap cu gcc
    vmap cu gc
	"为python和shell等添加注释
	autocmd FileType python,shell,coffee set commentstring=#\ %s
	"修改注释风格
	autocmd FileType java,c,cpp set commentstring=//\ %s
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" ultisnips
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:spacevim_snippet_engine = 'ultisnips'

	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" winresizer
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 条件 window 大小的设置
    let g:winresizer_start_key = '<space>wa'
    " If you cancel and quit window resize mode by `q` (keycode 113)
    let g:winresizer_keycode_cancel = 113

	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" markdown
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 默认 markdown preview 在切换到其他的 buffer 或者 vim
    " 失去焦点的时候会自动关闭 preview，让
    let g:mkdp_auto_close = 0

	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" bookmark in tools layer
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 书签选中之后自动关闭 quickfix window
    let g:bookmark_auto_close = 1
	
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" vim-lsp-cxx-highlight
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" disabled_plugins: vim-cpp-enhanced-highlight
    " TODO: vim-lsp-cxx-highlight 和这个选项存在冲突
    " let g:rainbow_active = 1
	
    " 实现一键运行
    func! QuickRun()
        exec "w"
        let ext = expand("%:e")
        let file = expand("%")
        if ext ==# "sh"
            exec "!sh %"
        elseif ext ==# "md"
            exec "!dos2unix %"
        elseif ext ==# "cpp"
            exec "!clang++ % -Wall -O3 -g -std=c++17 -o %<.out && ./%<.out"
        elseif ext ==# "c"
            exec "!clang % -Wall -g -std=c11 -o %<.out && ./%<.out"
        elseif ext ==# "java"
            let classPath = expand('%:h')
            let className = expand('%:p:t:r')
            " echo classPath
            " echo className
            exec "!javac %"
            exec "!java -classpath " . classPath . " " . className
        elseif ext ==# "go"
            exec "!go run %"
        elseif ext ==# "js"
            exec "!node %"
        elseif ext ==# "bin"
            exec "!readelf -h %"
        elseif ext ==# "py"
            exec "!python3 %"
        elseif ext ==# "vim"
            exec "so %"
        elseif ext ==# "html"
            exec "!google-chrome-stable %"
        elseif ext ==# "rs"
            call CargoRun()
        else
            echo "Check file type !"
        endif
        echo 'done'
    endf
endf

func! myspacevim#after() abort
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" basic
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	exec 'source ~/.SpaceVim.d/autoload/vimrc.after.vim'
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" self
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	inoremap jj <ESC>

	" 快速跳转
    nmap <F1>  :A<CR>

	" search file in project
	" nnoremap <leader>ff :FzfFiles<CR>
	nnoremap ff :FzfFiles<CR>

	" find symbol in project
    nmap <F2>  <space>srP

	" open file tree
	nmap <F4> :Defx -search=`expand('%:p')` `stridx(expand('%:p'), getcwd()) < 0? expand('%:p:h'): getcwd()`<CR>

    " 放到此处用于重写 SpaceVim 映射的 F4
    nnoremap  <F3>  :Vista!!<CR>

	" easy move word and line
	nmap mw <space>jw
	nmap ml <space>jl

	" gd 原来是 <Plug>(coc-definition)
	nmap gd <S-*>
	nmap <silent> <C-j> <Plug>(coc-definition)

	" buffer 左右浏览
	nmap <C-L> ]b
	nmap <C-H> [b

	" 窗口切换
	nmap <C-K> <C-W><C-W>
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" vim-lsp-cxx-highlight
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	hi default link LspCxxHlSymField Normal
	" highlight LspCxxHlSymField ctermfg=gray fg=gray cterm=none gui=none
endf
