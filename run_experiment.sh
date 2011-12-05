#! /bin/bash

SEX_CC=cepstral_vec_sex.arff
VOWEL_CC=cepstral_vec_vowel.arff
SINGER_CC=cepstral_vec.arff

SEX_CTF=formant_vec_sex.arff
VOWEL_CTF=formant_vec_vowel.arff
SINGER_CTF=formant_vec.arff

Set[1] = $SEX_CC
Set[2] = $VOWEL_CC
Set[3] = $SINGER_CC

Set[4] = $SEX_CTF
Set[5] = $VOWEL_CTF
Set[6] = $SINGER_CTF


for i in 1 2 3 4 5 6 
do
  OUT = `echo ${Set[i]} | sed 's\(.*\)\..*/\1/'`
  echo $OUT
  # run libsvm poly kernel degree 2 (quadratic)
  java -Xmx1G -cp weka.jar weka.Run weka.classifiers.functions.LibSVM -S 0 -K 1 -D 2 -G 0.0 -R 0.0 -N 0.5 -M 40.0 -C 1.0 -E 0.0010 -P 0.1 -model /Users -t $i{Set[i]} -c 1 -x 10 -s $RANDOM > "$OUT_results.txt" 
done
