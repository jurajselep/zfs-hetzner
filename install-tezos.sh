echo "======= install rust =========="
wget https://sh.rustup.rs/rustup-init.sh
chmod +x rustup-init.sh
./rustup-init.sh --profile minimal --default-toolchain 1.52.1 -y
source $HOME/.cargo/env;
cargo --version

echo "======= get tezos source =========="
git clone https://gitlab.com/tezos/tezos.git
cd tezos
git checkout latest-release

echo "======= install tezos dependecies =========="
opam init --bare -y
make build-deps

echo "======= compile source =========="
eval $(opam env)
make