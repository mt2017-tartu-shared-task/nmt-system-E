#!/bin/bash

#The name of the job is
#SBATCH -J nmt_power_rangers_task

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00


#SBATCH --mem=50G

#SBATCH --mail-type=ALL
#SBATCH --mail-user=dimatkachukgf@gmail.com

cat cleaned-tc-tok-train.et cleaned-tc-tok-train.en | ../OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 20000 > eten_sm.bpe 

for lang in et en 
do
../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten_sm.bpe < cleaned-tc-tok-train.$lang > bpe_sm.cleaned-tc-tok-train.$lang
../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten_sm.bpe < cleaned-tc-tok-dev.$lang > bpe_sm.cleaned-tc-tok-dev.$lang 
../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten_sm.bpe < tc-tok-test.$lang > bpe_sm.tc-tok-test.$lang
done 

echo 'finished'
