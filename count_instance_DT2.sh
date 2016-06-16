#!/bin/bash
# count instance script

grep "Solve " console_ndiff2_1D_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv
grep "Solve " console_ndiff2_1D_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_1D_DT2_Solve.csv

grep "Solve " console_iqs2_1D_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv
grep "Solve " console_iqs2_1D_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_1D_DT2_Solve.csv

grep "Solve " console_iqspc2_1D_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv
grep "Solve " console_iqspc2_1D_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_1D_DT2_Solve.csv

grep "Solve " console_ndiff2_TWIGL_ramp_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_ndiff2_TWIGL_ramp_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> ndiff2_TWIGL_ramp_DT2_Solve.csv

grep "Solve " console_iqs2_TWIGL_ramp_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqs2_TWIGL_ramp_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> iqs2_TWIGL_ramp_DT2_Solve.csv

grep "Solve " console_iqspc2_TWIGL_ramp_DT2_00.txt | grep -v initial| grep -v adjoint|wc -l > iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_01.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_02.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_03.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_04.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_05.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_06.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
grep "Solve " console_iqspc2_TWIGL_ramp_DT2_07.txt | grep -v initial| grep -v adjoint|wc -l >> iqspc2_TWIGL_ramp_DT2_Solve.csv
