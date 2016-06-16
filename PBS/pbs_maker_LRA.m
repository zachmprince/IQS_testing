base = fopen('base_file_lra.txt','r');

j=0;
j = j+1; names{j} = 'ndiff_lra';
j = j+1; names{j} = 'iqs_lra';
j = j+1; names{j} = 'iqspc_lra';

ndt = 5;
for i=1:31
    tline = fgetl(base);
    A{i} = tline;
end
fclose(base);

for k=1:j
    for n=0:ndt
        dt = 0.004/(2^n)
        if n<10
            num = ['0' num2str(n)];
        else
            num = num2str(n);
        end
        lab = [names{k} '_' num];
        
        A{2} = ['#PBS -N ' lab(1:4)  lab(end-5:end)];
        A{27} = ['mpiexec -n $NSLOTS ../../../yak-opt -i ' names{k} '.i '...
            'Executioner/dt=' sprintf('%g',dt) ' Outputs/file_base=' lab ...
            ' --n-threads=1 > console_' lab '.txt'];
        
        file = [lab '.pbs'];
        fid = fopen(file,'w+');
        for i=1:30
            fprintf(fid,'%s\n', A{i});
        end
        fprintf(fid,'%s', A{31});
        fclose(fid);
    end
end
        
        
    