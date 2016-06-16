clear; clc; close all;
fig=0;

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
% e_max = [0.05 0.01 5e-3 1e-3 5e-4 1e-4 5e-5];
e_tol = 0.8*e_max;

num_tests = length(e_max)-1;
plot_dt=false;

if do_1D
    file_base = '1D_';
    eig = 0.9999439186;
    time = 2.0;
    tend = 2.0;
    fac = time/tend;

    baseline_name = [file_base 'baseline.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_baseline] = csv_reader(baseline_name,eig,time,fig,true,plot_dt);

    file_base = [file_base 'DT2_'];
    for i=0:num_tests
        fprintf('%d/%d\n',i,num_tests)
        if i<10
            num = ['0' num2str(i)];
        else
            num = num2str(i);
        end
        if do_iqs
            filename = ['iqs_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqs(i+1),dt(i+1),st_iqs(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
        end
        
        if do_iqspc
            filename = ['iqspc_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqspc(i+1),dt(i+1),st_iqspc(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
        end

        if do_bf
            filename = ['ndiff_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_bf(i+1),dt(i+1),st_bf(i+1)]  = csv_reader(filename,eig,time,fig,3,plot_dt);
        end
        
        if do_iqs2
            filename = ['iqs2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqs2(i+1),dt(i+1),st_iqs2(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
        end
        
        if do_iqspc2
            filename = ['iqspc2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqspc2(i+1),dt(i+1),st_iqspc2(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
        end

        if do_bf2
            filename = ['ndiff2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_bf2(i+1),dt(i+1),st_bf2(i+1)]  = csv_reader(filename,eig,time,fig,3,plot_dt);
        end

    end
    tab = zeros(num_tests+1,11);
    for i=1:num_tests+1, tab(i,1)=i; end
    tab(:,2) = e_max';
    if do_bf
        tab(:,3) = abs(p_bf-p_baseline)/p_baseline;
        tab(:,4) = st_bf;
        tab(:,5) = csvread(['console/ndiff_' file_base 'Solve.csv']);
    end
    if do_iqs 
        tab(:,6) = abs(p_iqs'-p_baseline)/p_baseline; 
        tab(:,7) = st_iqs;
        tab(:,8) = csvread(['console/iqs_' file_base 'Solve.csv']);
    end
    if do_iqspc
        tab(:,9) = abs(p_iqspc-p_baseline)/p_baseline; 
        tab(:,10)  = st_iqspc;
        tab(:,11) = csvread(['console/iqspc_' file_base 'Solve.csv']);
    end
    tab_1D = tab
    
    tab = zeros(num_tests+1,11);
    for i=1:num_tests+1, tab(i,1)=i; end
    tab(:,2) = e_max';
    if do_bf2
        tab(:,3) = abs(p_bf2-p_baseline)/p_baseline;
        tab(:,4) = st_bf2;
        tab(:,5) = csvread(['console/ndiff2_' file_base 'Solve.csv']);
    end
    if do_iqs2
        tab(:,6) = abs(p_iqs2'-p_baseline)/p_baseline; 
        tab(:,7) = st_iqs2;
        tab(:,8) = csvread(['console/iqs2_' file_base 'Solve.csv']);
    end
    if do_iqspc2
        tab(:,9) = abs(p_iqspc2-p_baseline)/p_baseline; 
        tab(:,10)  = st_iqspc2;
        tab(:,11) = csvread(['console/iqspc2_' file_base 'Solve.csv']);
    end
    tab2_1D = tab
end

if do_TWIGL
    file_base = 'TWIGL_ramp_';
    eig = 0.9132195712;
    time = 0.5;
    tend = 0.5;
    fac = time/tend;

%     baseline_name = [file_base 'baseline.csv'];
    baseline_name = 'iqstmp2_TWIGL_ramp_10.csv';
    if plot_dt
        fig = fig+1;
    end
    [p_baseline,~] = csv_reader(baseline_name,eig,time,fig,true,plot_dt);

    file_base = [file_base 'DT2_'];
    for i=0:num_tests
        fprintf('%d/%d\n',i,num_tests)
        if i<10
            num = ['0' num2str(i)];
        else
            num = num2str(i);
        end
        if do_iqs
            filename = ['iqs_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqs(i+1),dt(i+1),st_iqs(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
        end
        
        if do_iqspc
            filename = ['iqspc_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqspc(i+1),dt(i+1),st_iqspc(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
        end

        if do_bf
            filename = ['ndiff_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_bf(i+1),dt(i+1),st_bf(i+1)]  = csv_reader(filename,eig,time,fig,3,plot_dt);
        end
        
        if do_iqs2
            filename = ['iqs2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqs2(i+1),dt(i+1),st_iqs2(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
        end
        
        if do_iqspc2
            filename = ['iqspc2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_iqspc2(i+1),dt(i+1),st_iqspc2(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
        end

        if do_bf2
            filename = ['ndiff2_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_bf2(i+1),dt(i+1),st_bf2(i+1)]  = csv_reader(filename,eig,time,fig,3,plot_dt);
        end

    end
    tab = zeros(num_tests+1,11);
    for i=1:num_tests+1, tab(i,1)=i; end
    tab(:,2) = e_max';
    if do_bf
        tab(:,3) = abs(p_bf-p_baseline)/p_baseline;
        tab(:,4) = st_bf;
        tab(:,5) = csvread(['console/ndiff_' file_base 'Solve.csv']);
    end
    if do_iqs 
        tab(:,6) = abs(p_iqs'-p_baseline)/p_baseline; 
        tab(:,7) = st_iqs;
        tab(:,8) = csvread(['console/iqs_' file_base 'Solve.csv']);
    end
    if do_iqspc
        tab(:,9) = abs(p_iqspc-p_baseline)/p_baseline; 
        tab(:,10)  = st_iqspc;
        tab(:,11) = csvread(['console/iqspc_' file_base 'Solve.csv']);
    end
    tab_TWIGL = tab
    
    tab = zeros(num_tests+1,11);
    for i=1:num_tests+1, tab(i,1)=i; end
    tab(:,2) = e_max';
    if do_bf2
        tab(:,3) = abs(p_bf2-p_baseline)/p_baseline;
        tab(:,4) = st_bf2;
        tab(:,5) = csvread(['console/ndiff2_' file_base 'Solve.csv']);
    end
    if do_iqs2
        tab(:,6) = abs(p_iqs2'-p_baseline)/p_baseline; 
        tab(:,7) = st_iqs2;
        tab(:,8) = csvread(['console/iqs2_' file_base 'Solve.csv']);
    end
    if do_iqspc2
        tab(:,9) = abs(p_iqspc2-p_baseline)/p_baseline; 
        tab(:,10)  = st_iqspc2;
        tab(:,11) = csvread(['console/iqspc2_' file_base 'Solve.csv']);
    end
    tab2_TWIGL = tab
end

if do_LRA
    clear p_iqspc st_iqspc p_bf st_bf
    file_base = 'lra_DT2_';
    % eig = 0.9963786965;
    eig = 1.0;
    time = 3.0;
    tend = 3.0;
    fac = time/tend;

    baseline_name = ['lra_baseline2.csv'];
%     baseline_name = ['iqspc_lra_05.csv'];  
    if plot_dt
        fig = fig+1;
    end
    [p_baseline] = csv_reader_LRA(baseline_name,eig,time,fig,true,plot_dt);

    for i=1:num_tests-1
        fprintf('%d/%d\n',i,num_tests)
        if i<10
            num = ['0' num2str(i)];
        else
            num = num2str(i);
        end        
        if do_iqspc
            filename = ['iqspc_' file_base num '.csv']
            if plot_dt
                fig = fig+1;
            end
            [p_iqspc(i+1),dt(i+1),st_iqspc(i+1)] = csv_reader_LRA(filename,eig,time,fig,2,plot_dt);
        end

        if do_bf
            filename = ['ndiff_' file_base num '.csv'];
            if plot_dt
                fig = fig+1;
            end
            [p_bf(i+1),dt(i+1),st_bf(i+1)]  = csv_reader_LRA(filename,eig,time,fig,3,plot_dt);
        end

    end
    tab = zeros(num_tests,8);
    for i=1:num_tests, tab(i,1)=i; end
    tab(:,2) = e_max(1:end-1)';
    if do_bf
        tab(:,3) = abs(p_bf-p_baseline)/p_baseline;
        tab(:,4) = st_bf;
        tab(:,5) = csvread(['console/ndiff_' file_base 'Solve.csv']);
    end
    if do_iqspc
        tab(:,6) = abs(p_iqspc-p_baseline)/p_baseline; 
        tab(:,7)  = st_iqspc;
        tab(:,8) = csvread(['console/iqspc_' file_base 'Solve.csv']);
    end
    tab_LRA = tab
end