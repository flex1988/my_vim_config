set guifont=Monaco:h12
set nocompatible
set shell=/bin/bash
set lines=128 columns=300
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
"autocmd vimenter * NERDTree
syntax enable
set background=dark
let g:NERDTreeWinPos = "left"

map <F2> :NERDTreeToggle<CR>
syntax on

let g:solarized_termcolors=256
colorscheme solarized


set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "PointerAlignment" : "Right",
            \ "ColumnLimit": 140,
            \ "BasedOnStyle": "Mozilla"}

"let g:clang_format#style_options = {
    "\ "BasedOnStyle":"Google",
    "\ "IndentWidth":4,
    "\ "AllowShortIfStatementsOnASingleLine": "false"}

"map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
nmap <leader>n :NERDTree<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

"set foldmethod=indent
set foldmethod=syntax
set nofoldenable

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
