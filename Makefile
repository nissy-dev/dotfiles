# 変数の準備
DOTFILES_DIR      := $(PWD)
INSTALL_LANG      := nodejs python rust golang
ASDF_DATA_DIR     := $(HOME)/.asdf

.PHONY: brew
brew:
	/bin/bash -c '$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh;)'
	[ $(shell uname) = 'Darwin' ] && brew bundle --file $(DOTFILES_DIR)/brewfiles/Brewfile.mac
	[ $(shell uname) != 'Darwin' ] && $(DOTFILES_DIR)/linuxbrew_init.sh && brew bundle --file $(DOTFILES_DIR)/brewfiles/Brewfile.linux

.PHONY: dotfiles
install:
	echo 'Setup dotfiles.'
	$(DOTFILES_DIR)/deploy.sh
	source ~/.zshrc

.PHONY: asdf
asdf:
	echo 'Install plugins.'
	@$(foreach lang, $(INSTALL_LANG), asdf plugin add $(lang);)
	bash -c '$(ASDF_DATA_DIR)/plugins/nodejs/bin/import-release-team-keyring'
	echo 'Install latest stable version.'
	@$(foreach lang, $(INSTALL_LANG), asdf install $(lang) latest;)

.PHONY: mac
mac:
	echo 'Override the default settings on Mac.'
	$(DOTFILES_DIR)/mac_setting_override.sh
