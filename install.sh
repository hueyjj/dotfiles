mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/autoload/airline
mkdir ~/.vim/autoload/airline/themes
mkdir ~/.vim/colors

os=$(uname)
case "$os" in
        "Linux")
        {
            echo "Operating system: Linux"
            {
            find . -type f -print0 | xargs -0 dos2unix      #Convert dos (windows) files to unix/linux
            } &> /dev/null
            
            tr -d '\15\32' < _vimrc.dos > ~/.vimrc
            echo "Copied .vimrc to home directory"

        };;
        *)
        {
            echo "Copied _vimrc to home directory"
            cp _vimrc.dos ~/_vimrc
        };;
esac
echo ""

dos2unix *
dos2unix ./.vim/colors/*

cp ./.vim/autoload/airline/themes/jjstyle_airline.vim ~/.vim/autoload/airline/themes/
cp ./.vim/colors/* ~/.vim/colors/

echo ""

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[MESSAGE] Do :PlugInstall to set up plugins"
