set nocompatible
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set selectmode=mouse
set expandtab
set ls=2
set ignorecase
set smartcase
set incsearch
set ruler
set scrolloff=4

set nobackup
set nowritebackup

execute pathogen#infect()

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

colorscheme elflord
syntax on

set hidden

set hlsearch
highlight Search cterm=NONE ctermfg=yellow  ctermbg=blue

highlight ColorColumn ctermbg=25
set colorcolumn=120

nmap <ESC>[1;5C w
nmap <ESC>[1;5D b

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR><CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR><CR>

au BufRead *.tex setlocal spell spelllang=en_us
au BufRead *.tex syntax spell toplevel

nmap <F5> :!make<CR>
imap <F5> <ESC>:!make<CR>

command W :w | !make
command Trailspace %s/\s\+$//

call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('n', '', 0, 'ui', ':w<CR>')
call arpeggio#map('i', '', 0, 'ui', '<Esc>:w<CR>')
call arpeggio#map('n', '', 0, 'm,', ':W<CR>')
call arpeggio#map('i', '', 0, 'm,', '<Esc>:W<CR>')
call arpeggio#map('n', '', 0, 'ip', 'Oimport ipdb<CR>ipdb.set_trace()<Esc>')
call arpeggio#map('n', '', 0, 'NM', 'Oif __name__ == "__main__":<CR><Tab>')
call arpeggio#map('n', '', 0, 'e3', 'o\begin{enumerate}<CR><Tab>\item<CR><backspace>\end{enumerate}<Esc>ko')
call arpeggio#map('n', '', 0, 'r4', 'o\begin{itemize}<CR><Tab>\item<CR><backspace>\end{itemize}<Esc>ko')

filetype plugin indent on
au FileType coq call coquille#FNMapping()
au FileType coq let g:coquille_auto_move='false'

autocmd FileType make setlocal noexpandtab

autocmd syntax match Tab /\t/
highlight Tab ctermbg=red

set number
highlight LineNr ctermfg=DarkGrey ctermbg=234

" Must obey LocalWords
function! AutoSpellGoodWords(marker_text)
    call cursor(1, 1)
    let l:marker_text = a:marker_text

    let l:lines = []
    let l:goodwords_start = search(l:marker_text, 'cW')
    let l:line = getline(l:goodwords_start)
    let l:header = strpart(l:line, 0, strlen(l:marker_text))
    if l:header == l:marker_text
        call insert(l:lines, l:line)
    endif

    while l:goodwords_start > 0
        let l:goodwords_start = search(l:marker_text, 'W')
        if l:goodwords_start == 0
            break
        end
        let l:line = getline(l:goodwords_start)
        let l:header = strpart(l:line, 0, strlen(l:marker_text))
        if l:header == l:marker_text
            call insert(l:lines, l:line)
        endif
    endwhile

    let l:words = []
    for l:line in l:lines
        let l:line = strpart(l:line, strlen(l:marker_text) + 1)
        call extend(l:words, split(l:line))
    endfor
    for l:word in l:words
        silent execute ':spellgood! ' . l:word
    endfor
endfunction

autocmd FileType tex call AutoSpellGoodWords('%%  LocalWords:')
" Done obeying LocalWords

