# dotfiles

## 環境構築手順

### 諸々の設定

キーボードはUS配列の場合

- このMacについて > ソフトウェアアップデート
- App Store > すべてアップデート
  - Apple Storeにログインしておく
- システム環境設定 > キーボード > ショートカット
  - 入力ソース > 前の入力ソースを選択 のショートカットを `command + space` に
  - Spotlight > Spotlight検索を表示 のショートカットを `control + space` に
- システム環境設定 > キーボード > キーボード > 修飾キー
  - Caps LockとControlを入れ替える
- システム環境設定 > ディスプレイ > ディスプレイ
  - 「輝度を自動調整」をOFF
- システム環境設定 > サウンド > サウンドエフェクト
  - 「起動時にサウンドを再生」をOFF

### Homebrewでツールのインストール

```sh
$ mkdir -p ~/code/github.com/nissy-dev/dotfiles
$ cd ~/code/github.com/nissy-dev/dotfiles 
$ git clone https://github.com/nissy-dev/dotfiles.git
$ make brew
```

### dotfilesの設定

```sh
$ make dotfiles
$ source ~/.zshrc
```

### Mac関連の設定

再起動をすると全ての設定が反映される

```sh
$ make mac
```

### IME のインストール

Google の日本語 IME は、次のサイトからインストールできる。  
Homebrew 経由ではうまくインストールできなかったため手動でインストールする  
リンク: https://www.google.co.jp/ime/

### VSCodeの設定

- Codeコマンドをインストール
  - Command + P で `> code`と打ち込むと出てくる
- 拡張機能をインストール
  - `make code` でインストールできる

### 1Password の設定

- [Chrome 拡張](https://chromewebstore.google.com/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)をインストール
- [ssh agent の設定](https://blog.jxck.io/entries/2025-11-13/ssh-signing.html)
  - valut は `op vault list` で取得できる uuid で登録する

### グローバルに入れそうなツール

```sh
$ mise use -g go@latest
$ mise use -g aws-cli@latest
$ mise use -g gcloud@latest
$ mise use -g terraform@latest
```
