#!/bin/bash -l
#SBATCH -J swan_nonstat_windonly
#SBATCH -p nodes
#SBATCH -N 1
#SBATCH -n 160
#SBATCH -t 04:00:00
#SBATCH -o swan_%j.out
#SBATCH -e swan_%j.err
#SBATCH --mail-user=hsksimp2@liverpool.ac.uk
#SBATCH --mail-type=ALL
#SBATCH -D ./

module purge
module load openmpi/5.0.8-gcc14.2.0

export OMP_NUM_THREADS=1
export OMPI_MCA_mtl=^psm2
export OMPI_MCA_btl=^openib

mpirun -np $SLURM_NTASKS ~/scratch/swan/build/swan4151/swan.exe
