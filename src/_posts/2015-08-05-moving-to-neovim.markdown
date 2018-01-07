---
title: "Moving to Neovim from Vim"
byline: To asynchronous modal editing and BEYOND!
date: 2015-08-05 13:46:30 EDT
category: vim
tags:
  - vim
  -  neovim
  - transition
excerpt: Man, Neovim is the bee’s knees.

---

I've recently moved my [Vim configuration][1] from targeting [classical Vim][vim]
to the fork of it dubbed [Neovim][]. Personally, if you've used Vim for some
time, I recommend installing and firing up `nvim` to try it out. It comes with a
lot [of saner defaults][2], a [terminal emulator _within_ itself][3] and [job
control support][4]. This might all mean _nothing_ but consider the following
abilities of these:

  * [`neomake`][5]: Allows asynchronous checking of your files.
  * [`vim-test`][6]: Allows for testing your code immediately whilst in Vim.
  * [every thing in this post][11].

Those two plugins allow me to close at least one pane in tmux, something that's
always appreciated :smile:. Another thing that I've been meaning to do was
consolidating a lot of the options I had for Vim into a single file. When I
used classical Vim, it looked something like this:

{% highlight bash %}
$ tree ~/.vim

├── .gvimrc
├── .local
│   └── bin
│       ├── markdown2ctags
│       └── vim-plugin-upgrade
├── .nvimrc.swp
├── .vim
│   ├── colors
│   │   ├── distinguished.vim
│   │   ├── hybrid.vim
│   │   ├── ironman.vim
│   │   ├── jellyx.vim
│   │   ├── kalisi.vim
│   │   ├── laederon.vim
│   │   ├── lucius.vim
│   │   └── ubaryd.vim
│   ├── dict.custom.utf8-8.add
│   ├── ftplugin
│   │   ├── cmake.vim
│   │   ├── cpp.vim
│   │   ├── c.vim
│   │   ├── gyp.vim
│   │   └── markdown.vim
│   ├── plugin
│   │   ├── 00_plugins.vim
│   │   ├── 10_options.vim
│   │   ├── 11_augroup.vim
│   │   ├── 12_unite.vim
│   │   ├── 13_mappings.vim
│   │   ├── 14_tags.vim
│   │   ├── 99_abbrev.vim
│   │   ├── 99_colors.vim
│   │   └── 99_syntax.vim
│   └── UltiSnips
│       └── qt.snippets
└── .vimrc
{% endhighlight %}

I took advantage of Vim's plugin system to load in more options for non-core Vim
functionality[^1]. At that time, I also used [**72 plugins**][7]. It was a
_lot faster_ than you'd believe.

Over time though, the combined functionality of these plugins and modal editing
began to clash. Things like [Syntastic][] freezing whenever I saved a file or
even [my own plugin][8] becoming more [slow to use][9] in neovim prompted my
transition to the application.

## Actually Moving to Neovim

The first thing I did was [delete everything][10]. This is so much easier to do
when you have your configuration versioned so you can fetch what you need and
nothing more. Working on a clean slate for neovim also gave me a few hours to
understand how different it would be compared to Vim out of the box; an
experience that's led to some harsh times for new comers. An example of this
would be the [`backspace` option][20]. By default in neovim, it's currently
`:set backspace=indent,eol,start`, which is what most people have defined in
their vimrc.

The _very_ next thing I did was look for a plugin manager. As we've established
, I'm a bit of a plugin junkie, indulging in my polyglot behavior so finding one
was at the top of my list. There's quite a few tools to use like [Pathogen][],
[Vundle][], [NeoBundle][], [VAM][] and the likes. I ended up using [vim-plug][].
It's a plug-n-play kind of plugin which allows for it to be fixed to a specific
version in my sources. It also comes with a snapshotting command so that once
I feel comfortable with the interoperability of the plugins I have currently,
I can lock them into place :100:. I mean, look at it.

![Plug for vim in action](https://raw.githubusercontent.com/junegunn/i/master/vim-plug/installer.gif){: .present}

Start up time for neovim is below ten milliseconds with vim-plug and all of my
plugins, currently over ~50 or so (it's inevitable).
{% highlight bash %}
$ time nvim +qall

real    0m0.066s
user    0m0.008s
sys     0m0.004s
{% endhighlight %}

This is a bit of a false reading; this is without `filetype plugin indent on`
set. With that set, the numbers spiked up a bit but not to a show-stopping rate:

{% highlight bash %}
$ time vim +qall

real    0m0.489s
user    0m0.420s
sys     0m0.048s
{% endhighlight %}

Nearly a half-second extra. Lawd :confused:. We both know why this
happened though.

## Adding Plugins

Now, adding plugins for neovim was a bit easier now that I had vim-plug in tow.
The other angle to be considered here is what plugins took advantage of the
asynchronous nature of neovim. I was looking to see if [support for neovim was
added to Syntastic][12] but no such mention was found :sob:. This led me to move
to [neomake][5], an alternative to Syntastic but runs asynchronously in Vim. The
list of makers (or checkers) for neomake [is growing][13] but as with all good
things, had there been a way to merge both Syntastic and neomake together, it
would benefited users a lot for not needing to transition over. My old Syntastic
configuration looked a [bit like this][14]:

{% highlight vim %}
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*', '*build*', '*LOCAL*', '*BASE', '*REMOTE*']
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['rubocop','mri']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint','ycm','clang_tidy','clang_check']
let g:syntastic_c_checkers=['gcc','make','cppcheck','clang_tidy','clang_check']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['jshint']
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_enable_perl_checker=1
let g:syntastic_c_clang_tidy_sort=1
let g:syntastic_c_clang_check_sort=1
let g:syntastic_c_remove_include_errors=1
let g:syntastic_quiet_messages = { "level": "[]", "file": ['*_LOCAL_*', '*_BASE_*', '*_REMOTE_*']  }
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
let g:syntastic_java_javac_options = "-g:none -source 8 -Xmaxerrs 5 -Xmaswarns 5"
{% endhighlight %}

One can make the argument that I turned on a _lot_ of the checkers in Syntastic,
potentially leading to it slowing down. To that, I'd say:

{% img "bey-cant-deal.gif" alt:"Beyonce can't handle you right now." %}

**I NEEDZ THEM!** _*cough*_

---

Neovim's an interesting application and it's still young. There's a few things
that are being ironed out like the remote plugin architecture as well as the
native bindings for plugins in languages like [JavaScript][15], [Go][16], and
[Ruby][17]. Plugins of this nature can potentially allow the space for more
interesting auto completion tools to arise. There's also a lot of other things
that's been [worked on in neovim][18] for the long run and things to be
[targeted for the first public release][19]. I'm _really_ enjoying my experience
with it so far and since it's been proven that neovim has a bit of a more
forward-thinking commit policy than classic Vim, I'm anticipating my first
contribution to the project soon.

[1]: https://github.com/jalcine/vimrc
[2]: https://github.com/neovim/neovim/issues/2676
[3]: http://neovim.io/doc/user/nvim_terminal_emulator.html
[4]: http://neovim.io/doc/user/job_control.html
[5]: https://github.com/benekastah/neomake
[6]: https://github.com/janko-m/vim-test
[7]: https://github.com/jalcine/vimrc/blob/2f5f5d673ecfe26ba82cca3ca8c2cc05ff233194/home/.vim/plugin/00_plugins.vim#L21-L92
[8]: https://jalcine.github.io/cmake.vim
[9]: https://github.com/jalcine/cmake.vim/issues/67
[10]: https://github.com/jalcine/vimrc/commit/b3b937a270daa83c1d0f83a3bf098377c5d07616
[11]: http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/
[12]: https://github.com/scrooloose/syntastic/issues?utf8=%E2%9C%93&q=neovim
[13]: https://github.com/benekastah/neomake/tree/master/autoload/neomake/makers/ft
[14]: https://github.com/jalcine/vimrc/blob/2f5f5d673ecfe26ba82cca3ca8c2cc05ff233194/home/.vim/plugin/10_options.vim#L35-L67
[15]: https://github.com/fritzy/node-neovim
[16]: https://github.com/myitcv/neovim
[17]: https://github.com/alexgenco/neovim-ruby
[18]: https://github.com/neovim/neovim/wiki/Progress
[19]: https://github.com/neovim/neovim/milestones/0.1-first-public-release
[20]: http://vimhelp.appspot.com/options.txt.html#%27backspace%27
[^1]: It felt a bit faster though I have to invoke an actual time test.
[neobundle]: https://github.com/Shougo/neobundle.vim
[neovim]: http://neovim.io
[pathogen]: https://github.com/tpope/vim-pathogen
[syntastic]: https://github.com/scrooloose/syntastic
[vam]: https://github.com/MarcWeber/vim-addon-manager
[vim-plug]: https://github.com/junegunn/vim-plug
[vim]: http://vim.org
[vundle]: https://github.com/VundleVim/Vundle.vim
