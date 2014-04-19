set wildignore+=_site,bin,css,js
set wildignore+=tags

func! s:build_blog()
  silent :Dispatch bundle exec jekyll build
endfunc

func! s:publish_blog()
  silent :Dispatch rsync --verbose --delete --recursive ./_site/* jalcine.me:/var/www/jalcine.me
endfunc

func! s:clean_blog()
  silent :Dispatch rm _site -rvf
endfunc

command! -nargs=0 BlogBuild   call s:build_blog()
command! -nargs=0 BlogClean   call s:clean_blog()
command! -nargs=0 BlogPublish call s:publish_blog()
