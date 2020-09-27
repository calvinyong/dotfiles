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
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Python
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/echodoc.vim'

" Language support
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

" Cool Stuff
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'jiangmiao/auto-pairs'

" Other plugins
let g:polyglot_disabled = ['markdown', 'tex', 'rust']
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Fun
Plug 'junegunn/vim-emoji'

" Stuff to remember
" Plug 'Yggdroot/indentLine'
" Plug 'tpope/vim-repeat'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'vimwiki/vimwiki'
" Plug 'dylanaraps/wal.vim'
" Plug 'tpope/vim-commentary'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'junegunn/goyo.vim'

" Colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'haishanh/night-owl.vim'
" Plug 'ayu-theme/ayu-vim'


" Last one, according to devicons readme
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
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 0

" Set true color and colorscheme
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" LaTex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

" Deoplete
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:echodoc_enable_at_startup = 1
autocmd CompleteDone * silent! pclose!

" Gitgutter signs
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Sneak
let g:sneak#label = 1
"highlight Sneak guifg=white guibg=black ctermfg=white ctermbg=black

" Other
let g:gutentags_cache_dir='~/.cache/ctags'
let NERDTreeHighlightCursorline = 0
let g:SuperTabDefaultCompletionType = '<c-n>'
set completefunc=emoji#complete
" let g:NERDTreeLimitedSyntax = 1

""""""""""""""
" vim config "
""""""""""""""

source $XDG_CONFIG_HOME/nvim/themes/nord.vim

source $XDG_CONFIG_HOME/nvim/plug-configs/ale.vim

source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/keymaps.vim
