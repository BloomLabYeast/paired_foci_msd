function plot_all_msd = all_msd_plot(msd_mat,cellstage)
%
%   inputs :
%       msd_mat : A 2D matrix where each row represents an individual
%       timelapse and each column represents a tau, starting with a tau of
%       one timepoint.
%
%   ouput :
%       plot_all_msd : A figure of all MSD values for each cell/paired
%       foci.

%transpose to plot individual cells rather than every cell at same
%timepoint (check timescale)
transpose_mat = msd_mat';
scale_mat = transpose_mat*0.065*0.065;
for ii = 1:size(msd_mat,1)
%w = waitforbuttonpress;
plot_all_msd = plot(scale_mat(:,ii));
hold on;
ylim([0,5]);
title([ cellstage ' cells n = ',sprintf('%d',ii),])
end

xlabel('\tau (s)')
ylabel('MSD (\mum^2)')
%ylim([0,4])

%convert xticklabels to seconds
xticks = get(gca,'xtick') ;
scaling  = 30 ;
newlabels = arrayfun(@(x) sprintf('%.1f', scaling * x), xticks, 'un', 0);
set(gca,'xticklabel',newlabels)

