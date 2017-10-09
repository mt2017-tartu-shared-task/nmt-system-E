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

../OpenNMT-py/tools/train-truecaser.perl --model en-truecase.mdl --corpus tok-train.en
../OpenNMT-py/tools/train-truecaser.perl --model et-truecase.mdl --corpus tok-train.et

for lang in en et
do
for f in {test,dev,train}.$lang
do
../OpenNMT-py/tools/truecase.perl --model $lang-truecase.mdl < tok-$f > tc-tok-$f	
done 
done 

echo 'finished'
