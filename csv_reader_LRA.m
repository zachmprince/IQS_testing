function [v,dt] = csv_reader_LRA(filename,eig,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
% t = [0 ; t];
dt = t(3)-t(2);

T = M(1:end,2);
switch type
    case 1
        P = M(1:end,end) .* M(1:end,2) / eig;
        T = M(1:end,3);
        fig_name = ['IQS, dt = ' num2str(dt,'%g')];
        sym = 's-'; 
    case 2
        P = M(1:end,3) / eig;
        fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
        sym = 'd-';
    case 3
        P = M(1:end,3) / eig;
        fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
        sym = 'o-';
    case 4
        P = M(1:end,3) / eig;
        fig_name = 'Baseline';
        sym = 'k-';
end
P(1) = 1e-6;
T(1) = 300;

if plot_fig
    figure(fig)
    hold on
    plot(t,log10(P),sym)
%     plot(t,P)
    xlabel('time (s)'); ylabel('log_{10}(Average Power (W/cm^3))');% title('Power');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    hold off
    figure(fig+100)
    hold on
    plot(t,T,sym)
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
% 
% if plot_fig
%     figid = figure(fig);
%     set(figid,'Position',[100,100,800,500])
%     Pline = line(t,log10(P),'Color','b');
%     ax1 = gca;
%     ax1.XColor = 'k';
%     ax1.YColor = 'b';
%     ax1.YLabel.String = 'log_{10}(Average Power (W/cm^3))';
%     ax1_xlim = ax1.XLim;
%     ax1_ylim = ax1.YLim;
% 
%     ax1_pos = ax1.Position;
%     ax2 = axes('Position',ax1_pos,'YAxisLocation','right','Color','none');
%     ax2.YColor = 'r';
%     ax2.XLabel.String = 'time (s)';
%     ax2.YLabel.String = 'Temperature (K)';
%     Tline = line(t,T,'Parent',ax2,'Color','r');
%     ax2_ylim = ax2.YLim;
% 
%     mfac = 20;
%     mov(1:length(t)/mfac) = struct('cdata',[], 'colormap',[]);
%     set(Pline,'Visible','off')
%     set(Tline,'Visible','off')
%     set(ax1,'XLim',ax1_xlim)
%     set(ax1,'YLim',[-6 ax1_ylim(2)])
%     set(ax2,'XLim',ax1_xlim)
%     set(ax2,'YLim',ax2_ylim)
%     
%     for i=1:length(t)/mfac
%         line(t(1:i*mfac),log10(P(1:i*mfac)),'Parent',ax1,'Color','b')
%         line(t(1:i*mfac),T(1:i*mfac),'Parent',ax2,'Color','r')
%         mov(i) = getframe(figid);
% %         close all;
%     end
%     movie2avi(mov, 'LRA_power_profile.avi', 'compression','None', 'fps',round(length(t)/mfac/10));  
%         
% end

for i=1:length(t)
    if abs(time-t(i))<(dt/10)
        v = P(i);
%         v(2) = T(i);
    end
end
[power_max,index_max]=max(P);
time_max = t(index_max)
power_max

% tt = [0.4 0.8 1.2 1.4 2.0 3.0];
% for j=1:length(tt)
%     for i=1:length(t)
%         if abs(tt(j)-t(i))<(dt/10)
%             PP(j) = P(i);
%             TT(j) = T(i);
%             i=length(t);
%         end
%     end
% end
    
