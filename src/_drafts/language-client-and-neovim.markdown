---
layout: post
title: "Using Language Servers with Neovim for a Powerful Editor Experience"
date: 2018-07-25 16:10:20 PDT
tags:
  - vim
  - neovim
  - editor
category: guide
excerpt: NeoVim with Language Server makes for an interesting experience.
description: |
  I'm a big Vim user. My post about transitioning to Neovim from Vim is still
  one of my highest trafficked pages. However, after trying out Visual Studio
  Code and knowing that the underlying tooling is flexible enough to be used in
  Neovim, I got curious.
---

As noticed a lot, I'm a _big_ user of Vim. I use to write my journal entries,
notes or anything that I can capture into text and save to my local file system.

Recently, I [shared a link][1] with a friend who wanted to get TypeScript
support with [LanguageServer][2][^1] in Neovim. However, the post made quite
a few assumptions that, quite frankly, wasn't the most helpful given the
landscape for documentation for Vim plugin tooling. This post aims to make that
setup process a _lot_ simpler for you. If you have any questions; feel free to
leave them in the comments (or better yet, [send a WebMention][3]).

> At the time of writing, I'm working of the SHAs of the following projects:
>
>  * `ncm2/ncm2` @ [`bf1806e2ef`][sha-ncm2]
>  * `autozimu/LanguageClient-neovim` @ [`8acdc380dc`][sha-lcnvim]
>

## Getting Started

I'll need you to install a particular plugin that I personally use to get
completion support popping in NeoVim. It's named [`ncm2`][5]. It's still rough
around the edges but it does get the job done really well for my use cases.
Check out its [VimAwesome page][6] for installation instructions for your
particular plugin manager. I use `vim-plug` so it'll look like this:

```viml
" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'

" v2 of the nvim-completion-manager.
Plug 'ncm2/ncm2'

" LanguageServer client for NeoVim.
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
```

Easy! Save your options, install, refresh or what have you. Since I use
`vim-plug`, after re-sourcing my setup, I'd run `:PlugInstall`. Once you've
installed the plugins, be sure to run `:UpdateRemotePlugins` as well.

## Configuring the Completion Tool

So `ncm2` isn't _all listening_. It has a method `ncm2#enable_for_buffer`. For
the sake of this demo, I'll go with the suggested (aggressive) approach of
enabling it in _any_ buffer:

```viml
autocmd BufEnter  *  call ncm2#enable_for_buffer()
```

I don't feel immediately comfortable with this but the source shows it not being
as wild as I feared it to be. Next, setting up some options to expand the
in-built completion support NeoVim has:

```viml
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect
```

There's a few more things we can do here with `ncm2`. Gettings things like
[buffer symbol completion][7], [snippet support][8] and even
[Jedi][9] support could be done. That's outside of the scope of this particular
post, however.

## Connecting the Language Servers

Before we continue, I just want to note that because of how Language Server
works, you'll have to first install the respective server on your machine to
a path that NeoVim is aware of (from `$PATH` or within its [`rtp`][10]) and
_then_ update some configuration. Because it's not an IDE. That's how it works
in Vim land.

To test out the support of this, we'll install the [TypeScript language
server][10] to our machines. Running the following should get that working:

```zsh
# I pinned a version here so it matches what I ran when I wrote this blog.
$ npm install --global javascript-typescript-langserver@2.9.4
```

And now in your Vim configuration:

```viml
let g:LanguageClient_serverCommands = {
  \ 'typescript': ['javascript-typescript-stdio']
  \ }
```

Nice. Now if we open a new TypeScript file...


[1]: https://fortes.com/2017/language-servuer-neovim/
[2]: https://langserver.org/
[3]: /faq/how-to-reply/
[4]: https://web.archive.org/web/20180722174120/https://code.visualstudio.com/blogs/2016/06/27/common-language-protocol
[5]: https://github.com/ncm2/ncm2
[6]: https://vimawesome.com/plugin/ncm2
[9]: https://github.com/ncm2/ncm2-bufword
[8]: https://github.com/ncm2/ncm2/wiki#snippet-integration
[9]: https://github.com/ncm2/ncm2-jedi
[10]: https://neovim.io/doc/user/options.html#'runtimepath'
[11]: https://github.com/sourcegraph/javascript-typescript-langserver
[sha-ncm2]: https://github.com/ncm2/ncm2/commit/bf1806e2ef256772a44c7c874250ef0b4a7dc04e
[sha-lcnvim]: https://github.com/autozimu/LanguageClient-neovim/commit/8acdc380dc0a0c5d1722d7b8c061f378c2999f13
[^1]: They wrote about it - [a nice read][4]!
