clear; clc; close all;

num_tests = 10;

file_base = '1D_';
eig = 0.9999439186;
time = 1.1;
diff_solves_iqs = [];
linear_its_iqs = [4415 5819 7348 9419 12840 18218 25910 37355 49132 85659 151186]*1.1/2;
diff_solves_bf = [];
linear_its_bf = [822 1149 1600 2240 3234 4766 7308 11584 17434 32015 57374];

p_iqs = zeros(num_tests+1,1); p_bf  = p_iqs; dt = p_iqs;
fig=1;

baseline_name = [file_base 'baseline.csv'];
[p_baseline,~] = csv_reader(baseline_name,eig,time,fig,true);

for i=0:num_tests
    if i<10
        num = ['0' num2str(i)];
    else
        num = num2str(i);
    end
    
    filename = ['iqs_' file_base num '.csv'];
    fig = fig+1;
    [p_iqs(i+1),dt(i+1)] = csv_reader(filename,eig,time,fig,true);
    
    filename = ['ndiff_' file_base num '.csv'];
    fig = fig+1;
    [p_bf(i+1),dt(i+1)]  = csv_reader(filename,eig,time,fig,false);
end

e_iqs = abs(p_iqs-p_baseline)/p_baseline;
e_bf = abs(p_bf-p_baseline)/p_baseline;

fig = fig+1;
loglog(dt,e_iqs,'o-',dt,e_bf,'o-')
xlabel('\Delta t'); ylabel('Error'); title('\Delta t')
legend('IQS','Brute force')

if not(isempty(diff_solves_iqs))
    fig = fig+1;
    loglog(diff_solves_iqs,e_iqs,'.-',diff_solves_bf,e_bf,'.-')
    xlabel('# Diffustion Solves'); ylabel('Error'); title('Diffusion Solves')
    legend('IQS','Brute force')
end

if not(isempty(linear_its_iqs))
    fig = fig+1;
    loglog(linear_its_iqs,e_iqs,'.-',linear_its_bf,e_bf,'.-')
    xlabel('# Linear Iterations'); ylabel('Error'); title('Linear Iterations')
    legend('IQS','Brute force')
end
