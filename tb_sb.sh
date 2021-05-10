#!/bin/bash
#
#SBATCH --job-name=ldiftb
#SBATCH --partition=viscam
##SBATCH --nodelist=viscam2
#SBATCH --mem=4GB
#SBATCH --cpus-per-task=1

eval "$(conda shell.bash hook)"
conda activate pytorch14
export PATH=/viscam/u/sumith/Jacinle/bin:$PATH

tensorboard --logdir trained_models/sif-transcoder-shapenet-ldif-baseline/log --bind_all
