echo "======= install zfs snapshots =========="
wget https://github.com/zfsonlinux/zfs-auto-snapshot/archive/upstream/1.2.4.tar.gz
tar -xzf 1.2.4.tar.gz
cd zfs-auto-snapshot-upstream-1.2.4
make install

echo "======= create zfs directory =========="
zfs create rpool/data
zfs set recordsize=8k rpool/data

echo "======= download tezos data ========"


echo "======= generate new node identity ========"
/home/tezos/tezos-node identity generate -d /data