DOTFILES := $(HOME)/dotfiles

.PHONY: all link macos

all: link macos

link:
    @echo "Linking dotfiles..."
	ln -vsf {$(DOTFILES),$(HOME)}/.gitconfig
	ln -vsf {$(DOTFILES),$(HOME)}/.gitignore
	ln -vsf {$(DOTFILES),$(HOME)}/.aliases
	ln -vsf {$(DOTFILES),$(HOME)}/.zprofile
	ln -vsf {$(DOTFILES),$(HOME)}/.zshrc
	mkdir -p $(HOME)/.ssh
	ln -vsf {$(DOTFILES),$(HOME)}/.ssh/config
	ln -vsf {$(DOTFILES),$(HOME)}/.ssh/allowed_signers
	chmod 600 ~/.ssh/allowed_signers

macos:
    @echo "Setting macos preferences..."
	bash $(DOTFILES)/.macos
