clear; clc; close all;
holdon = ~isempty(findall(0,'Type','Figure'));

num_tests = 5;
plot_dt=false;

folder = 'test_';
file_base = 'lra_';
% eig = 0.9963786965;
eig = 1.0;
time = 1.35;
tend = 3.0;
fac = time/tend;

fig=0;

baseline_name = ['test_lra_baseline.csv'];
if plot_dt
    fig = fig+1;
end
[p_baseline,~] = csv_reader_LRA(baseline_name,eig,time,fig,4,plot_dt);

for i=0:num_tests
    if i<10
        num = ['0' num2str(i)];
    else
        num = num2str(i);
    end
    
    filename = [folder 'iqs_' file_base num '.csv'];
    if plot_dt
%         fig = fig+1;
    end
    [p_iqs(i+1),dtiqs(i+1),rtiqs(i+1)] = csv_reader_LRA(filename,eig,time,fig,1,plot_dt);
    
    filename = [folder 'iqspc_' file_base num '.csv'];
    if plot_dt
%         fig = fig+1;
    end
%     [p_iqspc(i+1),dt(i+1)] = csv_reader_LRA(filename,eig,time,fig,2,plot_dt);

    filename = [folder 'ndiff_' file_base num '.csv'];
    if plot_dt
%         fig = fig+1;
    end
    [p_bf(i+1),dtbf(i+1),rtbf(i+1)]  = csv_reader_LRA(filename,eig,time,fig,3,plot_dt);
end

% diff_iqs = csvread(['console/iqs_' file_base 'Solve.csv']);
% l_iqs = csvread(['console/iqs_' file_base 'Linear.csv']);
% nl_iqs = csvread(['console/iqs_' file_base 'Nonlinear.csv']);
% diff_iqspc = csvread(['console/iqspc_' file_base 'Solve.csv']);
% l_iqspc = csvread(['console/iqspc_' file_base 'Linear.csv']);
% nl_iqspc = csvread(['console/iqspc_' file_base 'Nonlinear.csv']);
% diff_bf = csvread(['console/ndiff_' file_base 'Solve.csv']);
% l_bf = csvread(['console/ndiff_' file_base 'Linear.csv']);
% nl_bf = csvread(['console/ndiff_' file_base 'Nonlinear.csv']);

e_iqs = abs(p_iqs-p_baseline)/p_baseline;
slope_iqs = polyfit(log10(dtiqs),log10(e_iqs),1);
% e_iqspc = abs(p_iqspc-p_baseline)/p_baseline;
% slope_iqspc = polyfit(log10(dt),log10(e_iqspc),1);
e_bf = abs(p_bf-p_baseline)/p_baseline;
slope_bf = polyfit(log10(dtbf),log10(e_bf),1);

% % % dt
fig = fig+1;
figure(fig)
if holdon
    hold on
end
% loglog(dt,e_iqs,'o-',dt,e_iqspc,'o-',dt,e_bf,'o-')
loglog(dtiqs,e_iqs,'o-',dtbf,e_bf,'o-')
xlabel('\Delta t'); ylabel('Error'); %title('Error vs. (\Delta t)')
% legend(['IQS, slope=' num2str(slope_iqs(1))],['IQS P-C, slope=' num2str(slope_iqspc(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
legend(['IQS, slope=' num2str(slope_iqs(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
grid on
hold off

% % % runtime
fig = fig+1;
figure(fig)
if holdon
    hold on
end
% loglog(dtiqs,e_iqs,'o-',rtiqspc,e_iqspc,'o-',dtbf,e_bf,'o-')
loglog(rtiqs,e_iqs,'o-',rtbf,e_bf,'o-')
xlabel('Runtime (s)'); ylabel('Error'); %title('Error vs. (\Delta t)')
% legend(['IQS, slope=' num2str(slope_iqs(1))],['IQS P-C, slope=' num2str(slope_iqspc(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
legend(['IQS, slope=' num2str(slope_iqs(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
grid on
hold off

