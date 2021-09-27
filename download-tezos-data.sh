echo "======= create zfs directory =========="
zfs create rpool/data
zfs set recordsize=8k rpool/data

echo "======= download tezos data ========"



echo "======= generate new node identity ========"
/home/tezos/tezos-node identity generate -d /data