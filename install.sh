#! /usr/bin/env bash
390(){
xbps-install -Sy mesa-dri mesa-dri-32bit nvidia390-opencl nvidia390-libs\
 nvidia390-gtklibs nvidia390-dkms nvidia390 nvidia390-opencl-32bit \
 nvidia390-libs-32bit nvidia390-gtklibs-32bit nvtop 
wget -O /tmp/nvi.sh https://codeberg.org/javiercplus/Neko-Wizard/releases/download/nvidia/nvidia-config.sh 
chmod +x /tmp/nvi.sh && pkexec /tmp/nvi.sh
}
470(){
xbps-install -Sy mesa-dri mesa-dri-32bit \
nvidia470-opencl nvidia470-libs nvidia470-gtklibs nvidia470-dkms nvidia470 \
nvidia470-libs-32bit 
wget -O /tmp/nvi.sh https://codeberg.org/javiercplus/Neko-Wizard/releases/download/nvidia/nvidia-config.sh 
chmod +x /tmp/nvi.sh && pkexec /tmp/nvi.sh
}
580(){
pkexec xbps-install -Sy mesa-dri mesa-dri-32bit nvidia580 nvidia580-dkms nvidia580-firmware nvidia580-gtklibs nvidia580-libs nvidia580-opencl nvidia580-libs-32bit && pkexec wget -O /tmp/nvi.sh https://codeberg.org/javiercplus/Neko-Wizard/releases/download/nvidia/nvidia-config.sh && pkexec chmod +x /tmp/nvi.sh && pkexec /tmp/nvi.sh
}
latest(){
pkexec xbps-install -Sy mesa-dri mesa-dri-32bit nvidia nvidia-dkms nvidia-firmware nvidia-gtklibs nvidia-gtklibs-32bit nvidia-libs nvidia-libs-32bit nvidia-opencl nvidia-opencl-32bit nvidia-vaapi-driver nvidia-docker nvidia-container-toolkit && pkexec wget -O /tmp/nvi.sh https://codeberg.org/javiercplus/Neko-Wizard/releases/download/nvidia/nvidia-config.sh && pkexec chmod +x /tmp/nvi.sh && pkexec /tmp/nvi.sh
}
open(){
pkexec xbps-install -Sy mesa-dri mesa-dri-32bit mesa-vulkan-intel mesa-vulkan-intel-32bit linux-firmware-intel libva-intel-driver intel-media-driver mesa-intel-dri-32bit mesa-intel-dri
}
case "$@" in
  390)390 ;;
  470)470 ;;
  580)580 ;;
  latest)latest ;;
  open)open ;;
esac