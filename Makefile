# 変数の準備
DOTFILES_DIR      := $(PWD)
INSTALL_LANG      := nodejs python rust golang

.PHONY: brew
brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	[ "$(uname)" = 'Darwin' ] && brew bundle -f $(DOTFILES_DIR)/brewfiles/mac
	[ "$(uname)" != 'Darwin' ] && brew bundle -f $(DOTFILES_DIR)/brewfiles/linux

.PHONY: preinstall
preinstall:
	echo 'Install starship.'
	curl -fsSL https://starship.rs/install.sh | bash
	echo 'Install fzf.'

.PHONY: install
install:
	echo 'Setup dotfiles.'
	$(DOTFILES_DIR)/deploy.sh

.PHONY: asdf
asdf:
	echo 'Install asdf'
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	cd ~/.asdf
	git checkout "$(git describe --abbrev=0 --tags)"
	cd $(DOTFILES_DIR) && source ~/.zshrc
	echo 'Install plugins.'
	@$(foreach lang, $(INSTALL_LANG), asdf plugin add $(lang);)
	bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	echo 'Install latest stable version.'
	@$(foreach lang, $(INSTALL_LANG), asdf install $(lang) latest;)

.PHONY: mac
mac:
	echo 'Override the default settings in Mac.'
	$(DOTFILES_DIR)/mac_setting_override.sh
