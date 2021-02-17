# Dotfiles

**注意：スクリプトは、Mac or Linuxで動かすことを想定して書いている**

## 環境構築手順

```sh
$ git clone https://github.com/nd-02110114/dotfiles.git
$ cd dotfiles

# Homebrew経由で諸々インストール 
# 最近はLinuxでもHomebrewが使える
$ make brew

# dotfilesの設定
$ make preinstall
$ make install

# 各言語をインストール
$ make asdf

# macの設定の上書き
$ make mac
```

## その他

- [ ] ssh の設定
  - 秘密鍵の作成
