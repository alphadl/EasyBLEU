#!/bin/bash

if [ $# -ne 4 ]; then
    echo "usage: $0 TESTSET SRCLANG TGTLANG GEN"
    exit 1
fi

TESTSET=$1
SRCLANG=$2
TGTLANG=$3

GEN=$4

if ! command -v sacremoses &> /dev/null
then
    echo "sacremoses could not be found, please install with: pip install sacremoses==0.0.41"
    exit
fi

if ! command -v sacrebleu &> /dev/null
then
    echo "sacrebleu could not be found, please install with: pip install sacrebleu==1.4.10"
    exit
fi


grep ^H $GEN \
| sed 's/^H\-//' \
| sort -n -k 1 \
| awk -F '\t' '{print $NF}' \
| sacremoses detokenize \
> $GEN.sorted.detok

sacrebleu -t $TESTSET -l $SRCLANG-$TGTLANG --echo ref > $SRCLANG-$TGTLANG.ref

echo ">>>sacrebleu"
cat $GEN.sorted.detok | sacrebleu -t $TESTSET -l $SRCLANG-$TGTLANG
echo ""
echo "origin=$SRCLANG"
cat $GEN.sorted.detok | sacrebleu -t $TESTSET -l $SRCLANG-$TGTLANG --origlang=$SRCLANG 
echo ""
echo "origin=$TGTLANG"
cat $GEN.sorted.detok | sacrebleu -t $TESTSET -l $SRCLANG-$TGTLANG --origlang=non-$SRCLANG 

echo ""
echo ">>>token level multi-bleu"
sacremoses tokenize <$GEN.sorted.detok> $GEN.sorted.tok
sacremoses tokenize <$SRCLANG-$TGTLANG.ref> $SRCLANG-$TGTLANG.ref.tok
fairseq-score -r $SRCLANG-$TGTLANG.ref.tok -s $GEN.sorted.tok

echo ""
echo ">>>compound-bleu"
perl -ple 's{(\S)-(\S)}{$1 ##AT##-##AT## $2}g' <$GEN.sorted.tok> $GEN.sorted.tok.com
perl -ple 's{(\S)-(\S)}{$1 ##AT##-##AT## $2}g' <$SRCLANG-$TGTLANG.ref.tok> $SRCLANG-$TGTLANG.ref.tok.com

fairseq-score -r $SRCLANG-$TGTLANG.ref.tok.com -s $GEN.sorted.tok.com

rm $SRCLANG-$TGTLANG.ref.tok.com $GEN.sorted.tok.com $GEN.sorted.detok $GEN.sorted.tok $SRCLANG-$TGTLANG.ref.tok $SRCLANG-$TGTLANG.ref
