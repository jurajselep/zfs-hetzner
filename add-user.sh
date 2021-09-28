echo "======= add user =========="
groupadd 'tezos'
useradd tezos -s /bin/bash -m -g 'tezos' -G 'tezos'

echo "======= change tezos password =========="
echo tezos:$(printf "%q" "$v_user_password") | chpasswd

echo "======= add user to sudoers =========="
echo 'tezos  ALL=(ALL:ALL) ALL' >> /etc/sudoers


echo "======= install tezos =========="
echo "======= install tezos dependencies =========="
apt install --yes rsync git m4 build-essential patch unzip wget pkg-config libgmp-dev libev-dev libhidapi-dev libffi-dev opam jq zlib1g-dev autoconf rsync
