function [v,dt,rt] = csv_reader_LRA(filename,eig,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
% t = [0 ; t];
dt = t(3)-t(2);
T = M(1:end,3);
rt = M(end,2);
switch type
    case 1
        P = M(1:end,end) .* M(1:end,3) / eig;
        T = M(1:end,4);
        fig_name = ['IQS, dt = ' num2str(dt,'%g')];
        sym = 's-'; 
    case 2
        P = M(1:end,3) / eig;
%         fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
        fig_name = ['IQS P-C, # of steps = ' num2str(length(t),'%d')];
        sym = 'x';
    case 3
        P = M(1:end,end) / eig;
%         fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
        fig_name = ['Brute Force, # of steps = ' num2str(length(t),'%d')];
        sym = 'o';
    case 4
        P = M(1:end,3) / eig;
        fig_name = 'Baseline';
        sym = 'k-';
end
P(1) = 1e-6;
T(1) = 300;

if plot_fig
    holdon = ~isempty(findall(0,'Type','Figure'));
    figure(fig)
    if holdon, hold on; end
%     plot(t,log10(P),sym)
    if type==2
        semilogy(t,P,sym,'MarkerSize',8,'linewidth',2)
    else
        semilogy(t,P,sym)
    end
    grid on
    xlabel('time (s)'); ylabel('Average Power (W/cm^3)');% title('Power');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend({leg},'Location','Best','FontSize',12)
    hold off
    figure(fig+100)
    if holdon, hold on; end
    plot(t,T,sym)
    grid on
    xlabel('time (s)'); ylabel('Average Temperature (K)'); %title('Temperature');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
end

for i=1:length(t)-1
    if time >= t(i) && time <= t(i+1)
        v = (t(i+1)-time)/(t(i+1)-t(i))*P(i) + (time-t(i))/(t(i+1)-t(i))*P(i+1);
        break;
    end
end
