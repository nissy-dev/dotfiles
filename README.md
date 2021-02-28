# dotfiles

**注意：スクリプトは、Mac or Linuxで動かすことを想定して書いている**

## 環境構築

```sh
$ git clone https://github.com/nd-02110114/dotfiles.git
$ cd dotfiles

# Homebrew経由で諸々インストール 
# 最近はLinuxでもHomebrewが使える
$ make brew

# dotfilesの設定
$ make dotfiles
$ source ~/.zshrc

# 各言語をインストール
$ make asdf

# macの設定の上書き
$ make mac

# vscodeの拡張機能の管理
$ make code

# fontのインストール
$ make font
```

## その他

### 諸々のアップデート
- ソフトウェア・アップデート
  - (appleマーク) > このmacについて > ソフトウェアアップデート
- App Store
  - (appleマーク) > App Store > すべてアップデート
  - `make brew`する前にログインしておく

### ssh の設定

[Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

「Adding a new SSH key to your GitHub account」のページをみればよい

### git cz の設定

```sh
$ asdf global nodejs x.x.x
$ npm install -g git-cz
$ asdf reshim nodejs
```
