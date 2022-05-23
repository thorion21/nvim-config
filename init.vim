:set number
:set ruler
:set colorcolumn=80
:set autoindent

:set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

:set mouse=a

call plug#begin()

Plug 'vim-airline/vim-airline'          " Lower bar which indicates stats of the cursor and file
Plug 'sheerun/vim-polyglot'             " Syntax highlighting for many languages
Plug 'preservim/nerdtree'               " File explorer integrated in nvim
Plug 'preservim/tagbar'                 " Browse current file and get an overview of declared functions
Plug 'rafi/awesome-vim-colorschemes'    " Many colorschemes
Plug 'luochen1990/rainbow'              " Colored matching brackets
Plug 'ryanoasis/vim-devicons'           " Icons for files in the file explorer
Plug 'kyazdani42/nvim-web-devicons'     " Icons for the files in tabs
Plug 'romgrk/barbar.nvim'               " Tab support for nvim
Plug 'voldikss/vim-floaterm'            " Toggle terminal
Plug 'neovim/nvim-lspconfig'            " LSP Support for different languages
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Autocomplete

call plug#end()

" NERDTree
nnoremap ` :NERDTreeFocus<CR>
nnoremap <C-`> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Activate Rainbow Brackets
let g:rainbow_active = 1

" Set font
if exists(':GuiFont')
    GuiFont! FuraCode Nerd Font Mono:h14
endif

" Set theme
colorscheme gruvbox

" File encoding
set encoding=UTF-8

" Line wrap
set wrap

" Move to previous/next
nnoremap <silent>    <M-,> :BufferPrevious<CR>
nnoremap <silent>    <M-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
nnoremap <silent>    <M->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <M-1> :BufferGoto 1<CR>
nnoremap <silent>    <M-2> :BufferGoto 2<CR>
nnoremap <silent>    <M-3> :BufferGoto 3<CR>
nnoremap <silent>    <M-4> :BufferGoto 4<CR>
nnoremap <silent>    <M-5> :BufferGoto 5<CR>
nnoremap <silent>    <M-6> :BufferGoto 6<CR>
nnoremap <silent>    <M-7> :BufferGoto 7<CR>
nnoremap <silent>    <M-8> :BufferGoto 8<CR>
nnoremap <silent>    <M-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <M-w> :BufferClose<CR>

" Floating terminal
nnoremap   <silent>   <M-n>    :FloatermNew<CR>
tnoremap   <silent>   <M-n>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <M-[>    :FloatermPrev<CR>
tnoremap   <silent>   <M-[>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <M-]>    :FloatermNext<CR>
tnoremap   <silent>   <M-]>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <M-t>   :FloatermToggle<CR>
tnoremap   <silent>   <M-t>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <M-q>   :FloatermKill<CR>
tnoremap   <silent>   <M-q>   <C-\><C-n>:FloatermKill<CR>

" Start neovim with two vertical panels
" autocmd VimEnter * vsplit

" Coc show documentation on hint
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" external config files (in lua)
luafile ~/.config/nvim/lsp.lua

