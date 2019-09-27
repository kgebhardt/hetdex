#!/bin/bash
#
#SBATCH -J HETDEX
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -p normal
#SBATCH -o HETDEX.o%j
#SBATCH -t 24:00:00
#SBATCH -A Hobby-Eberly-Telesco

./template

