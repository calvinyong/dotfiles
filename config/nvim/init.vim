"""""""""""""""""""""""""""""""""""""""""""
"  _       _ _               _            "
" (_)_ __ (_) |_      __   _(_)_ __ ___   "
" | | '_ \| | __|     \ \ / / | '_ ` _ \  "
" | | | | | | |_   _   \ V /| | | | | | | "
" |_|_| |_|_|\__| (_)   \_/ |_|_| |_| |_| "
"                                         "
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Visual
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Python
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

" LaTeX
Plug 'lervag/vimtex'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'haishanh/night-owl.vim'
Plug 'ayu-theme/ayu-vim'

" Airline
Plug 'vim-airline/vim-airline'

" Cool Stuff
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'

" Other plugins
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-slash'

" Fun
Plug 'junegunn/vim-emoji'
Plug 'dylanaraps/wal.vim'

" Stuff to remember
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'vimwiki/vimwiki'
" Plug 'tpope/vim-commentary'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'Yggdroot/indentLine'

" Always last one
Plug 'ryanoasis/vim-devicons'
call plug#end()

""""""""""""""""""
" Plugin Options "
""""""""""""""""""

" Startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'},
                           \ {'b': '~/.config/bspwm/bspwmrc'},
                           \ {'s': '~/.config/sxhkd/sxhkdrc'},
                           \ {'z': '~/.zshrc'} ]

" Airline
set noshowmode
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 0

" Set colorscheme options
let g:nord_underline = 1
let g:nord_uniform_diff_background = 1
let g:ayucolor="mirage"

" Set true color and colorscheme
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme nord
" highlight Normal guibg=black guifg=white

" LaTex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})

" Python
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0

" Ale
let g:ale_linters = {
    \ 'python': ['flake8'],
    \}
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_completion_enabled = 0

" Gitgutter signs
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Other
let g:gutentags_cache_dir='~/.cache/ctags'
let NERDTreeHighlightCursorline = 0
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:sneak#label = 1
set completefunc=emoji#complete
" let g:NERDTreeLimitedSyntax = 1

""""""""""""""
" vim config "
""""""""""""""

" Line numbering
set nu
set rnu

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Spell check
autocmd FileType markdown,tex setlocal spell spelllang=en_us

"""""""""""
" Keymaps "
"""""""""""

let mapleader = " "
let maplocalleader = " "

map <F7> :NERDTreeToggle<CR>
nmap <F8> :Vista!!<CR>
" Run current file
nnoremap <F9> :!%:p<Enter>
