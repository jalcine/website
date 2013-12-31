set wildignore+=_site,bin,css,js
set wildignore+=tags

nnoremap <F4> :call system("bin/rake transfer")<CR>
