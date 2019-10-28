#!/bin/sh
set -e

# Git
wget https://raw.githubusercontent.com/jasuarez/dotfiles/master/.gitconfig -O ~/.gitconfig

# Scripts
git clone https://github.com/jasuarez/scripts.git ~/.local/bin

# Vim
git clone --recursive https://github.com/jasuarez/vim.d ~/.vim
vim +PlugUpgrade +qall
vim +PlugInstall +qall

# Shell
git clone https://github.com/jasuarez/bashrc.d.git ~/.bashrc.d
cat <<EOF >> ~/.bashrc
# Run per-file configuration
if [ -d ~/.bashrc.d ]; then
	for b in ~/.bashrc.d/*.sh ; do
		source \$b
	done
fi
EOF

# JHBuild
pip3 install ninja mako meson
git clone https://github.com/infapi00/mesa-resources /opt/jhbuild/mesa-resources
git clone https://gitlab.gnome.org/GNOME/jhbuild.git /opt/jhbuild/jhbuild
cd /opt/jhbuild/jhbuild && ./autogen.sh && make install
