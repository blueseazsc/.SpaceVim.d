" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" 使用 Microsoft Python Language Server 不然 coc.nvim 会警告
call coc#config("python.jediEnabled", v:false)

call coc#config('coc.preferences', {
			\ "autoTrigger": "always",
			\ "maxCompleteItemCount": 10,
			\ "codeLens.enable": 1,
			\ "diagnostic.virtualText": 1,
			\})


" c/c++ golang 和 bash 的 language server 设置
call coc#config("languageserver", {
      \"ccls": {
      \  "command": "ccls",
      \  "filetypes": ["c", "cpp", "objc", "objcpp"],
      \  "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
      \  "index": {
      \     "threads": 8
      \  },
      \  "initializationOptions": {
      \     "cache": {
      \       "directory": ".ccls-cache"
      \     },
      \  "clang": {
      \      "extraArgs": [
      \          "-isystem/usr/local/opt/llvm/bin/../include/c++/v1",
      \          "-isystem/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0/include",
      \          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include",
      \          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks",
      \      ],
      \      "resourceDir": "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.0"
      \  },
      \  "highlight": { "lsRanges" : v:true }
      \  },
      \  "client": {
      \    "snippetSupport": v:true
      \  }
      \},
      \"golang": {
      \      "command": "gopls",
      \      "rootPatterns": ["go.mod", ".vim/", ".git/", ".svn/"],
      \      "filetypes": ["go"],
      \      "initializationOptions": {
      \        "usePlaceholders": "true"
      \      }
      \},
      \"bash": {
      \  "command": "bash-language-server",
      \  "args": ["start"],
      \  "filetypes": ["sh"],
      \  "ignoredRootPaths": ["~"]
      \},
      \})

" coc.nvim 插件，用于支持 python java 等语言
let s:coc_extensions = [
			\ 'coc-cmake',
			\ 'coc-java',
			\ 'coc-go',
			\ 'coc-json',
			\ 'coc-sh',
			\ 'coc-sql',
			\ 'coc-xml',
			\ 'coc-yaml',
			\ 'coc-vimlsp',
			\ 'coc-word',
			\ 'coc-dictionary',
			\ 'coc-ci',
			\ 'coc-snippets',
			\ 'coc-imselect',
			\]
			" \ 'coc-python',
			" \ 'coc-css',
			" \ 'coc-html',
			" \ 'coc-tsserver',
			" \]
for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 方便在中文中间使用 w 和 b 移动
nmap <silent> w <Plug>(coc-ci-w)
nmap <silent> b <Plug>(coc-ci-b)


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.

" set updatetime=300
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" 注释掉，一般使用 `Space` `r` `f` 直接格式化整个文件
" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
" command! -nargs=0 Format :call CocAction('format')
call SpaceVim#custom#SPC('nnoremap', ['r', 'f'], "call CocAction('format')", 'format file with coc.nvim', 1)

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" auto import for go on save
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" 这个和 SpaceVim 的 statusline/tabline 冲突了
" Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status'
"       \ },
"       \ }

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

