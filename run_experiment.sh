#! /bin/bash

DATA_DIR=cleaned_data
OUT_DIR=.

SEX_CC=cepstral_vec_sex.arff
VOWEL_CC=cepstral_vec_vowel.arff
SINGER_CC=cepstral_vec_all.arff
TYPE_CC=cepstral_vec_type.arff

SEX_CTF=formant_vec_sex.arff
VOWEL_CTF=formant_vec_vowel.arff
SINGER_CTF=formant_vec_all.arff
TYPE_CTF=formant_vec_type.arff

Set[1]=$SEX_CC
Set[2]=$VOWEL_CC
Set[3]=$SINGER_CC
Set[4]=$TYPE_CC

Set[5]=$SEX_CTF
Set[6]=$VOWEL_CTF
Set[7]=$SINGER_CTF
Set[8]=$TYPE_CTF

for i in {1..8}
do
  OUT=`echo ${Set[i]} | sed 's/\(.*\)\..*/\1/'`
  # run libsvm poly kernel degree 2 (quadratic)
  OPTIONS="-S 0 -K 1 -D 2 -G 0.0 -R 0.0 -N 0.5 -M 40.0 -C 1.0 -E 0.0010 -P 0.1 -model /Users -t $DATA_DIR/${Set[i]} -c 1 -x 10 -i -s $RANDOM"
  echo "${OUT_DIR}/${OUT}_results.txt"
  java -Xmx1G -cp weka.jar weka.Run weka.classifiers.functions.LibSVM $OPTIONS > "${OUT_DIR}/${OUT}_results.txt"
done
