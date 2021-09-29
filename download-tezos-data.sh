echo "======= download tezos data ========"
rsync --inplace --progress -h -r 95.216.102.157:/data/'*' /data


echo "======= generate new node identity ========"
/home/tezos/tezos/tezos-node identity generate -d /data