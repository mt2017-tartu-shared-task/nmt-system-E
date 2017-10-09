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

paste demo-all.{et,en} | shuf > mixed-data.both

echo 'mixed-data generated'

sed -n 1,50000p mixed-data.both | cut -f 1 > test.et
sed -n 1,50000p mixed-data.both | cut -f 2 > test.en
sed -n 50001,75000p mixed-data.both | cut -f 1 > dev.et
sed -n 50001,75000p mixed-data.both | cut -f 2 > dev.en
sed -n 75001,19051439p mixed-data.both | cut -f 1 > train.et
sed -n 75001,19051439p mixed-data.both | cut -f 2 > train.en 

echo 'finished'
