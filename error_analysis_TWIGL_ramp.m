clear; clc; close all;

num_tests = 8;
plot_dt=false;

file_base = 'TWIGL_ramp_';
eig = 0.9132195712;
time = 0.2;
tend = 0.5;
fac = time/tend;

l_bf = [1.30E+03 2.33E+03 4.84E+03 1.35E+04 2.17E+04 3.09E+04 4.69E+04 7.07E+04 9.16E+04 1.31E+05 2.18E+05];
l_bf = l_bf(1:num_tests+1);

p_iqs = zeros(num_tests+1,1); p_bf=p_iqs; p_bf2=p_iqs; p_iqstmp=p_iqs; p_iqs2=p_iqs; p_iqstmp2=p_iqs; dt = p_iqs;
fig=0;

baseline_name = [file_base 'baseline.csv'];
% baseline_name = ['iqs2_TWIGL_ramp_12.csv'];
if plot_dt
    fig = fig+1;
end
[p_baseline,~] = csv_reader(baseline_name,eig,time,fig,true,plot_dt);

for i=0:num_tests
    fprintf('%d/%d\n',i,num_tests)
    if i<10
        num = ['0' num2str(i)];
    else
        num = num2str(i);
    end
    
    filename = ['iqs_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_iqs(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
%     console = ['console/console_iqs_' file_base num '.txt'];
%     [diff_iqs(i+1),l_iqs(i+1),nl_iqs(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');
    
    filename = ['iqs2_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_iqs2(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,1,plot_dt);
%     console = ['console/console_iqs2_' file_base num '.txt'];
%     [diff_iqs2(i+1),l_iqs2(i+1),nl_iqs2(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');
    
    filename = ['iqstmp_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_iqstmp(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
%     console = ['console/console_iqstmp_' file_base num '.txt'];
%     [diff_iqstmp(i+1),l_iqstmp(i+1),nl_iqstmp(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');

    filename = ['iqstmp2_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_iqstmp2(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
%     console = ['console/console_iqstmp2_' file_base num '.txt'];
%     [diff_iqstmp2(i+1),l_iqstmp2(i+1),nl_iqstmp2(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');

    filename = ['ndiff_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_bf(i+1),dt(i+1)]  = csv_reader(filename,eig,time,fig,3',plot_dt);
%     console = ['console/console_ndiff_' file_base num '.txt'];
%     [diff_bf(i+1),l_bf(i+1),nl_bf(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');

    filename = ['ndiff2_' file_base num '.csv'];
    if plot_dt
        fig = fig+1;
    end
    [p_bf2(i+1),dt(i+1)]  = csv_reader(filename,eig,time,fig,3',plot_dt);
%     console = ['console/console_ndiff2_' file_base num '.txt'];
%     [diff_bf2(i+1),l_bf2(i+1),nl_bf2(i+1)] = count_instance(console,'Solve ','Linear ','Nonlinear ');

end

diff_iqs = csvread(['console/iqs_' file_base 'Solve.csv']); diff_iqs = diff_iqs(1:num_tests+1);
l_iqs = csvread(['console/iqs_' file_base 'Linear.csv']); l_iqs = l_iqs(1:num_tests+1);
nl_iqs = csvread(['console/iqs_' file_base 'Nonlinear.csv']); nl_iqs = nl_iqs(1:num_tests+1);
diff_iqs2 = csvread(['console/iqs2_' file_base 'Solve.csv']); diff_iqs2 = diff_iqs2(1:num_tests+1);
l_iqs2 = csvread(['console/iqs2_' file_base 'Linear.csv']); l_iqs2 = l_iqs2(1:num_tests+1);
nl_iqs2 = csvread(['console/iqs2_' file_base 'Nonlinear.csv']); nl_iqs2 = nl_iqs2(1:num_tests+1);
diff_iqstmp = csvread(['console/iqstmp_' file_base 'Solve.csv']); diff_iqstmp = diff_iqstmp(1:num_tests+1);
l_iqstmp = csvread(['console/iqstmp_' file_base 'Linear.csv']); l_iqstmp = l_iqstmp(1:num_tests+1);
nl_iqstmp = csvread(['console/iqstmp_' file_base 'Nonlinear.csv']); nl_iqstmp = nl_iqstmp(1:num_tests+1);
diff_iqstmp2 = csvread(['console/iqstmp2_' file_base 'Solve.csv']); diff_iqstmp2 = diff_iqstmp2(1:num_tests+1);
l_iqstmp2 = csvread(['console/iqstmp2_' file_base 'Linear.csv']); l_iqstmp2 = l_iqstmp2(1:num_tests+1);
nl_iqstmp2 = csvread(['console/iqstmp2_' file_base 'Nonlinear.csv']); nl_iqstmp2 = nl_iqstmp2(1:num_tests+1);
diff_bf = csvread(['console/ndiff_' file_base 'Solve.csv']); diff_bf = diff_bf(1:num_tests+1);
l_bf = csvread(['console/ndiff_' file_base 'Linear.csv']); l_bf = l_bf(1:num_tests+1);
nl_bf = csvread(['console/ndiff_' file_base 'Nonlinear.csv']); nl_bf = nl_bf(1:num_tests+1);
diff_bf2 = csvread(['console/ndiff2_' file_base 'Solve.csv']); diff_bf2 = diff_bf2(1:num_tests+1);
l_bf2 = csvread(['console/ndiff2_' file_base 'Linear.csv']); l_bf2 = l_bf2(1:num_tests+1);
nl_bf2 = csvread(['console/ndiff2_' file_base 'Nonlinear.csv']); nl_bf2 = nl_bf2(1:num_tests+1);

e_iqs = abs(p_iqs-p_baseline)/p_baseline;
slope_iqs = polyfit(log10(dt(3:end)),log10(e_iqs(3:end)),1);
e_iqstmp = abs(p_iqstmp-p_baseline)/p_baseline;
slope_iqstmp = polyfit(log10(dt(6:end)),log10(e_iqstmp(6:end)),1);
e_bf = abs(p_bf-p_baseline)/p_baseline;
slope_bf = polyfit(log10(dt(3:end)),log10(e_bf(3:end)),1);
e_iqs2 = abs(p_iqs2-p_baseline)/p_baseline;
slope_iqs2 = polyfit(log10(dt(3:end-3)),log10(e_iqs2(3:end-3)),1);
e_iqstmp2 = abs(p_iqstmp2-p_baseline)/p_baseline;
slope_iqstmp2 = polyfit(log10(dt(3:end-3)),log10(e_iqstmp2(3:end-3)),1);
e_bf2 = abs(p_bf2-p_baseline)/p_baseline;
slope_bf2 = polyfit(log10(dt(3:end-3)),log10(e_bf2(3:end-3)),1);

% % % % dt 1st Order
% fig = fig+1;
% figure(fig)
% loglog(dt,e_iqs,'o-',dt,e_iqstmp,'o-',dt,e_bf,'o-')
% xlabel('\Delta t'); ylabel('Error'); title('1st Order (\Delta t)')
% legend(['IQS, slope=' num2str(slope_iqs(1))],['IQS P-C, slope=' num2str(slope_iqstmp(1))],['Brute Force, slope=' num2str(slope_bf(1))],'Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'dt1.jpg'])
% 
% % % % dt 2nd Order
% fig = fig+1;
% figure(fig)
% loglog(dt,e_iqs2,'o-',dt,e_iqstmp2,'o-',dt,e_bf2,'o-')
% xlabel('\Delta t'); ylabel('Error'); title('2nd Order (\Delta t)')
% legend(['IQS, slope=' num2str(slope_iqs2(1))],['IQS P-C, slope=' num2str(slope_iqstmp2(1))],['Brute Force, slope=' num2str(slope_bf2(1))],'Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'dt2.jpg'])
% 
% % % % Diff 1st Order
% fig = fig+1;
% figure(fig)
% loglog(diff_iqs*fac,e_iqs,'.-',diff_iqstmp*fac,e_iqstmp,'.-',diff_bf,e_bf,'.-')
% xlabel('# Diffusion Solves'); ylabel('Error'); title('1st Order Diffusion Solves')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'diff.jpg'])
% 
% % % % Diff 2nd Order
% fig = fig+1;
% figure(fig)
% loglog(diff_iqs2*fac,e_iqs2,'.-',diff_iqstmp2*fac,e_iqstmp2,'.-',diff_bf2*fac,e_bf2,'.-')
% xlabel('# Diffusion Solves'); ylabel('Error'); title('2nd Order Diffusion Solves')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'diff2.jpg'])

% % % dt both Order
fig = fig+1;
figure(fig)
loglog(dt,e_iqs,'ro-',dt,e_iqstmp,'bo-',dt,e_bf,'ko-',dt,e_iqs2,'r.-',dt,e_iqstmp2,'b.-',dt,e_bf2,'k.-')
xlabel('\Delta t'); ylabel('Error'); title('Error vs. \Delta t')
legend(['IQS IE, slope=' num2str(slope_iqs(1))],['IQS P-C IE, slope=' num2str(slope_iqstmp(1))],['Brute Force IE, slope=' num2str(slope_bf(1))],...
        ['IQS BDF2, slope=' num2str(slope_iqs2(1))],['IQS P-C BDF2, slope=' num2str(slope_iqstmp2(1))],['Brute Force BDF2, slope=' num2str(slope_bf2(1))],'Location','Best')
grid on
saveas(gcf,['plots/' file_base 'dt.jpg'])

% % % % Linear 1st Order
% fig = fig+1;
% figure(fig)
% loglog(l_iqs*fac,e_iqs,'.-',l_iqstmp*fac,e_iqstmp,'.-',l_bf*fac,e_bf,'.-')
% xlabel('# Linear Iterations'); ylabel('Error'); title('Error vs. # Linear Iterations (IE Scheme)')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'lin1.jpg'])
% 
% % % % Linear 2nd Order
% fig = fig+1;
% figure(fig)
% loglog(l_iqs2*fac,e_iqs2,'.-',l_iqstmp2*fac,e_iqstmp2,'.-',l_bf2*fac,e_bf2,'.-')
% xlabel('# Linear Iterations'); ylabel('Error'); title('Error vs. # Linear Iterations (BDF2 Scheme)')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'lin2.jpg'])

% % % Linear Both Order
fig = fig+1;
figure(fig)
loglog(l_iqs*fac,e_iqs,'ro-',l_iqstmp*fac,e_iqstmp,'bo-',l_bf*fac,e_bf,'ko-',l_iqs2(1:end-2)*fac,e_iqs2(1:end-2),'r.-',l_iqstmp2(1:end-2)*fac,e_iqstmp2(1:end-2),'b.-',l_bf2(1:end-2)*fac,e_bf2(1:end-2),'k.-')
xlabel('# Linear Iterations'); ylabel('Error'); title('Error vs. # Linear Iterations')
legend('IQS IE','IQS P-C IE','Brute force IE','IQS BDF2','IQS P-C BDF2','Brute force BDF2','Location','Best')
grid on
saveas(gcf,['plots/' file_base 'lin.jpg'])

% % % % Nonlinear 1st Order
% fig = fig+1;
% figure(fig)
% loglog(nl_iqs*fac,e_iqs,'.-',nl_iqstmp*fac,e_iqstmp,'.-',nl_bf*fac,e_bf,'.-')
% xlabel('# Nonlinear Iterations'); ylabel('Error'); title('1st Order Nonlinear Iterations')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'nlin.jpg'])
% 
% % % % Nonlinear 2nd Order
% fig = fig+1;
% figure(fig)
% loglog(nl_iqs2*fac,e_iqs2,'.-',nl_iqstmp2*fac,e_iqstmp2,'.-',nl_bf2*fac,e_bf2,'.-')
% xlabel('# Nonlinear Iterations'); ylabel('Error'); title('2nd Order Nonlinear Iterations')
% legend('IQS','IQS P-C','Brute force','Location','Best')
% grid on
% saveas(gcf,['plots/' file_base 'nlin2.jpg'])
