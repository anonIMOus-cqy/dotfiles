nnoremap <silent> <buffer> <localLeader>p :silent! execute "silent! !zathura ".expand('%:r').'.pdf &' \| redraw!<cr>
command Rmd execute "!echo 'require(rmarkdown); render(\"".expand("%")."\")' \| R --vanilla"

