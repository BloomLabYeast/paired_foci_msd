function plot_mean_msd = mean_msd_plot(msd_mat,cellstage)
%
%   inputs :
%       msd_mat : A 2D matrix where each row represents an individual
%       timelapse and each column represents a tau, starting with a tau of
%       one timepoint.
%
%   ouput :
%       plot_mean_msd : A figure of the mean MSD value for all cells/paired
%       foci.

%find mean msd and scale pixel to micron
mean_mat = mean(msd_mat);
scale_mat = mean_mat*0.065*0.065;

%plot scaled mean msd matrix, add title, and label and scale axes
plot_mean_msd = plot(scale_mat);
for ii = 1:size(msd_mat,1)
title([ cellstage ' cells n = ',sprintf('%d',ii),])
end
xlabel('\tau (s)')
ylabel('MSD (\mum^2)')
%NOTE: y axis must be the same to compare data
ylim([0,1.5])

%convert xticklabels to seconds
xticks = get(gca,'xtick') ;
scaling  = 30 ;
newlabels = arrayfun(@(x) sprintf('%.1f', scaling * x), xticks, 'un', 0);
set(gca,'xticklabel',newlabels)