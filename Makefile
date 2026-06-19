DOTFILES := $(HOME)/dotfiles
export PATH := /opt/homebrew/bin:$(PATH)

.PHONY: all link macos brew apps packages update

all: macos brew apps packages link

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

brew:
	@echo "Downloading brew..."
	command -v brew >/dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade

apps:
	@echo "Downloading applications..."
	brew install --cask 1password
	brew install --cask arc
	brew install --cask chatgpt
	brew install --cask claude
	brew install --cask logi-options-plus
	brew install --cask visual-studio-code
	brew install --cask jetbrains-toolbox
	brew install --cask warp
	brew install --cask docker

	brew install mas
	mas install 441258766   # Magnet
	mas install 1452453066  # Hidden Bar

packages:
	@echo "Downloading packages..."
	brew install tree

update:
	brew update
	brew upgrade
	brew cleanup
