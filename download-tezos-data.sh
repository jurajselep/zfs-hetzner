echo "======= download tezos data ========"
rsync --inplace --progress -h -r 94.130.221.4:/data/'*' /data


echo "======= generate new node identity ========"
/home/tezos/tezos/tezos-node identity generate -d /data