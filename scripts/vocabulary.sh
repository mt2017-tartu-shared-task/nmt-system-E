#!/bin/bash

#The name of the job is
#SBATCH -J nmt_power_rangers_task

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=dimatkachukgf@gmail.com

#SBATCH --mem=150G
	
#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

module load python-2.7.13

python preprocess.py -train_src ../data/bpe_sm.cleaned-tc-tok-train.et -train_tgt ../data/bpe_sm.cleaned-tc-tok-train.en -valid_src ../data/bpe_sm.cleaned-tc-tok-dev.et -valid_tgt ../data/bpe_sm.cleaned-tc-tok-dev.en -save_data ../data/rdy -src_vocab_size 20000 -tgt_vocab_size 20000 -seed 123 

echo 'finished'
