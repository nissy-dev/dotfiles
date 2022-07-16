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
	echo 'Install languages by asdf.'
	$(DOTFILES_DIR)/asdf/install_lang.sh

.PHONY: mac
mac:
	echo 'Override the default settings on Mac.'
	$(DOTFILES_DIR)/osx_setting_override.sh

.PHONY: code
code:
	echo 'Manage vscode extensions.'
	$(DOTFILES_DIR)/vscode/install_extension.sh

.PHONY: font
font:
	echo 'Install font.'
	$(DOTFILES_DIR)/install_font.sh
