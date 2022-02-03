export HOME=$(pwd)

git clone --depth=1 https://github.com/efabless/caravel-lite.git

cd ..
export PDK_ROOT=$(pwd)/pdks
mkdir $PDK_ROOT
cd $HOME/caravel-lite/ || exit
make skywater-pdk skywater-library open_pdks build-pdk gen-sources

exit 0
