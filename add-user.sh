echo "======= add user =========="
groupadd 'tezos'
useradd tezos -s /bin/bash -m -g 'tezos' -G 'tezos'

echo "======= add user to sudoers =========="
echo 'tezos  ALL=(ALL:ALL) ALL' >> /etc/sudoers

mkdir /home/tezos/.ssh/
chown -R tezos:tezos /home/tezos/.ssh/
chmod 700 /home/tezos/.ssh/
touch /home/tezos/.ssh/id_rsa
touch /home/tezos/.ssh/authorized_keys
chown -R tezos:tezos /home/tezos/.ssh/authorized_keys
chmod 600 /home/tezos/.ssh/authorized_keys

echo "======= install tezos =========="
echo "======= install tezos dependencies =========="
apt install --yes rsync git m4 build-essential patch unzip wget pkg-config libgmp-dev libev-dev libhidapi-dev libffi-dev opam jq zlib1g-dev autoconf rsync

echo "======= install zfs snapshots =========="
wget https://github.com/zfsonlinux/zfs-auto-snapshot/archive/upstream/1.2.4.tar.gz
tar -xzf 1.2.4.tar.gz
cd zfs-auto-snapshot-upstream-1.2.4
make install

echo "======= create zfs directory =========="
zfs create rpool/data
chown -R tezos:tezos /data
zfs set recordsize=8k rpool/data