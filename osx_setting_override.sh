#!/usr/bin/env bash

# -u: Fail on when exsisting unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

##################################
# 基本設定
##################################

# バッテリーのパーセントを非表示にする
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 日付・曜日を表示させ、時刻は24時間表示
defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d HH:mm"

# キー入力速度を速くする
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# 印刷ダイアログを詳細表示で表示
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# 設定を反映
killall SystemUIServer

##################################
# dock系
##################################

# Dockに標準で入っている全てのアプリを消す、Finderとごみ箱は消えない
defaults write com.apple.dock persistent-apps -array

# 開いているアプリケーションのみをdockに表示
defaults write com.apple.dock static-only -bool true

# アイコンサイズの設定
defaults write com.apple.dock tilesize -int 50

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockが表示されるまでの遅延を無くす
defaults write com.apple.dock autohide-delay -float 0

# Dockが隠れるアニメーションの速度を0.5秒に
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Dashboard無効化
defaults write com.apple.dashboard mcx-disabled -bool true

# 設定反映
killall Dock

##################################
# Finder系
##################################

# ネットワークディスクで、`.DS_Store` ファイルを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# タブバーを表示
defaults write com.apple.finder ShowTabView -bool true

# ~/Libraryを表示
chflags nohidden ~/Library

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# 全ての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 常に絶対パスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder再起動して設定を反映
killall Finder

##################################
# スクリーンショット系
##################################

# 保存場所を変更
defaults write com.apple.screencapture location ~/Downloads

# プレフィックスを変更
defaults write com.apple.screencapture name "SS_"

# 画像に影を付けない
defaults write com.apple.screencapture disable-shadow -bool true

# 設定を反映
killall SystemUIServer
