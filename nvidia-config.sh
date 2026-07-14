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
#NVIDIA_VER=$(ls /usr/src | grep -m1 '^nvidia-' | sed 's/nvidia-//'); for kernel in /usr/lib/modules/*; do sudo dkms install -m nvidia -v "$NVIDIA_VER" -k $(basename "$kernel"); done
kernel_set(){
# ==========================================
# Configuración
KERNEL_VERSION="6.18"
GRUB_FILE="/etc/default/grub"
GRUB_CFG="/boot/grub/grub.cfg"
# ==========================================

# 1. Extraer el nombre exacto
KERNEL_ENTRY=$(grep "menuentry" "$GRUB_CFG" | grep "$KERNEL_VERSION" | sed -n "s/.*menuentry ['\"]\([^'\"]*\)['\"].*/\1/p" | head -n 1)

# 2. Comprobar si se encontró
if [ -z "$KERNEL_ENTRY" ]; then
    echo "ERROR: No se encontró ninguna entrada con el kernel $KERNEL_VERSION en $GRUB_CFG"
    exit 1
fi

echo "Entrada encontrada: $KERNEL_ENTRY"

# 3. Modificar /etc/default/grub (CORREGIDO: Usamos '|' en lugar de '/' para evitar conflictos con "GNU/Linux")
sed -i "s|^GRUB_DEFAULT=.*|GRUB_DEFAULT=\"$KERNEL_ENTRY\"|" "$GRUB_FILE"

echo "Se ha actualizado $GRUB_FILE con la nueva entrada."

echo "¡GRUB ha sido regenerado exitosamente forzando el kernel $KERNEL_VERSION!"
}

kernel_set

grub-mkconfig -o /boot/grub/grub.cfg
