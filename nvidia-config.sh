#! /bin/bash
rm -rf /etc/default/grub
wget -O /etc/default/grub https://codeberg.org/Neko-Void/nvidia-support/raw/branch/main/grub
mkdir -p /etc/dracut.conf.d
cat << 'EOFDRACUT' > /etc/dracut.conf.d/nvidia.conf
#Incluir los módulos esenciales de NVIDIA en el initramfs
add_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "
EOFDRACUT
chmod 644 /etc/dracut.conf.d/nvidia.conf
# Forzar carga de nvidia al inicio
mkdir -p /etc/modules-load.d
echo "nvidia" > /etc/modules-load.d/nvidia.conf
xbps-install -Sy linux6.18 linux6.18-headers
xbps-reconfigure -f -a
grub-mkconfig -o /boot/grub/grub.cfg
