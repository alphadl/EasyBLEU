# EasyBLEU

<img align="right" src="bleu.png" width="15%">

<b>EasyBLEU</b> is an effective and simple tool to calculate [SacreBLEU](https://arxiv.org/pdf/1804.08771.pdf), [Token-BLEU](https://www.aclweb.org/anthology/P02-1040.pdf), [BLEU w/ compound splitting](https://papers.nips.cc/paper/7181-attention-is-all-you-need.pdf) for [fairseq](https://github.com/pytorch/fairseq). Hopefully, it could facilitate the machine translation research community with a fair comparison, especially for the fairseq users.

## Dependencies
```sacrebleu >= 1.4.10```  
```sacremoses >=0.0.41```  
```fairseq```

## One command to calculate BLEU
```console
❱❱❱ ./BLEU.sh TESTSET SRCLANG TGTLANG GEN
```  
specifically, 
- ```TESTSET``` the available test sets are:  
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

### Example
```console
❱❱❱ ./BLEU.sh wmt14/full en de gen.out

>>>sacrebleu
BLEU+case.mixed+lang.en-de+numrefs.1+smooth.exp+test.wmt14/full+tok.13a+version.1.4.13 = 27.2 58.8/33.1/20.8/13.5 (BP = 1.000 ratio = 1.015 hyp_len = 63650 ref_len = 62688)
origin=en
BLEU+case.mixed+lang.en-de+numrefs.1+origlang.en+smooth.exp+test.wmt14/full+tok.13a+version.1.4.13 = 25.8 58.2/31.9/19.7/12.5 (BP = 0.993 ratio = 0.993 hyp_len = 35512 ref_len = 35745)
origin=de
BLEU+case.mixed+lang.en-de+numrefs.1+origlang.non-en+smooth.exp+test.wmt14/full+tok.13a+version.1.4.13 = 28.8 59.7/34.5/22.3/14.9 (BP = 1.000 ratio = 1.044 hyp_len = 28138 ref_len = 26943)

>>>token-bleu
Namespace(ignore_case=False, order=4, ref='en-de.ref.tok', sacrebleu=False, sentence_bleu=False, sys='gen.out.sorted.tok')
BLEU4 = 27.31, 59.2/33.2/20.8/13.5 (BP=1.000, ratio=1.005, syslen=63473, reflen=63131)

>>>compound-bleu
Namespace(ignore_case=False, order=4, ref='en-de.ref.tok.com', sacrebleu=False, sentence_bleu=False, sys='gen.out.sorted.tok.com')
BLEU4 = 27.92, 59.8/33.8/21.4/14.0 (BP=1.000, ratio=1.005, syslen=64851, reflen=64549)
```  
