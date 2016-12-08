" File: .vimrc.local
" Author: Jacky Alcine <me@jalcine.me>
" Description: Local options for jalcine-website.
" Last Modified: February 07, 2015

set wildignore+=_site/*
set wildignore+=src/_assets/.sass-cache/*

let g:formatters_html = ['tidy']
