#!/bin/bash -l
#SBATCH -J english_channel_NONSTAT
#SBATCH -p nodes
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 48:00:00
#SBATCH -o /users/hsksimp2/scratch/swan/runs/english_channel/non_stat/swan_NONSTAT_%j.out
#SBATCH -e /users/hsksimp2/scratch/swan/runs/english_channel/non_stat/swan_NONSTAT_%j.err
#SBATCH --mail-user=hsksimp2@liverpool.ac.uk
#SBATCH --mail-type=ALL
#SBATCH -D /users/hsksimp2/scratch/swan/runs/english_channel/non_stat/

module purge
module load openmpi/5.0.8-gcc14.2.0

export OMP_NUM_THREADS=1
export OMPI_MCA_mtl=^psm2
export OMPI_MCA_btl=^openib

cd /users/hsksimp2/scratch/swan/runs/english_channel/non_stat/

cp english_channel_NONSTAT.swn INPUT && echo "INPUT created OK"

mpirun -np $SLURM_NTASKS /users/hsksimp2/scratch/swan/swan.exe

mv INPUT english_channel_NONSTAT.swn
