# EasyBLEU
One command to calculate [SacreBLEU](https://arxiv.org/pdf/1804.08771.pdf), [Token-BLEU](https://www.aclweb.org/anthology/P02-1040.pdf), [BLEU w/ compound splitting](https://papers.nips.cc/paper/7181-attention-is-all-you-need.pdf) for fairseq 

## Dependencies
```sacrebleu >= 1.4.10```  
```sacremoses >=0.0.41```  
```fairseq```

## One command to calculate BLEU
```console
❱❱❱ ./BLEU.sh TESTSET SRCLANG TGTLANG GEN
```  
specifically, 
- ```TESTSET```  
The available test sets are:  
```                 
                 wmt20/tworefs: WMT20 news test sets with two references
                     wmt20/dev: Development data for tasks new to 2020.
                         wmt20: Official evaluation data for WMT20
             wmt19/google/wmtp: Additional paraphrase of the official WMT19 reference.
              wmt19/google/hqr: Best human selected-reference between wmt19 and wmt19/google/ar.
              wmt19/google/hqp: Best human-selected reference between wmt19/google/arp and wmt19/google/wmtp.
            wmt19/google/hqall: Best human-selected reference among original official reference and the Google reference and paraphrases.
              wmt19/google/arp: Additional paraphrase of wmt19/google/ar.
               wmt19/google/ar: Additional high-quality reference for WMT19/en-de.
                     wmt19/dev: Development data for tasks new to 2019.
                         wmt19: Official evaluation data.
                 wmt18/test-ts: Official evaluation sources with extra test sets interleaved.
                     wmt18/dev: Development data (Estonian<>English).
                         wmt18: Official evaluation data.
                 wmt17/tworefs: Systems with two references.
                      wmt17/ms: Additional Chinese-English references from Microsoft Research.
                wmt17/improved: Improved zh-en and en-zh translations.
                     wmt17/dev: Development sets released for new languages in 2017.
                       wmt17/B: Additional reference for EN-FI and FI-EN.
                         wmt17: Official evaluation data.
                 wmt16/tworefs: EN-FI with two references.
                     wmt16/dev: Development sets released for new languages in 2016.
                       wmt16/B: Additional reference for EN-FI.
                         wmt16: Official evaluation data.
                         wmt15: Official evaluation data.
                    wmt14/full: Evaluation data released after official evaluation for further research.
                         wmt14: Official evaluation data.
                         wmt13: Official evaluation data.
                         wmt12: Official evaluation data.
                         wmt11: Official evaluation data.
                         wmt10: Official evaluation data.
                         wmt09: Official evaluation data.
                      wmt08/nc: Official evaluation data (news commentary).
                wmt08/europarl: Official evaluation data (Europarl).
                         wmt08: Official evaluation data.
                 multi30k/2018: 2018 flickr test set of Multi30k dataset. See https://competitions.codalab.org/competitions/19917 for evaluation.
                 multi30k/2017: 2017 flickr test set of Multi30k dataset
                 multi30k/2016: 2016 flickr test set of Multi30k dataset
                      mtnt2019: Test set for the WMT 19 robustness shared task
                 mtnt1.1/valid: Validation data for the Machine Translation of Noisy Text task: http://www.cs.cmu.edu/~pmichel1/mtnt/
                 mtnt1.1/train: Training data for the Machine Translation of Noisy Text task: http://www.cs.cmu.edu/~pmichel1/mtnt/
                  mtnt1.1/test: Test data for the Machine Translation of Noisy Text task: http://www.cs.cmu.edu/~pmichel1/mtnt/
               iwslt17/tst2016: Development data for IWSLT 2017.
               iwslt17/tst2015: Development data for IWSLT 2017.
               iwslt17/tst2014: Development data for IWSLT 2017.
               iwslt17/tst2013: Development data for IWSLT 2017.
               iwslt17/tst2012: Development data for IWSLT 2017.
               iwslt17/tst2011: Development data for IWSLT 2017.
               iwslt17/tst2010: Development data for IWSLT 2017.
               iwslt17/dev2010: Development data for IWSLT 2017.
                       iwslt17: Official evaluation data for IWSLT.
```  
- ```SRCLANG``` source language types, for example, ```en```
- ```TGTLANG``` target language types, for example, ```de```
- ```GEN``` decoding output of [fairseq](https://github.com/pytorch/fairseq)
