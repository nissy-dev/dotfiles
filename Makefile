# 変数の準備
DOTFILES_DIR      := $(PWD)
INSTALL_LANG      := nodejs python rust golang
ASDF_DATA_DIR     := $(HOME)/.asdf

.PHONY: brew
brew:
	$(DOTFILES_DIR)/brew/brew_setup.sh

.PHONY: dotfiles
dotfiles:
	echo 'Setup dotfiles.'
	$(DOTFILES_DIR)/deploy.sh

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
	$(DOTFILES_DIR)/osx_setting_override.sh

.PHONY: code
code:
	echo 'Manage vscode extensions.'
	$(DOTFILES_DIR)/vscode/install_extension.sh
