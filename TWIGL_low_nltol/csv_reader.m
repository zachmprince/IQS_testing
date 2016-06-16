function [v,dt] = csv_reader(filename,eig,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
t = [0 ; t];
dt = t(3)-t(2);

if type==1
    P = M(1:end,end) .* M(1:end,2) / eig;
    fig_name = ['IQS, dt = ' num2str(dt,'%g')];
elseif type==2
    P = M(1:end,end) / eig;
    fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
else
    P = M(1:end,end) / eig;
    fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
end

P = [1.0 ; P];

if plot_fig
figure(fig)
plot(t,P)
xlabel('time'); ylabel('Relative Power'); title(fig_name);
end

for i=1:length(t)
    if abs(time-t(i))<(dt/2)
        v = P(i);
    end
end

