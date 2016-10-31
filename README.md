# vimrc
My vim environment

## Installation
To install vim environment execute the following commands. *Warning!* This will overwrite .vimrc and add files to .vim/ in your home directory.

    git clone https://github.com/zimnukhov/vimrc
    cd vimrc
    make
    make install

## Other types of installation
By default .vimrc is built with key mappings and [molokai](https://github.com/tomasr/molokai) color scheme.
The only plugin is [file-line](https://github.com/bogado/file-line).

To install just key mappings without any plugins run:

    make base

To install [vim-go](https://github.com/fatih/vim-go) and [tagbar](https://github.com/majutsushi/tagbar) via pathogen: 

    make full
