#!/usr/bin/env bash

bin/jekyll build
rsync --verbose --recursive --delete _site/ jacky@blog.jalcine.me:/var/www/blog.jalcine.me
