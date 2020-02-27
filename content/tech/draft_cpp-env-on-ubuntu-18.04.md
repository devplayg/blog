docker run -it -v e:/cpphome:/cpphome -p 22:22 --name cpp ubuntu:18.04 bash

sed -i s#archive\.ubuntu\.com#mirror.kakao.com#g /etc/apt/sources.list
apt update && apt install -y vim net-tools inetutils-ping telnet curl openssh-server    build-essential cmake autoconf automake gdb git libffi-dev zlib1g-dev libssl-dev
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo -e "3333\n3333\n" | passwd  root
service ssh start


vi ~/.vimrc
---

set number
set ai
set si
set shiftwidth=4
set tabstop=4
set hlsearch
set expandtab
set background=dark
set nocompatible
set fileencodings=utf-8,euc-kr
set bs=indent,eol,start
set history=1000
set ruler
set nobackup
set title
set showmatch
set nowrap
set wmnu
set paste

syntax on
colorscheme molokai

execute pathogen#infect()
filetype plugin indent on
---



## Update `cmake`

 wget https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4.tar.gz
 tar xvfz cmake-3.16.4.tar.gz
 ll
 cd cmake-3.16.4
 ll
 ./bootstrap && make && make install
