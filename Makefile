VIMDIR=$(HOME)
BUILDDIR=build
LOAD_MODULE=git submodule update --init

all: standard

base:
	mkdir -p $(BUILDDIR)
	cp base.vim $(BUILDDIR)/.vimrc

standard:
	mkdir -p $(BUILDDIR)/.vim/colors $(BUILDDIR)/.vim/plugin
	$(LOAD_MODULE) modules/molokai
	cp modules/molokai/colors/molokai.vim $(BUILDDIR)/.vim/colors/
	$(LOAD_MODULE) modules/file-line
	cp modules/file-line/plugin/file_line.vim $(BUILDDIR)/.vim/plugin
	$(LOAD_MODULE) modules/auto-pairs
	git clone modules/auto-pairs $(BUILDDIR)/.vim/bundle/auto-pairs
	cat base.vim colors.vim >$(BUILDDIR)/.vimrc

full: standard
	mkdir -p $(BUILDDIR)/.vim/autoload $(BUILDDIR)/.vim/bundle
	$(LOAD_MODULE) modules/vim-pathogen
	cp modules/vim-pathogen/autoload/pathogen.vim $(BUILDDIR)/.vim/autoload/
	$(LOAD_MODULE) modules/vim-go
	git clone modules/vim-go $(BUILDDIR)/.vim/bundle/vim-go
	$(LOAD_MODULE) modules/tagbar
	git clone modules/tagbar $(BUILDDIR)/.vim/bundle/tagbar
	cat plugins.vim osx.vim russian.vim go.vim >>$(BUILDDIR)/.vimrc

install: $(BUILDDIR)/.vimrc
	cp $(BUILDDIR)/.vimrc $(VIMDIR)/.vimrc
	cp -R $(BUILDDIR)/.vim/. $(VIMDIR)/.vim

clean:
	rm -rf $(BUILDDIR)
