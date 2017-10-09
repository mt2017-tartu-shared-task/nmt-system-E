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


python train.py -data ../data/rdy -save_model ../model/demo-model -gpuid 0 

echo 'finished'
