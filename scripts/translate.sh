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

python translate.py -model ../model/demo-model_acc_71.13_ppl_4.04_e7.pt -src ../data/bpe_sm.tc-tok-test.et -output ../data/hyps.en -gpu 0
