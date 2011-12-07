#! /bin/bash

echo $#
if [ $# -lt 1 ]
  then
    echo "need to give a file to run"
    exit
fi

echo "this will run $2 30 times"

DATA_DIR=cleaned_data
OUT_DIR_ROOT=.
ITER=30
TYPE=$1

Set[1]="formant_vec_${TYPE}.arff"
Set[2]="cepstral_vec_${TYPE}.arff"


OUT_DIR="${OUT_DIR_ROOT}/running_${TYPE}"
echo ${OUT_DIR}
mkdir ${OUT_DIR}

for j in $(eval echo {1..$ITER})
do
  for i in {1..2}
  do
    OUT=`echo ${Set[i]} | sed 's/\(.*\)\..*/\1/'`
    # run libsvm poly kernel degree 2 (quadratic)
    OPTIONS="-S 0 -K 1 -D 2 -G 0.0 -R 0.0 -N 0.5 -M 40.0 -C 1.0 -E 0.0010 -P 0.1 -model /Users -t $DATA_DIR/${Set[i]} -c 1 -x 10 -i -s $RANDOM"
    java -Xmx1G -cp weka.jar weka.Run weka.classifiers.functions.LibSVM $OPTIONS > "${OUT_DIR}/${OUT}_results_${j}.txt"
  done
done

