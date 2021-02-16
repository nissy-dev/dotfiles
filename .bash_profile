if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi

if [ -f ~/.bashrc.custom ]; then
     # GitHubに載せない方がいいような設定
     source ~/.bashrc.custom
fi
