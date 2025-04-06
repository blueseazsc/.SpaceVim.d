func! myspacevim#before() abort
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	" basic
	"""""""""""""""""""""""""""""""""""""""""""""""""""""
	exec 'source ~/.SpaceVim.d/autoload/vimrc.before.vim'
    let g:spacevim_disabled_plugins = ['nerdcommenter', 'vim-cpp-enhanced-highlight']
	set rtp+=/opt/homebrew/opt/fzf
	call SpaceVim#custom#SPC('nnoremap', ['<Space>'], '<ESC><C-W><C-W>', 'switch windows', 1)

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
endf
