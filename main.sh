DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone -b v56 https://github.com/home-sweet-gnome/dash-to-panel ./gnome-shell-extension-dash-to-panel
cp -rvf ./debian ./gnome-shell-extension-dash-to-panel/
cd ./gnome-shell-extension-dash-to-panel

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -pv ./output
mv -v ./*.deb ./output/
