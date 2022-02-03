export HOME=$(pwd)

git clone --depth=1 https://github.com/efabless/caravel-lite.git

cd ..
export PDK_ROOT=$(pwd)/pdks
mkdir $PDK_ROOT
cd $HOME/caravel-lite/
make pdk

exit 0