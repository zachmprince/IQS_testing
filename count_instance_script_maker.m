fid = fopen('count_instance_lra.sh','w+');
fprintf(fid,'#!/bin/bash\n');
fprintf(fid,'# count instance script\n');

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
j = j+1; names{j} = 'iqspc_lra';
j = j+1; names{j} = 'iqs_lra';

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