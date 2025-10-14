#!/bin/bash

# 引数チェック
if [ $# -ne 6 ]; then
    echo "Usage: $0 <CTID> <CTHOSTNAME> <CTPASSWORD> <CTIPV4> <CTIPV4GW> <CTIPV4DNS>"
    exit 1
fi

CTID="$1"
CTHOSTNAME="$2"
CTPASSWORD="$3"
CTIPV4="$4"
CTIPV4GW="$5"
CTIPV4DNS="$6"

# SSH 公開鍵
cat <<'__EOT__' >/tmp/ssh_public_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1+DvxUVbKQVrRsRhZEX/aqdox/MU3nC9bqmJBDz+by
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMz2Z8uOw2WCkEQgaQtpDxCNqAPsRFiVCiXQrSzzo+vb
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKZJc89W8z5FzkZpbA4Hl6RXyX5t8nlWingBKMlFPAaw
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHFKnlIyCgW31Fah9Lu/f0Sn2SYvSN69VkoBqJBSOSV0
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKJfrFtXf4ZZ0Cvc8imYopa8lEB8pL0pozsp72uebybk
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDalCgHF6xdItVJ+372THFRFvnHwiLfDnhKHqngQwb/z
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIWhmPjY0gQuN/SuSiZd+un5gLgIeepMTRz6Oe7pEmTL
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6lbSY1sE2SNc3aHonvKqIW+DC3VeT6D4OfFo6Ar16q
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGuiuJAh/R4P13e05iv8rKMJx5Pn/KpqoMxG7eD4sQ5
__EOT__

# 固定設定値
CTDESCRIPTION=""
CTCORE=1
CTSTORAGESIZE=16
CTMEMORY=512
CTSWAP=0
CTSEARCHDOMAIN="home"
CTTEMPLATE=$(ls -1 /var/lib/vz/template/cache/archlinux.tar.xz | tail -1)

# コンテナ作成
pct create ${CTID} ${CTTEMPLATE} \
    --arch amd64 \
    --cores ${CTCORE} \
    --description "${CTDESCRIPTION}" \
    --unprivileged 1 \
    --features "nesting=1,fuse=1" \
    --hostname "${CTHOSTNAME}" \
    --memory "${CTMEMORY}" \
    --nameserver "${CTIPV4DNS}" \
    --net0 "name=eth0,bridge=vmbr0,gw=${CTIPV4GW},ip=${CTIPV4},type=veth" \
    --onboot 1 \
    --ostype "archlinux" \
    --password "${CTPASSWORD}" \
    --rootfs "disks:${CTSTORAGESIZE}" \
    --start 1 \
    --swap "${CTSWAP}" \
    --timezone "Asia/Tokyo"

rm -f /tmp/ssh_public_keys
sleep 10

# 初期設定やパッケージ追加の実施
pct exec ${CTID} -- sh -c "\
    pacman -Syu --noconfirm &&\
    pacman -S archlinux-keyring --noconfirm &&\
    pacman -S pacman-contrib --noconfirm &&\
    pacman -S sudo openssh zsh zsh-completions python --noconfirm &&\
    sed -i 's/^# %sudo ALL=(ALL:ALL) ALL$/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers &&\
    sed -i 's/^#PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config &&\
    sed -i 's/^#PasswordAuthentication.*$/PasswordAuthentication no/' /etc/ssh/sshd_config &&\
    sed -i 's/^#DisableSandbox$/DisableSandbox/' /etc/pacman.conf &&\
    groupadd sudo &&\
    useradd -m -G wheel -G sudo -s /usr/bin/zsh maintainer &&\
    su - maintainer -c 'mkdir ~/.ssh' &&\
    su - maintainer -c 'touch ~/.ssh/authorized_keys' &&\
    su - maintainer -c 'cat << '\''EOF'\'' > ~/.ssh/authorized_keys
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1+DvxUVbKQVrRsRhZEX/aqdox/MU3nC9bqmJBDz+by
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMz2Z8uOw2WCkEQgaQtpDxCNqAPsRFiVCiXQrSzzo+vb
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKZJc89W8z5FzkZpbA4Hl6RXyX5t8nlWingBKMlFPAaw
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHFKnlIyCgW31Fah9Lu/f0Sn2SYvSN69VkoBqJBSOSV0
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKJfrFtXf4ZZ0Cvc8imYopa8lEB8pL0pozsp72uebybk
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDalCgHF6xdItVJ+372THFRFvnHwiLfDnhKHqngQwb/z
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIWhmPjY0gQuN/SuSiZd+un5gLgIeepMTRz6Oe7pEmTL
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6lbSY1sE2SNc3aHonvKqIW+DC3VeT6D4OfFo6Ar16q
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGuiuJAh/R4P13e05iv8rKMJx5Pn/KpqoMxG7eD4sQ5
    EOF' &&\
    systemctl start sshd &&\
    systemctl enable sshd &&\
    reboot"
sleep 10

