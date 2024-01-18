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

### ssh の設定

鍵の生成と[GitHub SSH keys](https://github.com/settings/keys)への公開鍵の登録

```sh
$ ssh-keygen -t ed25519 -C "nd.12021218@gmail.com"
$ pbcopy < ~/.ssh/id_ed25519.pub
```

`.ssh/config`の作成。

```sh
$ vi ~/.ssh/config
$ chmod 600 ~/.ssh/config
```

`.ssh/config`には以下の内容を書き込む

```
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
```

接続の確認

```sh
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ ssh -T git@github.com
```

詳細は[Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)を確認すると良い。

### Homebrewでツールのインストール

```sh
$ mkdir -p ~/code/github.com/nissy-dev/dotfiles
$ cd ~/code/github.com/nissy-dev/dotfiles 
$ git clone git@github.com:nissy-dev/dotfiles.git .
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

### フォントの設定

[「白源」](https://github.com/yuru7/HackGen)をインストール

```sh
$ make font
```

### 各言語のインストール

[.tool-versions](https://github.com/nissy-dev/dotfiles/blob/master/asdf/.tool-versions) に記載されている各言語をインストール

```sh
$ make asdf
```

また必要であれば、GCloud CLI / AWS CLIのインストールもできる

```sh
$ asdf plugin add gcloud && asdf install gcloud latest
$ asdf plugin add awscli && asdf install awscli latest
```

### iTermの設定

`com.googlecode.iterm2.plist`を読み込む

- General > Preferences
  - Load preferences from a custom folder or URL にチェック
  - パスを `~/code/github.com/nissy-dev/dotfiles`、Save changes を 「Manually」に設定する
  - OSを再起動すると読み込まれる

### IME のインストール

Google の日本語 IME は、次のサイトからインストールできる。  
Homebrew 経由ではうまくインストールできなかったため手動でインストールする  
リンク: https://www.google.co.jp/ime/

### VSCodeの設定

- Codeコマンドをインストール
  - Command + P で `> code`と打ち込むと出てくる
- 拡張機能をインストール
  - `make code`でインストールできる

### その他の設定

パッケージマネージャーも必要があれば最新にしておく

```sh
$ npm install -g npm@latest
$ npm install -g commitizen cz-conventional-changelog prettier
$ asdf reshim nodejs
```

```sh
$ conda-init
$ pip install --upgrade pip
$ pip install flake8 black numpy pandas jupyterlab
$ asdf reshim python
```
