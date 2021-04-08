PDK_PATH=$1
DV_PATH=$2
DV_TEST_ID=$3
SIM_MODE=$4

cd $DV_PATH

## get the name of all subdfolders under verilog/dv 
ALL_DV_TESTS="$(find * -maxdepth 0 -type d)"
## convert all ALL_DV_TESTS to an array
TESTS_ARR=($ALL_DV_TESTS)
## get length of the TESTS array
len=${#TESTS_ARR[@]}

## make sure that the test ID is less than the array length
if [ $DV_TEST_ID -ge $len ]
then
    echo "Error: Invalid Test ID"
    exit 1
fi

## get the name corresponding to the test ID
PATTERN=${TESTS_ARR[$DV_TEST_ID]}

OUT_FILE=$DV_PATH/$DV_TEST_ID.out

export SIM=$SIM_MODE
echo "Running $PATTERN $SIM.."
logFile=$DV_PATH/$PATTERN.$SIM.dv.out
cd $PATTERN
echo $(pwd)
make 2>&1 | tee $logFile
grep "Monitor" $logFile >> $OUT_FILE
make clean

echo "Execution Done on $PATTERN !"

cat $OUT_FILE

exit 0