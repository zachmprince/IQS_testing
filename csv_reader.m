function [varargout] = csv_reader(filename,eig,time,fig,type,plot_fig)

M = csvread(filename,1,0);

t = M(1:end,1);
dt = t(3)-t(2);

switch type
    case 1
        P = M(1:end,end) .* M(1:end,2) / eig;
        fig_name = ['IQS, dt = ' num2str(dt,'%g')];
        sym = 's-';
    case 2
        P = M(1:end,end) / eig;
        fig_name = ['IQS P-C, dt = ' num2str(dt,'%g')];
        sym = 'd-';
    case 3
        P = M(1:end,end) / eig;
        fig_name = ['Brute Force, dt = ' num2str(dt,'%g')];
        sym = 'o-';
    otherwise
        P = M(1:end,end) / eig;
        fig_name = 'baseline';
        sym = 'k';        
end

if t(1)>0
    t = [0 ; t];
    P = [1.0 ; P];
else
    P(1)=1.0;
end


if plot_fig
    figure(fig)
    hold on
    plot(t,P,sym)
%     orig = line(t,P,'Color','b');
%     ax = gca;
%     ax_xlim = ax.XLim;
%     ax_ylim = ax.YLim;
    xlabel('time (s)'); ylabel('Relative Power'); %title('Power');
    a=get(legend(gca),'String');
    if isempty(a)
        leg = char(fig_name);
    else
        leg = char(char(a),fig_name);
    end
    legend(leg,'Location','Best')
    
%     set(orig,'Visible','off')
%     ax.XLim
%     set(ax,'XLim',ax_xlim,'YLim',ax_ylim)
%     mfac = 8;
%     mov(1:length(t)/mfac) = struct('cdata',[], 'colormap',[]);
%     for i=1:length(t)/mfac
%         line(t(1:i*mfac),P(1:i*mfac),'Parent',ax,'Color','b')
%         mov(i) = getframe(figure(fig));
%         close all;
%     end
%     movie2avi(mov, 'TWIGL_power_profile.avi', 'fps',round(length(t)/mfac/10)); 
hold off
end
for i=1:length(t)
    if abs(time-t(i))<(dt/4)
        v = P(i);
    end
end

varargout{1} = v;
nout = max(nargout,1);
switch nout
    case 2
        varargout{2} = dt;
    case 3
        varargout{2} = dt;
        varargout{3} = length(t);
end
