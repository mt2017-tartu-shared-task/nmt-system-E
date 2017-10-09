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

#SBATCH --mem=50G

perl ../OpenNMT-py/tools/multi-bleu.perl bpe_sm.tc-tok-test.en < hyps.en

