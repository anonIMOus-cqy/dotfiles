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

let g:Tex_Env_definition = "\\begin{definition}[<++>]<++>\<CR><+content+>\<CR>\\label{def:<+label+>}\<CR>\\end{definition}\<CR>\<++>"
let g:Tex_Env_example = "\\begin{example}[<++>]<++>\<CR><+content+>\<CR>\\label{ex:<+label+>}\<CR>\\end{example}\<CR>\<++>"
let g:Tex_Env_theorem = "\\begin{theorem}[<++>]<++>\<CR><+content+>\<CR>\\label{thm:<+label+>}\<CR>\\end{theorem}\<CR>\<++>"
let g:Tex_Env_remark = "\\begin{remark}[<++>]<++>\<CR><+content+>\<CR>\\label{rmk:<+label+>}\<CR>\\end{remark}\<CR>\<++>"
let g:Tex_Env_proposition = "\\begin{proposition}[<++>]<++>\<CR><+content+>\<CR>\\label{props:<+label+>}\<CR>\\end{proposition}\<CR>\<++>"
let g:Tex_Env_notation = "\\begin{notation}[<++>]<++>\<CR><+content+>\<CR>\\label{not:<+label+>}\<CR>\\end{notation}\<CR>\<++>"
let g:Tex_Env_identity = "\\begin{identity}[<++>]<++>\<CR><+content+>\<CR>\\label{ident:<+label+>}\<CR>\\end{identity}\<CR>\<++>"
let g:Tex_Env_property = "\\begin{property}[<++>]<++>\<CR><+content+>\<CR>\\label{prop:<+label+>}\<CR>\\end{property}\<CR>\<++>"


" Enable hotkey mappings (currently not working)
let g:Tex_HotkeyMappings = 'definition, example, theorem, remark'
