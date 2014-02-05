set wildignore+=_site,bin,css,js
set wildignore+=tags

nnoremap <silent> <F3> :call system("bundle exec jekyll build")<CR>
