function stat_coord_mat = batch_msd_scatter(input_dir, pattern1, pattern2,cellstage)
%%batch_msd calculates the msd for paired foci
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
%   output :
%       msd_mat : A 2D matrix where each row represents an individual
%       timelapse and each column represents a tau, starting with a tau of
%       one timepoint. 
%       
paired_cell = csv_pair(input_dir, pattern1, pattern2);
coord_mat = parse_csv_pair_scatter(input_dir, paired_cell,cellstage);
stat_coord_mat = calc_mean_var(coord_mat);
