function msd_mat = calc_paired_msd(coord_mat)
%%calc_paired_msd Calculated MSD for subtracted coordinates in coord_mat.
%
%   inputs :
%       coord_mat : A 3D matrix where each row represents a time point and
%       each column represents the x and y dimension respectively, the
%       third dimension represents an individual timelapse of a yeast cell.
%
%   ouput :
%       msd_mat : A 2D matrix where each row represents an individual
%       timelapse and each column represents a tau, starting with a tau of
%       one timepoint. 

for i = 1:size(coord_mat, 3)
    for tau = 1:size(coord_mat, 1)-1
        sub_coords = coord_mat(1+tau:end, :, i) - coord_mat(1:end-tau, :, i);
        dist_sq = sum(sub_coords.^2, 2);
        msd_mat(i,tau) = mean(dist_sq);
    end
end