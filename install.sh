# アップデート処理
apt-get -y update
apt-get -y upgrade

# vm用ツールのインストール
apt-get -y install open-vm-tools sudo apt-get install open

# g++の導入
apt-get -y install build-essential

# font ライブラリの導入
apt-get -y install libfontconfig1

#apt-get install -y mesa-common-dev libglu1-mesa-dev

# qtのインストル
cd /tmp
wget http://download.qt.io/official_releases/qt/5.9/5.9.1/qt-opensource-linux-x64-5.9.1.run
bash qt-opensource-linux-x64-5.9.1.run

# sipのインストール
wget https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.3/sip-4.19.3.tar.gz
tar zxvf sip-4.19.3.tar.gz
cd sip-4.19.3
python3 configure.py
make
make install

# pyqtのインストール
cd /tmp
wget https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.9/PyQt5_gpl-5.9.tar.gz
tar zxvf PyQt5_gpl-5.9.tar.gz
cd PyQt5_gpl-5.9
python3 configure.py --qmake ~/Qt/5.8/clang_64/bin/qmake
make
make install






