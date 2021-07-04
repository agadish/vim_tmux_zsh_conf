" This is Asspagadish's vimrc

"""""""""""""""""""""""""""""" PLUGINS MANAGER
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jpfudger/vim-datetime'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'
Plugin 'glts/vim-magnum'
Plugin 'glts/vim-radical'
Plugin 'google/vim-searchindex'
Plugin 'sjl/gundo.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tibabit/vim-templates'

" Plugin 'google/vim-codefmt' TODO
" Syncopate helps to copy text with syntax colors, others are dependency and recommended
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-glaive'
" Plugin 'google/vim-syncopate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
"""""""""""""""""""""""""""""" CONFIG
source ~/.vim/config/basic.vim

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

""" Display
set term=xterm-256color
set t_Co=256
set notermguicolors

let g:rehash256 = 1
colorscheme molokai

set colorcolumn=80
set number relativenumber
" Switch between : and ;
nnoremap ; :
nnoremap : ;

" Easy line insertion
nnoremap <c-j> O<Esc>j
nnoremap <c-k> o<Esc>k
nnoremap <silent> <C-l> :nohls<Cr>

nnoremap <Leader><c-]> :exec("ltag ".expand(@/))<Cr>

vnoremap > >gv
vnoremap < <gv

nnoremap Y y$

nnoremap <leader><leader>r :source ~/.vimrc<Cr>
nnoremap <leader><leader>i :PluginInstall<Cr>
set history=1000
set undofile
set undodir=~/.vim/undodir

"""""""""""""""""""""""""""""" PLUGINS CONFIG
""" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

""" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Ignore .o ~ tags files
let NERDTreeIgnore=['\.o$', '\~$', 'tags']

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

""" EasyMotion
" map <Leader> <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

""" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

""" Surround
vmap s S

""" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

""" CtrlP
"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""" Tagbar
nnoremap <F8> :TagbarToggle<CR>

""" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_use_system_clangd = 0
let g:ycm_clangd_binary_path = "/usr/local"

noremap <Leader>d :YcmCompleter GoToDeclaration<Cr>
noremap <Leader>f :YcmCompleter GoToDefinition<Cr>
noremap <Leader><space> :YcmCompleter FixIt<Cr>
" noremap <Leader>t :TemplateAutoInit<Cr>
