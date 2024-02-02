" # BASIC SETUP:

" enter the current millenium
set nocompatible              " be iMproved, required

" enable syntax and plugins (for netrw)
syntax enable
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=light
endif
filetype plugin on

" # Cursor format
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" # FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" # TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" # AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" # FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" # SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>3jf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)" 


" # EASYMOTION
map \ <Plug>(easymotion-prefix)
" Move to line
map gl <Plug>(easymotion-bd-jk)
nmap gl <Plug>(easymotion-overwin-line)
" \f{char} to move to {char}
map  gc <Plug>(easymotion-bd-f)
nmap gc <Plug>(easymotion-overwin-f)
" Move to word
map  gr <Plug>(easymotion-bd-w)
nmap gr <Plug>(easymotion-overwin-w)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1


" # SNEAK
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


" # SPELL CHECK
set spelllang=en_gb
set spellfile=$HOME/.vim/en.utf-8.add
set nospell


" # MY SETTINGS:
set number relativenumber " Set hybrid line numbering
set hidden            " Allow editing multiple files.
"let mapleader = 'g'
"let maplocalleader = 'g'
set textwidth=79
set mouse=a
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>


" # TODO.TXT SETTINGS:
"" Use todo#complete as the omni complete function for todo files
"au filetype todo setlocal omnifunc=todo#complete
"
"" Auto complete projects
"au filetype todo imap <buffer> + +<C-X><C-O>
"
"" Auto complete contexts
"au filetype todo imap <buffer> @ @<C-X><C-O>


" # VUNDLE:

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ## markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" ## vim-tmux navigator
Plugin 'christoomey/vim-tmux-navigator'
" ## easymotion
Plugin 'easymotion/vim-easymotion'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}

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

"" Window resizing
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Up> :vertical resize +5<CR>
nnoremap <Down> :vertical resize +5<CR>

"" Change some highlighting colours
highlight DiffAdd ctermbg=7
highlight DiffDelete ctermbg=7
highlight DiffChange ctermbg=7
highlight DiffText ctermbg=227
highlight Folded ctermbg=15
highlight ColorColumn ctermbg=7

"" Add pathogen
execute pathogen#infect()
