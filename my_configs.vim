set guifont=Monaco:h14
set nocompatible
set shell=/bin/bash
set lines=108 columns=260
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
autocmd vimenter * NERDTree
syntax enable
set background=dark
let g:NERDTreeWinPos = "left"

map <F2> :NERDTreeToggle<CR>
syntax on

syntax enable
let g:solarized_termcolors=256
colorscheme solarized


set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

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
