set nocompatible
filetype plugin on
syntax on
set mouse=a
set noswapfile
set incsearch
set icm=split " makes it so you can use incremental highlighting on commands 
set linebreak
set cursorline
set clipboard=unnamed
set cmdheight=2

set ignorecase
set hlsearch
set wildmenu

"" tabs
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set signcolumn=number
" set number
" set relativenumber
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"" Plugins

"call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data') . '/plugged')
"" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'

Plug 'metakirby5/codi.vim'

"" indentation plugins
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

""text objects
Plug 'b4winckler/vim-angry'

" junegunn
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/seoul256.vim'

"" lsp functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" notational velocity
"" https://github.com/alok/notational-fzf-vim
Plug 'alok/notational-fzf-vim'

"" syntax pack
Plug 'sheerun/vim-polyglot'

"" Colors
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'rose-pine/neovim'
" Plug 'itchyny/lightline.vim'

""git
Plug 'airblade/vim-gitgutter'

"" tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'

"" Web Development
"
Plug 'maxmellon/vim-jsx-pretty'

Plug 'evanleck/vim-svelte'

Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" "" Go Language plugin
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"" iterm
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


nnoremap <C-n> <cmd>nohlsearch<cr>
"" leader key
map <Space> <Leader>
nnoremap  <Leader>w :w<cr>
nnoremap  <Leader>ev :e $MYVIMRC<cr>
nnoremap  <Leader>d <cmd>NV<cr> 
nnoremap  <Leader>gg <cmd>Goyo<cr> 
nnoremap <Leader>cc :call ToggleDarkMode()<cr>
nnoremap <Leader><space> :Commands<cr>

"FZF
nnoremap <Leader>f <cmd>Files<cr>
nnoremap <Leader>b <cmd>Buffers<cr>
nnoremap <Leader>/ <cmd>BLines<cr>

" CoC
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>l :<C-u>CocList diagnostics<cr>

"" keybindings
"
map <C-p> <cmd>GFiles<cr>
inoremap <C-e> <End>
inoremap <C-a> <Home>

noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

"" Goyo "
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!



"" CoC 
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


" Make <CR> auto-select the first completion item and notify coc.nvim coto
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Colors
colo rose-pine
set background=dark
let g:rose_pine_variant='base'
"" function to toggle colorscheme 
let s:dark_mode_enabled = 1
function! ToggleDarkMode()
    if s:dark_mode_enabled
        colorscheme rose-pine
        let g:rose_pine_variant='dawn'
        let s:dark_mode_enabled=0
        set background=light
    else
        colorscheme rose-pine
        let g:rose_pine_variant='base'
        let s:dark_mode_enabled=1
        set background=dark
    endif
endfunction


"" Notational Velocity
let g:nv_search_paths = ['~/Documents/notes']
let g:nv_default_extension = '.md'
" Boolean. Wrap text in preview window.
let g:nv_wrap_preview_text = 1

"" Vim-Markdown
let g:markdown_fenced_languages = ['html', 'python', 'applescript', 'javascript', 'bash=sh']

"" Javascript


""  Treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
additional_vim_regex_highlighting = false,
},
}
EOF


" Add command to format with coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"" source .virmc on write
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $MYVIMRC"
