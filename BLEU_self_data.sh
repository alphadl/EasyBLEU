#!/bin/bash

GEN=$1
REF=$2

grep ^H $GEN \
| sed 's/^H\-//' \
| sort -n -k 1 \
| awk -F '\t' '{print $NF}' \
| sacremoses detokenize \
> $GEN.sorted.detok

cat $REF \
| sacremoses detokenize \
> $REF.detok

echo ">>>sacrebleu"
cat $GEN.sorted.detok | sacrebleu $REF.detok

echo ">>>multi-bleu"
sacremoses tokenize <$GEN.sorted.detok> $GEN.sorted.tok
sacremoses tokenize <$REF.detok> $REF.detok.tok
fairseq-score -r $REF.detok.tok -s $GEN.sorted.tok

rm *.detok *.tok
