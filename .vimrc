set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" The bundles you install will be listed here
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'jamis/fuzzy_file_finder'
Plugin 'kien/ctrlp.vim'
"Bundle 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'groenewege/vim-less'

Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" The rest of your config follows here

set showmatch
set incsearch
set acd 
set ar
set exrc
set secure
set tabstop=4
set shiftwidth=4
set expandtab
set sol 
set nu

highlight LineNr ctermfg=blue

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.go set filetype=go

"search highlighting
set hlsearch

let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Powerline config
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Nerdtree config
map <F2> :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 1
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 0
"let g:pymode_lint_checker = 'pyflakes,pep8'
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" turn off colorcolumn at max_line_length
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 0

syn on

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pep8_ignore="E501"

" Don't autofold code
let g:pymode_folding = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬
"set list listchars=tab:»·,trail:·,extends:#

" Go to definition tab navigation
"nmap <leader>] :tabnext<CR>
"nmap <leader>[ :tabprevious<CR>
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>

" Vim-airline enable powerline fonts
let g:airline_powerline_fonts = 1

" Vim-airline themes
"let g:airline_theme = ''

"let g:airline_section_y = '%{strftime("%a, %m/%d/%y")}'

"nmap <leader>t :tabnew<CR>
"nmap <C-w>t :tabnew<CR>
:command T tabnew
:command -nargs=1 F :tabfind <args>
:command Q tabclose

"map <C-Shift><PageUp> :execute "tabmove" tabpagenr() - 2 <CR>
"map <C-Shift><PageDown> :execute "tabmove" tabpagenr() <CR>
"nmap <C-Shift><PageUp> :tabm +1
"nmap <C-Shift><PageDown> :tabm -1

nmap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nmap <silent> <C-S-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> <C-S-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

"nmap <silent> <C-S><PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nmap <silent> <C-S><PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>

" turn off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2


" Settings for gitgutter
highlight clear SignColumn

" Settings for indentLine
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#303030'

set backspace=indent,eol,start "fix backspace in mac
