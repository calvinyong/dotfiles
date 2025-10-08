""""""""""""""""""""""""""""""""""""""""
"                           _          "
"    ____  ___  ____ _   __(_)___ ___  "
"   / __ \/ _ \/ __ \ | / / / __ `__ \ "
"  / / / /  __/ /_/ / |/ / / / / / / / "
" /_/ /_/\___/\____/|___/_/_/ /_/ /_/  "
"                                      "
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""
" General Settings "
""""""""""""""""""""

" Line numbering
set nu
set rnu

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Case insensitive on lower case, sensitive on uppercase
set ignorecase
set smartcase

" Break at convenient points rather than last character
set linebreak

" Spell check
"autocmd FileType markdown,tex setlocal spell spelllang=en_us
autocmd FileType tex setlocal spell spelllang=en_us

" Disable provider warnings in checkhealth
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" set wildmode=longest,list,full
" set smoothscroll


""""""""""""
" Keybinds "
""""""""""""

" Space for leader key
let mapleader = " "
let maplocalleader = " "

nnoremap <Leader>w <C-w>
nmap K :ALEHover<CR>
map <F7> :NERDTreeToggle<CR>
nmap <F8> :Vista!!<CR>
" Run current file
nnoremap <F9> :!%:p<Enter>


""""""""""""""""""
" Visual Options "
""""""""""""""""""

" Startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'},
                           \ {'b': '~/.config/bspwm/bspwmrc'},
                           \ {'s': '~/.config/sxhkd/sxhkdrc'},
                           \ {'z': '~/.zshrc'} ]
"let g:startify_files_number = 5
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]


" Nord colorscheme options
let g:nord_underline = 1
let g:nord_italic = 1
let g:nord_uniform_diff_background = 1

" Airline
set noshowmode
" let g:airline_theme = 'onedark'
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 0


""""""""""""""""""
" Plugin Options "
""""""""""""""""""

" Some of these options like polyglot_disabled need
" to be set before the plugin is sourced

" Ale
let g:ale_linters = {
    \ 'python': ['ruff', 'mypy'],
    \ 'rust': ['analyzer'],
    \ 'sql': ['sqlfluff'],
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
"let g:ale_hover_to_preview = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:echodoc_enable_at_startup = 1
autocmd CompleteDone * silent! pclose!

" LaTex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

" Sneak
let g:sneak#label = 1
"highlight Sneak guifg=white guibg=black ctermfg=white ctermbg=black

" Polyglot
let g:polyglot_disabled = ['markdown', 'tex', 'rust']

" Other
let NERDTreeHighlightCursorline = 0
let g:SuperTabDefaultCompletionType = '<c-n>'
" let g:NERDTreeLimitedSyntax = 1


"""""""""""
" Plugins "
"""""""""""

call plug#begin(stdpath('data') . '/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Visual
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim'

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
"Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'jiangmiao/auto-pairs'

" Other plugins
"Plug 'sheerun/vim-polyglot'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Last one, according to devicons readme
Plug 'ryanoasis/vim-devicons'

" Colorschemes
" Plug 'oxfist/night-owl.nvim'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Stuff to remember
" Plug 'Yggdroot/indentLine'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'vimwiki/vimwiki'
" Plug 'dylanaraps/wal.vim'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'junegunn/goyo.vim'

call plug#end()


"""""""""""""""""""""""""""""""""
" Options after plugins sourced "
"""""""""""""""""""""""""""""""""

" Deoplete
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})

colorscheme nord

" Don't highlight _ in markdown
hi link markdownError Normal
