---
title: 'FFmpeg compiling on ubuntu 18.04'
date: 2019-09-01T03:00:00+09:00
type: posts
categories: 
    - ai
    - compile
tags:
    - ai
    - compile
    - ffmpeg
    - ubuntu 18.04
---

https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

    mkdir -p ~/ffmpeg_sources ~/bin

### Get the Dependencies
    
    apt -y install \
      autoconf \
      automake \
      build-essential \
      cmake \
      git-core \
      libass-dev \
      libfreetype6-dev \
      libsdl2-dev \
      libtool \
      libva-dev \
      libvdpau-dev \
      libvorbis-dev \
      libxcb1-dev \
      libxcb-shm0-dev \
      libxcb-xfixes0-dev \
      pkg-config \
      texinfo \
      wget \
      zlib1g-dev

    apt install -y nasm yasm
    
    apt install -y libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev libavfilter-dev

    cd ~/ffmpeg_sources && \
    git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
    mkdir -p aom_build && \
    cd aom_build && \
    PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
    PATH="$HOME/bin:$PATH" make && \
    make install


### Compile

    cd ~/ffmpeg_sources && \
    wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
    tar xjvf ffmpeg-snapshot.tar.bz2 && \
    cd ffmpeg && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
      --prefix="$HOME/ffmpeg_build" \
      --pkg-config-flags="--static" \
      --extra-cflags="-I$HOME/ffmpeg_build/include" \
      --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
      --extra-libs="-lpthread -lm" \
      --bindir="$HOME/bin" \
      --enable-gpl \
      --enable-libass \
      --enable-libfdk-aac \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libopus \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libx264 \
      --enable-libx265 \
      --enable-shared \
      --enable-nonfree && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    hash -r
    
    
