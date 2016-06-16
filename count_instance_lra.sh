#!/bin/bash
# count instance script

grep "Solve " console_ndiff_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > ndiff_lra_Solve.csv
grep "Solve " console_ndiff_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Solve.csv
grep "Solve " console_ndiff_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Solve.csv
grep "Solve " console_ndiff_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Solve.csv
grep "Solve " console_ndiff_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Solve.csv
grep "Solve " console_ndiff_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Solve.csv

grep "Solve " console_iqspc_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqspc_lra_Solve.csv
grep "Solve " console_iqspc_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Solve.csv
grep "Solve " console_iqspc_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Solve.csv
grep "Solve " console_iqspc_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Solve.csv
grep "Solve " console_iqspc_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Solve.csv
grep "Solve " console_iqspc_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Solve.csv

grep "Solve " console_iqs_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqs_lra_Solve.csv
grep "Solve " console_iqs_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Solve.csv
grep "Solve " console_iqs_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Solve.csv
grep "Solve " console_iqs_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Solve.csv
grep "Solve " console_iqs_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Solve.csv
grep "Solve " console_iqs_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Solve.csv

grep "Linear " console_ndiff_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > ndiff_lra_Linear.csv
grep "Linear " console_ndiff_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Linear.csv
grep "Linear " console_ndiff_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Linear.csv
grep "Linear " console_ndiff_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Linear.csv
grep "Linear " console_ndiff_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Linear.csv
grep "Linear " console_ndiff_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Linear.csv

grep "Linear " console_iqspc_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqspc_lra_Linear.csv
grep "Linear " console_iqspc_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Linear.csv
grep "Linear " console_iqspc_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Linear.csv
grep "Linear " console_iqspc_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Linear.csv
grep "Linear " console_iqspc_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Linear.csv
grep "Linear " console_iqspc_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Linear.csv

grep "Linear " console_iqs_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqs_lra_Linear.csv
grep "Linear " console_iqs_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Linear.csv
grep "Linear " console_iqs_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Linear.csv
grep "Linear " console_iqs_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Linear.csv
grep "Linear " console_iqs_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Linear.csv
grep "Linear " console_iqs_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Linear.csv

grep "Nonlinear " console_ndiff_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > ndiff_lra_Nonlinear.csv
grep "Nonlinear " console_ndiff_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Nonlinear.csv
grep "Nonlinear " console_ndiff_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Nonlinear.csv
grep "Nonlinear " console_ndiff_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Nonlinear.csv
grep "Nonlinear " console_ndiff_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Nonlinear.csv
grep "Nonlinear " console_ndiff_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff_lra_Nonlinear.csv

grep "Nonlinear " console_iqspc_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqspc_lra_Nonlinear.csv
grep "Nonlinear " console_iqspc_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Nonlinear.csv
grep "Nonlinear " console_iqspc_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Nonlinear.csv
grep "Nonlinear " console_iqspc_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Nonlinear.csv
grep "Nonlinear " console_iqspc_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Nonlinear.csv
grep "Nonlinear " console_iqspc_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc_lra_Nonlinear.csv

grep "Nonlinear " console_iqs_lra_00.txt | grep -v initial| grep -v adjoint|wc -l > iqs_lra_Nonlinear.csv
grep "Nonlinear " console_iqs_lra_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Nonlinear.csv
grep "Nonlinear " console_iqs_lra_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Nonlinear.csv
grep "Nonlinear " console_iqs_lra_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Nonlinear.csv
grep "Nonlinear " console_iqs_lra_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Nonlinear.csv
grep "Nonlinear " console_iqs_lra_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqs_lra_Nonlinear.csv
