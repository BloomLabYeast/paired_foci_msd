function plot_msd = all_msd_plot(i_msd_mat,title_msd)

%transpose to plot individual cells rather than every cell at same
%timepoint (check timescale)
transpose_mat = i_msd_mat';
scale_mat = transpose_mat*0.065*0.065;

plot(scale_mat)
title(title_msd) 
xlabel('\tau (s)')
ylabel('MSD (\mum^2)')
ylim([0,4])

%convert xticklabels to seconds
xticks = get(gca,'xtick') ;
scaling  = 30 ;
newlabels = arrayfun(@(x) sprintf('%.1f', scaling * x), xticks, 'un', 0);
set(gca,'xticklabel',newlabels)