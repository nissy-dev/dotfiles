# dotfiles

**注意：スクリプトは、Mac or Linuxで動かすことを想定して書いている**

## 環境構築手順

### ソフトウェア・アップデート

- (appleマーク) > このmacについて > ソフトウェアアップデート
- (appleマーク) > App Store > すべてアップデート
  - `make brew`する前に、Apple Storeにログインしておく


### キーボードの設定 (US配列の場合)

- (appleマーク) > キーボード > ショートカット
  - 入力ソース > 前の入力ソースを選択 のショートカットを `command + space` に
  - Spotlight > Spotlight検索を表示 のショートカットを `control + space` に
- (appleマーク) > キーボード > キーボード > 修飾キー
  - Caps LockとControlを入れ替える 

### ssh の設定

[Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)に全部手順が書いてある。

鍵の生成と[GitHub SSH keys](https://github.com/settings/keys)への公開鍵の登録。

```sh
$ ssh-keygen -t ed25519 -C "nd.12021218@gmail.com"
$ pbcopy < ~/.ssh/id_ed25519.pub
```

`.ssh/config`の作成。

```sh
$ vi ~/.ssh/config
$ chmod 600 ~/.ssh/config
```

`.ssh/config`には以下の内容を書き込む。
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

接続の確認。

```sh
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ ssh -T git@github.com
```

### Homebrewでツールのインストール

```sh
$ mkdir -p ~/code/github.com/nissy-dev/dotfiles
$ cd ~/code/github.com/nissy-dev/dotfiles 
$ git clone git@github.com:nissy-dev/dotfiles.git .
$ make brew
```

### dotfilesのセットアップ

```sh
$ make dotfiles
$ source ~/.zshrc
```

### Macのセットアップ

再起動が必要になることもある。

```sh
$ make mac
```

メモ：2020/03/28の時点では、`google-japanese-ime`のインストールが上手く行かなかった。

### フォントのセットアップ

[「白源」](https://github.com/yuru7/HackGen)をインストール。

```sh
$ make font
```

### 各言語のインストール

Go、Rust, Python, Node.jsの最新バージョンをインストール。

```sh
$ make asdf
```

### VSCodeのセットアップ

拡張機能をインストール。

```sh
$ make code
```

### iTermのセットアップ

設定画面で、`com.googlecode.iterm2.plist`を読み込む。

- General > Preferences
  - Load preferences from a custom folder or URL にチェック
  - パスも設定する

### Commitzenのセットアップ

```sh
$ asdf global nodejs x.x.x
$ npm install -g commitizen cz-conventional-changelog
$ asdf reshim nodejs
```

### AwsCLIのセットアップ

AWS CLIは、インストールが複雑なので[公式の手順](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd)どおりにインストールしたほうが安全。


```sh
$ 
```
