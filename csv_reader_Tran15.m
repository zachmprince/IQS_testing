function [varargout] = csv_reader_Tran15(filename,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
dt = t(3)-t(2);

CR_Boron = M(1:end,2);
int_power = M(1:end,3);
tot_power = M(1:end,4);
T_avg = M(1:end,5);
T_max = M(1:end,6);
switch type
    case 1
        fig_name = ['IQS, dt = ' num2str(dt,'%g')];
        sym = 's-'; 
    case 2
        fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
        sym = '-';
    case 3
        fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
        sym = 'o-';
    case 4
        fig_name = 'Baseline';
        sym = 'k-';
end

if plot_fig
    % Total Power
    figure(fig)
    if (~isempty(findall(0,'Type','Figure')))
        hold on
    end
    semilogy(t,tot_power,sym)
    xlabel('time (s)'); ylabel('Power (W)'); title('Total Power')
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
    % Average Temperature
    figure(fig+100)
    if (~isempty(findall(0,'Type','Figure')))
        hold on
    end
    plot(t,T_avg,sym)
    xlabel('time (s)'); ylabel('Average Temperature (K)'); title('Average Temperature');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
    % Integral Power
    figure(fig+200)
    if (~isempty(findall(0,'Type','Figure')))
        hold on
    end
    semilogy(t,int_power,sym)
    xlabel('time (s)'); ylabel('Integral Power (J)'); title('Integrated Power')
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
    % Max Temperature
    figure(fig+300)
    if (~isempty(findall(0,'Type','Figure')))
        hold on
    end
    plot(t,T_max,sym)
    xlabel('time (s)'); ylabel('Temperature (K)'); title('Maximum Temperature')
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
    % Boron Content
    figure(fig+400)
    if (~isempty(findall(0,'Type','Figure')))
        hold on
    end
    plot(t,CR_Boron,sym)
    xlabel('time (s)'); ylabel('Boron (ppm)'); title('Boron Content')
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
    if abs(time-t(i))<(dt/10)
        v = tot_power(i);
    end
end
stats = zeros(6,1);
% Max power
[stats(2),index_max]=max(tot_power);
stats(1) = t(index_max);
% Max-max temperature
stats(3) = max(T_max);
% Total Energy
stats(4) = int_power(end);
% Max-avg temperature
stats(5) = max(T_avg);
% Minimum Boron
stats(6) = CR_Boron(end);

varargout{1} = v;
nout = max(nargout,1);
switch nout
    case 2
        varargout{2} = dt;
    case 3
        varargout{2} = dt;
        varargout{3} = stats;
end
    
