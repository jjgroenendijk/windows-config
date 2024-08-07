function dotconfig {
    git --git-dir=$env:USERPROFILE\.dotfiles --work-tree=$env:USERPROFILE $args
  }  

dotfiles config --local status.showUntrackedFiles no