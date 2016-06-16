fid = fopen('qsub_script.sh','w+');
fprintf(fid,'#!/bin/bash\n');
fprintf(fid,'# qsub script\n');

ndt = 5;
j=0;
% j = j+1; names{j} = 'ndiff_1D';
% j = j+1; names{j} = 'iqs_1D';
% j = j+1; names{j} = 'iqstmp_1D';
% j = j+1; names{j} = 'ndiff2_1D';
% j = j+1; names{j} = 'iqs2_1D';
% j = j+1; names{j} = 'iqstmp2_1D';
% j = j+1; names{j} = 'ndiff_TWIGL_ramp';
% j = j+1; names{j} = 'iqs_TWIGL_ramp';
% j = j+1; names{j} = 'iqstmp_TWIGL_ramp';
% j = j+1; names{j} = 'ndiff2_TWIGL_ramp';
% j = j+1; names{j} = 'iqs2_TWIGL_ramp';
% j = j+1; names{j} = 'iqstmp2_TWIGL_ramp';
j = j+1; names{j} = 'ndiff_lra';
j = j+1; names{j} = 'iqs_lra';
j = j+1; names{j} = 'iqspc_lra';

for k=1:j
    fprintf(fid,'\n');
    for n=0:ndt
        if n<10
            num = ['0' num2str(n)];
        else
            num = num2str(n);
        end
        lab = [names{k} '_' num];
        file = [lab '.pbs'];
        command = ['qsub -P neams ' file];
        
        fprintf(fid,'%s\n',command);
    end
end
