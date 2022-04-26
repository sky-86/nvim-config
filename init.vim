" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" backup files can cause issues??
set nobackup
set nowritebackup

" give more space for display msg
set cmdheight=2

" Enable type file detection. Vim will be able to try to detect the type of file in use.
"filetype on
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" enable 256 colors in term
set t_Co=256

" enables true colors for nvim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Add numbers to each line on the left-hand side.
set number

" Set tab width to 4 columns.
set tabstop=4

" number of spaces for indentation
"set shiftwidth=4

" Stop cursor from scrolling to the bottom
set scrolloff=10

" Dont wrap lines
set nowrap

" Color set for dark screens
set background=dark

" Enables shared clipboard between vim and os
set clipboard=unnamedplus

" Highlight current line
"set cursorline

" modifies auto-complete menu to behave like ide
" set completeopt

" show line number starting from current line
set relativenumber

" change split screen behavior, always split below and right
" set splitbelow splitright

" Show file title
set title

" PLUGINS
call plug#begin()
   " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
	Plug 'morhetz/gruvbox'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

" Plugin configs

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Nerdtree
let NERDTreeShowHidden=1

" Langauge Server Stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Mappings

" ctrl+q force quit
nnoremap <C-q> :q!<CR>
" close open file
nnoremap <F4> :bd<CR>
" toggle nerdtree
nnoremap <F5> :NERDTreeToggle<CR>
" open terminal below
nnoremap <F6> :sp<CR>:terminal<CR>

" make nvim faster
set updatetime=300

" Dont pass msgs to ins-completion-menu
set shortmess+=c

" Always show a single column?
"set signcolumn=number

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" color theme
colorscheme gruvbox

" enter and shift enter place a new line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
