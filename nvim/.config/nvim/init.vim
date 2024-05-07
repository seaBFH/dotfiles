" some essential config for vim 
" bash works well for all conditions
set shell=/bin/bash
let mapleader="\<Space>"

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" jump next
nnoremap <C-p> <C-i>
" jump prev <C-o>

" good for mental health
xnoremap("<leader>p", "\"_dP")

" center
nnoremap <C-d> <C-d>zz

" jj back to normal
inoremap jj <Esc>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" =============================================================================
" # PLUGINS
" =============================================================================
" vim-plug
call plug#begin()

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Semantic language support
" if coc break again, try more stable version
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug 'Valloric/YouCompleteMe'
"Plug 'towolf/vim-helm'
Plug 'github/copilot.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" debugging tools
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'leoluz/nvim-dap-go'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-test/vim-test'
Plug 'rust-lang/rust.vim'
Plug 'vim-test/vim-test'
"Plug 'neovim/nvim-lspconfig'
"Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
"Plug 'instant-markdown/vim-instant-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'buoto/gotests-vim'

" ASCII diagrams
Plug 'willchao612/vim-diagon'

" vim-codefmt plugins code formatting
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" enhancements
"Plug 'itchyny/lightline.vim'
"
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'

Plug 'andymass/vim-matchup'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter' "多行注释，leader键+cc生成, leader+cu删除注释
Plug 'tpope/vim-surround'

" colorthemes
Plug 'nikolvs/vim-sunbather'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'gruvbox-community/gruvbox' " color schemes

" transparent
"Plug 'xiyaowong/transparent.nvim'

" indentline
Plug 'lukas-reineke/indent-blankline.nvim'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ranger vim
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" lf.vim
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" rust crates plugin
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }


 "Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'ap/vim-css-color'

" Fuzzy finder
"Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git Tools
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter' 
" vim-signify for showing changes
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-rhubarb' 
" git graph
Plug 'rbong/vim-flog'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-git'
Plug 'kdheepak/lazygit.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
" gitlab
"Plug 'shumphrey/fugitive-gitlab.vim'


" Note tools
Plug 'vimwiki/vimwiki'

" OrgMode
Plug 'jceb/vim-orgmode'

" Vim Script
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" undotree 
Plug 'mbbill/undotree'

" All of your Plugs must be added before the following line
call plug#end() " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList - lists configured plugins
" :PlugInstall - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line

" crates nvim plugin
lua require('crates').setup()

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }
EOF

"lua << EOF
"require("indent_blankline").setup {
    "-- for example, context is off by default, use this to turn it on
    "show_current_context = true,
    "show_current_context_start = true,
"}
"EOF

" pathogen config
" execute pathogen#infect()

" =============================================================================
" # Editor settings
" =============================================================================
syntax on
filetype plugin indent on
"set smartindent " 开启新行时使用智能自动缩进
" indent should be 4, only option
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本 :noh to close highlight
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set vb t_vb= " 置空错误铃声的终端代码
set backspace=indent,eol,start " 退格键配置
set ts=4 " tab空格
set expandtab  
set autoindent
" set exrc " 执行当前目录下的vimrc文件
set relativenumber
set hidden
set ignorecase
set smartcase
set cursorline

" dealing with history
set noswapfile
set nobackup
" Permanent undo
set undodir=~/.vimdid
set undofile

" colorscheme
colorscheme PaperColor

set scrolloff=8 " keep curser in the center of the buffer
set scl=yes " keep signcolumn open
" set cc=80 " no oversized row!!! works well but too ugly to use
" let ci tools do the job

" Neat X clipboard integration
" <leader>p will paste clipboard into buffer
" <leader>c will copy entire buffer into clipboard
if has('win32')
echoerr "Sorry, clipboard integration is not supported yet on windows" 
elseif has('mac')
"noremap <leader>p :r !pbpaste<cr><cr>
"noremap <leader>c :w !pbcopy<cr><cr>
"use + register to yank to clipboard
noremap <leader>y "+y 
elseif has('unix')
"use + register to yank to clipboard
noremap <leader>y "+y 
else
echoerr "Sorry, clipboard integration is not supported on current system"
endif

" 配置多语言环境
if has("multi_byte")
" UTF-8 编码
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif

if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Quick-save
nmap <leader>w :w<CR>

" <leader>s for Rg search
noremap <leader>fs :Rg<CR>
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open hotkeys
map <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>

" Buffers操作快捷方式!
" nnoremap <C-RETURN> :bnext<CR>
" nnoremap <C-S-RETURN> :bprevious<CR>

" Jump to start and end of line using the home row keys
nnoremap H ^
nnoremap L $

" K/J keys for 5 times k/j (faster navigations)
nnoremap K 5k " TODO:disable vim-go default key binding
nnoremap J 5j

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open init.nvim anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
"inoremap <silent><expr> <c-.> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd User CocJumpPlaceholder call
                        \ CocActionAsync('showSignatureHelp')

" coc action(coc removed CocAction&CocFix methods, so help yourself)
command! -nargs=* -range Cas :call CocActionAsync('codeActionRange', <line1>, <line2>, <f-args>)

" coc-go
" goimports
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" vim-go config TODO: coc config for go
"nnoremap <leader>er :GoIfErr
let g:go_def_mapping_enabled = 0

" Use leader sd to show documentation in preview window.
nnoremap <silent> <leader>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>

" CocRestart
nnoremap <leader>cr  :CocRestart<cr>

" Coc CodeAction
command! -nargs=* -range CocAction :call CocActionAsync('codeActionRange', <line1>, <line2>, <f-args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"-----------------------------------------------------------------
" NERDTree Configs: 
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks

"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
" let g:NERDTreeShowLineNumbers=0 " 是否显示行号
" let g:NERDTreeHidden=0     "不显示隐藏文件

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" ranger config
let g:ranger_map_keys = 0 " disable ranger.vim default keys
map <leader>ra :Ranger<CR>

" lf config
let g:lf_map_keys = 0 " disable lf.vim default keys
map <leader>lf :Lf<CR>

" lazygit config
map <leader>lg :LazyGit<CR>

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

set nu
set ruler

" go syntax highlighting options:

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Rainbow Pattern Config
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive config
" key maps 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gs :G<CR>
" diffget //2 -> left side
nmap <leader>gh :diffget //2<CR> 
" diffget //3 -> right side
nmap <leader>gl :diffget //3<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead', 
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline.vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='base16_pop'
"let g:airline_theme='molokai'
"let g:airline_theme='tomorrow'
"let g:airline_theme='cobalt2'
"let g:airline_theme='violet'
let g:airline_theme='dark'
"let g:airline_theme='light'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" folding diff in GV diff panel 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! FileType git setlocal foldlevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signify config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>hj <plug>(signify-next-hunk)
nmap <leader>hk <plug>(signify-prev-hunk)
nmap <leader>hJ 9999<leader>gJ
nmap <leader>hK 9999<leader>gk


" If you like colors instead(custom colors)
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf-checkout config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:fzf_layout = {'window':{'width':0.8,'height':0.8}}
" let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GBranch<CR>

let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_branch_actions = {
      \ 'track': {'keymap': 'ctrl-t'},
      \}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configs for certain languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-codefmt config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Formatting (only for bzl & proto, for other fileType let certain lsp do the work)
augroup autoformat_settings
  "autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType proto AutoFormatBuffer clang-format
  "autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  "autocmd FileType dart AutoFormatBuffer dartfmt
  "autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  "autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  "autocmd FileType rust AutoFormatBuffer rustfmt
  "autocmd FileType vue AutoFormatBuffer prettier
  "autocmd FileType bash,sh AutoFormatBuffer shfmt 
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown-preview config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_browser = 'firefox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dap debugging keymaps & configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive browse handler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FugitiveBrowseGitLab(remote, dir, rev, file, line)
  if a:remote =~# 'git@gitlab.arksec.cn:'
    let repo = substitute(a:remote, 'git@gitlab.arksec.cn:', '', '')
    let repo = substitute(repo, '\.git$', '', '')
    let url = 'https://gitlab.arksec.cn/'.repo
    if a:file != ''
      let url .= '/blob/'.a:rev.'/'.a:file
      if a:line != ''
        let url .= '#L'.a:line
      endif
    endif
    call netrw#BrowseX(url, 0)
    return 1
  endif
  return 0
endfunction

augroup FugitiveGitLab
  autocmd!
  autocmd User FugitiveGBrowsePre call FugitiveBrowseGitLab(<q-args>)
augroup END

hi Normal guibg=NONE ctermbg=NONE

