
vimhome="~/.vim"
function register() {
   deploy=$(pwd)
   if [[ -d $vimhome ]];then
      mv $vimhome $vimhome.backup
   fi
   ln -s $deploy $vimhome
   mkdir $vimhome/bundle
   git clone https://github.com/VundleVim/Vundle.vim.git $vimhome/bundle/Vundle.vim
}
function install_YouCompleteMe() {
    #sudo yum install python-pip.noarch
    #pip install --upgrade pip
    #pip install future
    cd $vimhome
    cd bundle/YouCompleteMe
    python3 ./install.py --clang-completer --go-completer
    ln -s bundle/YouCompleteMe/third_party ./
}
