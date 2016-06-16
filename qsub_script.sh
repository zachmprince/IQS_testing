#!/bin/bash
# qsub script

qsub -P neams ndiff_lra_00.pbs
qsub -P neams ndiff_lra_01.pbs
qsub -P neams ndiff_lra_02.pbs
qsub -P neams ndiff_lra_03.pbs
qsub -P neams ndiff_lra_04.pbs
qsub -P neams ndiff_lra_05.pbs

qsub -P neams iqs_lra_00.pbs
qsub -P neams iqs_lra_01.pbs
qsub -P neams iqs_lra_02.pbs
qsub -P neams iqs_lra_03.pbs
qsub -P neams iqs_lra_04.pbs
qsub -P neams iqs_lra_05.pbs

qsub -P neams iqspc_lra_00.pbs
qsub -P neams iqspc_lra_01.pbs
qsub -P neams iqspc_lra_02.pbs
qsub -P neams iqspc_lra_03.pbs
qsub -P neams iqspc_lra_04.pbs
qsub -P neams iqspc_lra_05.pbs
