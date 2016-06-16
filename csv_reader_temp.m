function [v,dt] = csv_reader_temp(filename,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
t = [0 ; t];
dt = t(3)-t(2);

T = M(1:end,3);
switch type
    case 1
        fig_name = ['IQS, dt = ' num2str(dt,'%g')];
    case 2
        fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
    otherwise
        fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
end

T = [300 ; T];

if plot_fig
    hold on
    figure(fig)
    plot(t,T)
    xlabel('time'); ylabel('Average Temperature (K)'); title('Temperature');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
end

for i=1:length(t)
    if abs(time-t(i))<(dt/4)
        v = T(i);
    end
end

