# Milestone 1: Hand in the baseline system and translation  [Report]
PowerRangers team:
 * @yevhen-tyshchenko
 * @dimatkachuk
 * @BreakINbaDs
 
## Our project board:
![screen1](https://raw.githubusercontent.com/mt2017-tartu-shared-task/nmt-system-E/master/reports/pboard.PNG)

## This milestone tasks description:
### Corpus Preparation
Starting from raw data, we applied following preprocessing steps:
* corpora concatenating (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/concat.sh): we got one big parallel text corpus of 19051439 lines 
* data shuffling (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/splitting.sh): to feed sentences to NMT system later in the random order  
* data splitting (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/splitting.sh): 18976438 training examples, 50000 test examples, and 25000 development examples
* data tokenization (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/tokenize.sh)
* data true-casing (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/true-case.sh): to true-case our corpus.
* BPE (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/bpe.sh): we used joint vocabulary of size 20000

We used [Moses](http://www.statmt.org/moses/) scripts to do basic preprocessing, and [BPE](https://github.com/rsennrich/subword-nmt) for the subword segmentation. 

### Model Training
We used 1 Tesla P100 GPU Machine provided by [HPC center of the University of Tartu](https://www.hpc.ut.ee/en_US/web/guest/home) to train our model with vocabulary of size 20000. The model we trained is the default [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py) model, which consists of a 2-layer LSTM with 500 hidden units on both the encoder/decoder.

We had trained our best model for 3 days 7 epochs. Development set perplexity was 4.04. We performed early stopping to stop the training process. You can find the script we used to run training here (https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/scripts/train.sh).

### Translating and Evaluating Results
We performed an inference and got unpostprocessed English hyps file. 

We used this file, processed reference file, and BLEU metric to evaluate the translation performance of our model, and got 32.26 points.

_________________________________________________________________________________________________________________
For the next milestone, we will focus on some more advanced evaluation and error analysis technics.    
