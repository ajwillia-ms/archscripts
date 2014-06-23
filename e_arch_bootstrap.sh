#!/bin/bash
# -*- coding: utf-8 -*-
# Take an arch install from zero to ready for Enlightenment

sudo pacman -S git screen sudo
sudo pacman -S check libjpeg-turbo fribidi libx11 libxext valgrind libxrender libgles giflib libtiff

sudo pacman -S libpulse libxcursor libxcomposite libxinerama libxp libxrandr libxss lua
sudo pacman -S gstreamer gst-plugins-base gst-plugins-good bullet luajit

sudo pacman -S xcb-util-keysyms xorg-sessreg vlc

sudo pacman -S base-devel gdb

