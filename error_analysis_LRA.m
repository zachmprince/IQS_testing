clear; clc; %close all;
holdon = ~isempty(findall(0,'Type','Figure'));

num_tests = 4;
plot_dt=false;

folder = [];
% folder = 'mp_update_1D/';
folder = 'dt2_lra/test_';
file_base = 'lra_';
% eig = 0.9963786965;
eig = 1.0;
time = 1.36;
tend = 3.0;
fac = time/tend;

fig=0;

baseline_name = [folder 'ndiff_lra_07.csv'];
% baseline_name = [file_base 'baseline2.csv'];
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
    
    filename = [folder 'iqs_' file_base num '.csv']
    if plot_dt
%         fig = fig+1;
    end
    [p_iqs(i+1),dt(i+1)] = csv_reader_LRA(filename,eig,time,fig,1,plot_dt);
    
    filename = [folder 'iqspc_' file_base num '.csv']
    if plot_dt
%         fig = fig+1;
    end
    [p_iqspc(i+1),dt(i+1)] = csv_reader_LRA(filename,eig,time,fig,2,plot_dt);

    filename = [folder 'ndiff_' file_base num '.csv']
    if plot_dt
%         fig = fig+1;
    end
    [p_bf(i+1),dt(i+1)]  = csv_reader_LRA(filename,eig,time,fig,3,plot_dt);
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
slope_iqs = polyfit(log10(dt),log10(e_iqs),1);
e_iqspc = abs(p_iqspc-p_baseline)/p_baseline;
slope_iqspc = polyfit(log10(dt),log10(e_iqspc),1);
e_bf = abs(p_bf-p_baseline)/p_baseline;
slope_bf = polyfit(log10(dt),log10(e_bf),1);

% % % dt 1st Order
fig = fig+1;
figure(fig)
if holdon
    hold on
end
loglog(dt,e_iqs,'o-',dt,e_iqspc,'o-',dt,e_bf,'o-')
xlabel('\Delta t'); ylabel('Error'); %title('Error vs. (\Delta t)')
legend(['IQS, slope=' num2str(slope_iqs(1))],['IQS P-C, slope=' num2str(slope_iqspc(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
grid on
hold off
saveas(gcf,['plots/' file_base 'dt1.jpg'])

% % % % Diff 1st Order
% fig = fig+1;
% figure(fig)
% loglog(diff_iqs*fac,e_iqs,'.-',diff_iqspc*fac,e_iqspc,'.-',diff_bf,e_bf,'.-')
% xlabel('# Diffusion Solves'); ylabel('Error'); title('Diffusion Solves')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'diff.jpg'])
% 
% % % % Linear 1st Order
% fig = fig+1;
% figure(fig)
% loglog(l_iqs*fac,e_iqs,'.-',l_iqspc*fac,e_iqspc,'.-',l_bf*fac,e_bf,'.-')
% xlabel('# Linear Iterations'); ylabel('Error'); title('Linear Iterations')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'lin1.jpg'])
% 
% % % % Nonlinear 1st Order
% fig = fig+1;
% figure(fig)
% loglog(nl_iqs*fac,e_iqs,'.-',nl_iqspc*fac,e_iqspc,'.-',nl_bf*fac,e_bf,'.-')
% xlabel('# Nonlinear Iterations'); ylabel('Error'); title('Nonlinear Iterations')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'nlin.jpg'])



