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

../OpenNMT-py/tools/clean-corpus-n.perl tc-tok-train en et cleaned-tc-tok-train 1 100

echo 'finished'
