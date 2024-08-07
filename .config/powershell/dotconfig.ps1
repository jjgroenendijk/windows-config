function dotconfig {
    git --git-dir=$env:USERPROFILE\.dotfiles --work-tree=$env:USERPROFILE $args
  }  

dotconfig config --local status.showUntrackedFiles no