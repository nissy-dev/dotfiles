if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.bashrc.custom ]; then
  # 独自設定の読み込み
  source ~/.bashrc.custom
fi
