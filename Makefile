DOTFILES := $(HOME)/dotfiles
export PATH := /opt/homebrew/bin:$(PATH)

.PHONY: all link macos brew apps packages update r vscode

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
	mkdir -p $(HOME)/.config
	ln -vsf {$(DOTFILES),$(HOME)}/.config/starship.toml

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
	#brew install --cask 1password
	brew install --cask arc
	brew install --cask chatgpt
	brew install --cask claude
	brew install --cask claude-code
	brew install --cask notion
	brew install --cask notion-calendar
	brew install --cask openlogi
	brew install --cask visual-studio-code
	brew install --cask jetbrains-toolbox
	brew install --cask warp
	brew install --cask docker
	brew install --cask tailscale
	brew install mas
	mas install 441258766   # Magnet
	mas install 1452453066  # Hidden Bar

packages:
	@echo "Downloading packages..."
	brew install starship
	brew install git
	brew install tree
	brew install uv
	brew install go
	brew install grpc
	brew install gcc

r:
	@echo "Downloading R packages..."
	brew install r
	Rscript -e 'install.packages(c("tidyverse", "estimatr", "modelsummary"), repos = "https://cloud.r-project.org")'

vscode:
	@echo "Downloading VS Code extensions..."
	code --install-extension github.github-vscode-theme
	code --install-extension ms-python.python
	code --install-extension ms-python.vscode-pylance
	code --install-extension ms-python.debugpy
	code --install-extension ms-python.vscode-python-envs
	code --install-extension ms-toolsai.jupyter
	code --install-extension ms-toolsai.jupyter-keymap
	code --install-extension ms-toolsai.jupyter-renderers
	code --install-extension ms-toolsai.vscode-jupyter-cell-tags
	code --install-extension ms-toolsai.vscode-jupyter-slideshow
	code --install-extension ms-vscode-remote.remote-ssh
	code --install-extension ms-vscode-remote.remote-ssh-edit
	code --install-extension mechatroner.rainbow-csv

update:
	brew update
	brew upgrade
	brew cleanup
