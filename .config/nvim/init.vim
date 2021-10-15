set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

set nocompatible              " be iMproved, required
filetype off                  " required

"all of this needs to be redone for nvim 5.0

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugins/')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'vimwiki/vimwiki'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'                 "Plugin for git
Plug 'ntpeters/vim-better-whitespace'
Plug 'farseer90718/vim-taskwarrior'       "Plugin to allow for taskwarrior
Plug 'bignimbus/pop-punk.vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'kdheepak/lazygit.nvim', {'branch': 'nvim-v0.4.3'}
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim' "Need to install neovim 5.0 (nightly)

call plug#end()

colorscheme "pop_punk"
let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:airline_theme = "pop_punk"

filetype plugin indent on    " required
filetype plugin on

let python_highlight_all = 1
let g:go_def_mapping_enabled = 0

"---LazyGit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

"---Basic VIM Settings
syntax on
set number
set relativenumber
set encoding=utf-8
set ruler
set cursorline
set background=dark
set so=999
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

"---Compile and Run file on F4 key press
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

let NERDTreeDirArrows=1

"---DevIcons glyph padding
let g:WebDevIconsNerdTreeAfterGlypghPadding=' '

"---NAV KEY BINDS----
map <C-h> <C-w>h
map <C-j> <C-W>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <c-x><c-k> <c-x><c-k>

let mapleader=" "
map <leader>nt :NERDTreeToggle<CR>
map <leader>lg :LazyGit<CR>
map <leader>tb :TagbarToggle<CR>
map <leader>st :Startify<CR>

"---REMAP VIM SPLITs
set splitbelow
set splitright

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <C-B> :b <C-Z>

"---Airliner Changes
let g:airline#extensions#tabline#enabled = 1

"---NEOCOMPLETE---
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocompelte#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


"---KeyRemaps
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"---DEF DICT.
let g:necomplete#sources#dictionary#dictionaries ={
     \ 'default'  : ' ',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme'   : $HOME.'/.gosh_completions'
     \}

"---Def Keyword
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:task_rc_override = 'rc.defaultwidth=0'
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ "Unknown"   : "?"
	\}

"---UtilSnipD
let g:UltiSnipsExpandTriggers="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Blog',
            \ '~/Code',
            \ '~/Pics',
            \ ]

"Startify settings
let g:startify_session_autoload = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

" CSV (AUTO OPENS AS TABLE)-----------------------------------------------------------------------
aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end

"---- NerdCommentor
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
