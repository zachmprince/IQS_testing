base = fopen('base_file.txt','r');

do_1D = true;
do_TWIGL = true;
do_LRA = false;

do_bf = false;
do_iqs = false;
do_iqspc = false;
do_bf2 = true;
do_iqs2 = true;
do_iqspc2 = true;

e_max = [0.05 0.01 5e-3 1e-3 5e-4 1e-4 5e-5 1e-5];
e_tol = 0.8*e_max;

num_tests = length(e_max)-1;

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

for i=1:31
    tline = fgetl(base);
    A{i} = tline;
end
fclose(base);

for k=1:j
    for n=0:num_tests
        if n<10
            num = ['0' num2str(n)];
        else
            num = num2str(n);
        end
        lab = [names{k} '_' num];
        
        if do_LRA && k>(num_1D+num_TWIGL)
            exec = '../../rattlesnake-opt';
        else
            exec = '../../yak-opt';
        end
        
        A{2} = ['#PBS -N ' lab(1:4)  lab(end-5:end)];
        A{27} = ['mpiexec -n $NSLOTS ' exec ' -i ' names{k} '.i '...
            ' Executioner/TimeStepper/e_tol=' sprintf('%g',e_tol(n+1)) ...
            ' Executioner/TimeStepper/e_max=' sprintf('%g',e_max(n+1))...
            ' Outputs/file_base=' lab ' --n-threads=1 > console_' lab '.txt'];
        
        file = [lab '.pbs'];
        fid = fopen(file,'w+');
        for i=1:30
            fprintf(fid,'%s\n', A{i});
        end
        fprintf(fid,'%s', A{31});
        fclose(fid);
    end
end
        
        
    