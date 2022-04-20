function mean_plot_msd = mean_msd_plot(i_msd_mat,title_msd)

%find mean msd and scale pixel to micron
mean_mat = mean(i_msd_mat);
scale_mat = mean_mat*0.065*0.065;

%plot scaled mean msd matrix, add title, and label and scale axes
plot(scale_mat)
title(title_msd) 
xlabel('\tau (s)')
ylabel('MSD (\mum^2)')
%NOTE: y axis must be the same to compare data
ylim([0,1.5])

%convert xticklabels to seconds
xticks = get(gca,'xtick') ;
scaling  = 30 ;
newlabels = arrayfun(@(x) sprintf('%.1f', scaling * x), xticks, 'un', 0);
set(gca,'xticklabel',newlabels)