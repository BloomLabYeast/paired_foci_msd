function stat_coord_mat = batch_plot(input_dir, pattern1, pattern2,cellstage)

%%batch_plot generates plots for the msd for paired foci and calculates the
%%grand mean and mean variance of the distances between GFP and RFP foci
%%for all paired foci within input_dir. 
%
%   input :
%       input_dir : A character array that specifies the directory to be
%       parsed for csv-files.
%
%       pattern1 : A character array that specifies the names of the files
%       to parse, i.e. '*GFP.csv'. Note, pattern1 files should pair with
%       pattern2 files.
%
%       pattern2 : A character array that specifies the names of the files
%       to parse, i.e. '*RFP.csv'. Note, pattern2 files should pair with
%       pattern1 files.
%
%       cellstage: A character string description of the cell cycle stage
%       for the cells being analyzed. 
%
%   output :
%       stat_coord_mat: A double matrix with the mean variance in the first 
%       and the grand mean across all paired foci in the second column.
%       
%       figures: 3 figures depicting individual MSD plots for each cell,
%       mean MSD for all paired foci in input_dir, and the plot of
%       positions across all timepoints centered on the mean distance
%       calculated for each cell. NOT CENTERED ON THE GRAND MEAN. 
%       
paired_cell = csv_pair(input_dir, pattern1, pattern2);
coord_mat = parse_csv_pair_04192022(input_dir, paired_cell);
msd_mat = calc_paired_msd(coord_mat);
plot_all_msd = all_msd_plot(msd_mat,cellstage);
figure()
plot_mean_msd = mean_msd_plot(msd_mat,cellstage);
coord_mat_s = parse_csv_pair_scatter(input_dir, paired_cell,cellstage);
stat_coord_mat = calc_mean_var(coord_mat_s);
