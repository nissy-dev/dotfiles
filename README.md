# dotfiles

**注意：スクリプトは、Mac or Linuxで動かすことを想定して書いている**

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

Linux の場合は、ドキュメントの [Requirements](https://docs.brew.sh/Homebrew-on-Linux#requirements) に記載されているビルドツールをインストールしておく必要がある

```bash
sudo apt-get install build-essential procps curl file git
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

### asdf の設定

```sh
$ make asdf
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
