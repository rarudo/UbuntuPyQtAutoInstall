INSTALL_PYTHON_VERSION="3.6.2"

CPU_CORE_NUM=`grep processor /proc/cpuinfo | wc -l`


# アップデート処理
apt-get -y update
apt-get -y upgrade

# vm用ツールのインストール
apt-get -y install open-vm-tools open-vm-tools-desktop

# g++の導入
apt-get -y install build-essential

# font ライブラリの導入
apt-get -y install libfontconfig1

# python開発者用パッケージのインストール
apt-get -y install python3.5-dev

#apt-get install -y mesa-common-dev libglu1-mesa-dev

# qtのインストル
cd /tmp
curl -L -O http://download.qt.io/official_releases/qt/5.9/5.9.1/qt-opensource-linux-x64-5.9.1.run
chmod +x qt-opensource-linux-x64-5.9.1.run
./qt-opensource-linux-x64-5.9.1.run


# sipのインストール
wget https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.3/sip-4.19.3.tar.gz
tar zxvf sip-4.19.3.tar.gz
cd sip-4.19.3
python3 configure.py
make -j$CPU_CORE_NUM
make install

# pyqtのインストール
cd /tmp
wget https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.9/PyQt5_gpl-5.9.tar.gz
tar zxvf PyQt5_gpl-5.9.tar.gz
cd PyQt5_gpl-5.9
python3 configure.py --qmake /opt/Qt5.9.1/5.9.1/gcc_64/bin/qmake
make -j$CPU_CORE_NUM
make install

# pyenvのインストール
apt-get -y install libssl-dev zlib1g-dev libbz2-dev wget curl llvm libncurses5-dev libncursesw5-dev libpng-dev git
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# 指定バージョンのpythonをインストール
pyenv install $INSTALL_PYTHON_VERSION
pyenv global $INSTALL_PYTHON_VERSION
