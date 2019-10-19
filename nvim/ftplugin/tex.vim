set iskeyword+=:
set ts=2
set sw=2
set sts=2
set expandtab
set spell spelllang:en_ca

" Enable `Alt` key macros
let g:Tex_AdvancedMath = 1

function! UpdatePDF()
    silent! execute "silent! Start! latexmk -f -silent %"
endfunction

function! StartLatexmk()
    " if exists("b:latexmkStarted")
    "     echo "latexmk is already running"
    " else
    "     let b:latexmkStarted = 1
        Start! st -e latexmk -f -silent -pvc %
        echo "latexmk is now running"
    " endif
endfunction

function! StartZathura()
    silent! Start! 'zathura '.expand('%:r').'.pdf'
endfunction

command! Lat execute '!latexmk '.expand('%')
command! Latg execute '!latexmk -g '.expand('%')

command! Latl execute '!latexmk -pdflatex=lualatex '.expand('%')
command! Latlg execute '!latexmk -pdflatex=lualatex -g '.expand('%')

command! Latx execute '!latexmk -pdflatex=xelatex '.expand('%')
command! Latxg execute '!latexmk -pdflatex=xelatex -g '.expand('%')

nnoremap <silent> <buffer> <localLeader>o :call StartLatexmk()<cr>
nnoremap <silent> <buffer> <localLeader>p :silent! execute "silent! !zathura ".expand('%:r').'.pdf &' \| redraw!<cr>

" imap <localleader>i <Plug>Tex_InsertItemOnThisLine
" nmap <localleader>i <Plug>Tex_InsertItemOnThisLine
" vmap <localleader>i <Plug>Tex_InsertItemOnThisLine

" imap <localleader>t \text{<++>}<++><Esc>T\<Plug>IMAP_JumpForward

" autocmd TextChanged *.tex call UpdatePDF()
" autocmd TextChangedI *.tex call UpdatePDF()
" autocmd BufWritePost * call UpdatePDF()

