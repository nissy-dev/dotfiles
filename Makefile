# 変数の準備
DOTFILES_DIR      := $(PWD)

.PHONY: brew
brew:
	$(DOTFILES_DIR)/brew/brew_setup.sh

.PHONY: dotfiles
dotfiles:
	echo 'Setup dotfiles.'
	$(DOTFILES_DIR)/deploy.sh

.PHONY: asdf
asdf:
	echo 'Install language plugin by asdf.'

.PHONY: mac
mac:
	echo 'Override the default settings on Mac.'
	$(DOTFILES_DIR)/osx_setting_override.sh

.PHONY: code
code:
	echo 'Manage vscode extensions.'
	$(DOTFILES_DIR)/vscode/install_extension.sh
