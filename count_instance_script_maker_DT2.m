fid = fopen('count_instance_DT2.sh','w+');
fprintf(fid,'#!/bin/bash\n');
fprintf(fid,'# count instance script\n');

do_1D = true;
do_TWIGL = true;
do_LRA = false;

do_bf = false;
do_iqs = false;
do_iqspc = false;
do_bf2 = true;
do_iqs2 = true;
do_iqspc2 = true;

ndt = 7;
j=0;
if do_1D
if do_bf,    j = j+1; names{j} = 'ndiff_1D_DT2'; end
if do_iqs,   j = j+1; names{j} = 'iqs_1D_DT2'; end
if do_iqspc, j = j+1; names{j} = 'iqspc_1D_DT2'; end
if do_bf2,    j = j+1; names{j} = 'ndiff2_1D_DT2'; end
if do_iqs2,   j = j+1; names{j} = 'iqs2_1D_DT2'; end
if do_iqspc2, j = j+1; names{j} = 'iqspc2_1D_DT2'; end
end
num_1D = j;

if do_TWIGL
if do_bf,    j = j+1; names{j} = 'ndiff_TWIGL_ramp_DT2'; end
if do_iqs,   j = j+1; names{j} = 'iqs_TWIGL_ramp_DT2'; end
if do_iqspc, j = j+1; names{j} = 'iqspc_TWIGL_ramp_DT2'; end
if do_bf2,    j = j+1; names{j} = 'ndiff2_TWIGL_ramp_DT2'; end
if do_iqs2,   j = j+1; names{j} = 'iqs2_TWIGL_ramp_DT2'; end
if do_iqspc2, j = j+1; names{j} = 'iqspc2_TWIGL_ramp_DT2'; end
end
num_TWIGL = j - num_1D;

if do_LRA
if do_bf,    j = j+1; names{j} = 'ndiff_lra_DT2'; end
if do_iqs,   j = j+1; names{j} = 'iqs_lra_DT2'; end
if do_iqspc, j = j+1; names{j} = 'iqspc_lra_DT2'; end
end
num_lra = j - num_1D - num_TWIGL;

str=0;
str = str+1; string{str} = 'Solve';
str = str+1; string{str} = 'Linear';
str = str+1; string{str} = 'Nonlinear';

for s=1:str
    for k=1:j
        fprintf(fid,'\n');
        dest = [names{k} '_' string{s} '.csv'];
        for n=0:ndt
            if n<10
                num = ['0' num2str(n)];
            else
                num = num2str(n);
            end
            lab = [names{k} '_' num];
            file = ['console_' lab '.txt'];
            if n==0
                c = '> ';
            else
                c = '>> ';
            end
            command = ['grep "' string{s} ' " ' file ' | grep -v initial| grep -v adjoint|wc -l ' c dest];

            fprintf(fid,'%s\n',command);
        end
    end
end