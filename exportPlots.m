function [] = exportPlots(dir, fname)
addpath('export_fig');
cdir = pwd;

dir = [cdir, dir];

fontsize = 18;

axs=get(gcf,'Children');
for i=1:length(axs)
    try
    set(axs(i),'Fontsize',fontsize,'Linewidth',2);
    %set(axs(i),'Color','none')
    lns=get(axs(i),'Children');
    for j=1:length(lns)
        set(axs(i),'Fontsize',fontsize,'Linewidth',2)
        set(get(axs(i),'xlabel'),'Fontsize',fontsize)
        set(get(axs(i),'ylabel'),'Fontsize',fontsize)
    end
    catch ME
        %disp('catched me an error');
    end
end
    
    

    set(gcf, 'Color', 'none');
    set(gcf, 'Position', [100 600 750 500]);
    %set(gcf, 'Position', [100 600 375 250]);
    
    box on
    
    
    export_fig([dir fname], '-pdf'); %varargin
    