function register() {
   deploy=$(pwd)
   vimhome="~/.vim"
   if [[ -d $vimhome ]];then
      mv $vimhome $vimhome.backup
   fi
   ln -s $deploy $vimhome
   mkdir $vimhome/bundle
   git clone https://github.com/VundleVim/Vundle.vim.git $vimhome/bundle/Vundle.vim
}
