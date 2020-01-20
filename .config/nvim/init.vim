" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tbrowang	<tbrowang@gmail.com>            +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/07/30 22:07:54 by tbrowang          #+#    #+#              "
"    Updated: 2019/08/01 16:15:55 by drigin           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'pandark/42header.vim'
Plug 'itchyny/lightline.vim'
Plug 'brookhong/cscope.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()


"-------------------------------- MISC CONFIG ----------------------------------
set linebreak
set nowrap
set ruler
set number
set showmatch
syntax on
set noswapfile
set mouse=a
set nrformats+=alpha
set shiftwidth=4
set tabstop=4
set splitbelow
set splitright
set colorcolumn=81
set wildignorecase
colo delek
command! W :w
command! WQ :wq
command! Wq :wq


"-------------------------------- PALENIGHT ------------------------------------
set background=dark
colorscheme palenight
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1


"-------------------------------- MISC MAPPINGS --------------------------------
iabbrev mainc int		main(int argc, char **argv)<cr>{<cr><esc>
noremap <leader>h :noh<CR>
nnoremap <Esc><Esc> :w<CR>
nnoremap <S-w> :w<CR>
nnoremap <S-q> :q<CR>
inoremap { {<CR>}<esc>O
inoremap ( ()<Left>
inoremap [ []<Left>
tnoremap <Esc> <C-\><C-n>


"-------------------------------- IJKL ARROWS ----------------------------------
noremap <A-o> o
noremap ø o
noremap o <Up>
noremap k <Left>
noremap l <Down>
noremap ; <Right>
inoremap <A-o> <Up>
inoremap <A-k> <Left>
inoremap <A-l> <Down>
inoremap <A-;> <Right>


"-------------------------------- TOGGLE HYBRID NUMBERS ------------------------
augroup numbertoggle
  autocmd!
  autocmd InsertEnter * set relativenumber
  autocmd InsertLeave   * set norelativenumber
augroup END


"-------------------------------- CLIPBOARD ------------------------------------
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


"-------------------------------- SYNTASTIC ------------------------------------

let g:syntastic_loc_list_height = 10
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_enable_highlighting = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['include', 'libft/include', '../include', '../libft/include']


"-------------------------------- CSCOPE ---------------------------------------
let g:cscope_silent = 1
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>k :call ToggleLocationList()<CR>

" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


"-------------------------------- NERDTREE ----------------------------------------
map <C-b> :NERDTreeToggle<CR>
let g:NERDDTreeHijackNetrw = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"-------------------------------- LIGHTLINE-------------------------------------
let g:lightline = {'colorscheme': 'palenight'}
set noshowmode


"-------------------------------- NVIM TERM ------------------------------------
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height * 2
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

if has('nvim')
	nnoremap <localleader>t :call Term_toggle(10)<cr>
	tnoremap <localleader>t <C-\><C-n>:call Term_toggle(10)<cr>
endif


"-------------------------------- NERDCommenter --------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"-------------------------------- MULTIPLE CURSOR-------------------------------
let g:multi_cursor_start_word_key      = '<C-h>'
let g:multi_cursor_next_key            = '<C-h>'
