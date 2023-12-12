echo "Скрипт ceate_vm_9000.sh начал работу..."

if [ "$EUID" -ne 0 ]
  then echo "Пожалуйста, запустите скрипт от имени суперпользователя (root)."
  exit
fi
sudo apt update -y && sudo apt install libguestfs-tools -y & wait $!
# Пример внедрения ключа в образ, если необходимо
# FILE1=/root/ansible_ssh_key.txt
# if test -f "$FILE1"; then
#    echo "Найден файл ключа SSH для Ansible..."
#  else
#    echo "Не удалось найти файл /root/anible_ssh_key.txt. Пожалуйста, создайте этот файл. Завершение работы."
#    exit
# fi

FILE2=/root/jammy-server-cloudimg-amd64.img.original
if test -f "$FILE2"; then
     echo "Образ найден, пропускается загрузка..."
     cp /root/jammy-server-cloudimg-amd64.img.original /root/jammy-server-cloudimg-amd64.img
else
     echo "Загрузка образа..."
     cd /root/
     wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
fi

virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent &
wait $!
virt-customize -a jammy-server-cloudimg-amd64.img --run-command "useradd -m -s /bin/bash ubuntu" &
wait $!
virt-customize -a jammy-server-cloudimg-amd64.img --root-password password:ubuntu &
wait $!
# virt-customize -a jammy-server-cloudimg-amd64.img --ssh-inject ubuntu:file:/root/ansible_ssh_key.txt
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
qm set 9000 --scsi0 zfs:0,import-from=/root/jammy-server-cloudimg-amd64.img
qm set 9000 --ide2 zfs:cloudinit
qm set 9000 --boot order=scsi0
qm set 9000 --serial0 socket --vga serial0
qm set 9000 -agent 1
qm template 9000

echo "Скрипт ceate_vm_9000 выполнен."
