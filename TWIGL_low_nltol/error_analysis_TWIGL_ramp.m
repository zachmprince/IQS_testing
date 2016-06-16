clear; clc; close all;

num_tests = 10;
plot_dt=false;

file_base = 'TWIGL_ramp_';
eig = 0.9132195712;
time = 0.2;
diff_solves_iqs = [];
linear_its_iqs = [];
% linear_its_iqs = [2.97E+02 5.44E+02 1.04E+03 3.10E+03 4.60E+03 8.26E+03 1.46E+04 2.50E+04 3.32E+04 5.69E+04 5.69E+04];
diff_solves_bf = [];
linear_its_bf = [];
% linear_its_bf = [1.30E+03 2.33E+03 4.84E+03 1.35E+04 2.17E+04 3.09E+04 4.69E+04 7.07E+04 9.16E+04 1.31E+05 2.18E+05];

p_iqs = zeros(num_tests+1,1); p_bf  = p_iqs; dt = p_iqs;
fig=0;

baseline_name = [file_base 'baseline.csv'];
if plot_dt
    fig = fig+1;
end
[p_baseline,~] = csv_reader(baseline_name,eig,time,fig,true,plot_dt);

for i=0:num_tests
    if i<10
        num = ['0' num2str(i)];
    else
        num = num2str(i);
    end
    
    filename = ['iqs_' file_base num '.csv']
    if plot_dt
        fig = fig+1;
    end
    [p_iqs(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,true,plot_dt);
    
%     filename = ['iqstmp_' file_base num '.csv'];
%     if plot_dt
%         fig = fig+1;
%     end
%     [p_iqstmp(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,2,plot_dt);
%     
%     filename = ['ndiff_' file_base num '.csv'];
%     if plot_dt
%         fig = fig+1;
%     end
%     [p_bf(i+1),dt(i+1)]  = csv_reader(filename,eig,time,fig,false,plot_dt);
end

e_iqs = abs(p_iqs-p_baseline)/p_baseline;
% e_iqstmp = abs(p_iqstmp-p_baseline)/p_baseline;
% e_bf = abs(p_bf-p_baseline)/p_baseline;

fig = fig+1;
figure(fig)
loglog(dt,e_iqs,'o-')
% loglog(dt,e_iqs,'o-',dt,e_iqstmp,'o-',dt,e_bf,'o-')
xlabel('\Delta t'); ylabel('Error'); title('\Delta t')
% legend('IQS','IQS P-C','Brute force','Location','Best')
grid on

if not(isempty(diff_solves_iqs))
    fig = fig+1;
    figure(fig)
    loglog(diff_solves_iqs,e_iqs,'.-',diff_solves_bf,e_bf,'.-')
    xlabel('# Diffustion Solves'); ylabel('Error'); title('Diffusion Solves')
    legend('IQS','Brute force')
end

if not(isempty(linear_its_iqs))
    fig = fig+1;
    figure(fig)
    loglog(linear_its_iqs,e_iqs,'o-',linear_its_bf,e_bf,'o-')
    xlabel('# Linear Iterations'); ylabel('Error'); title('Linear Iterations')
    legend('IQS','Brute force')
end
