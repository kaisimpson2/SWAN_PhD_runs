#!/bin/bash -l
#SBATCH -J english_channel_STAT
#SBATCH -p nodes
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 02:00:00
#SBATCH -o /users/hsksimp2/scratch/swan/runs/english_channel/stat/swan_STAT_%j.out
#SBATCH -e /users/hsksimp2/scratch/swan/runs/english_channel/stat/swan_STAT_%j.err
#SBATCH --mail-user=hsksimp2@liverpool.ac.uk
#SBATCH --mail-type=ALL
#SBATCH -D /users/hsksimp2/scratch/swan/runs/english_channel/stat/

module purge
module load openmpi/5.0.8-gcc14.2.0

export OMP_NUM_THREADS=1
export OMPI_MCA_mtl=^psm2
export OMPI_MCA_btl=^openib

cd /users/hsksimp2/scratch/swan/runs/english_channel/stat/

cp english_channel_STAT.swn INPUT

mpirun -np $SLURM_NTASKS /users/hsksimp2/scratch/swan/swan.exe

mv INPUT english_channel_STAT.swn
