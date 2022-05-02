function coord_mat = parse_csv_pair_scatter(directory, paired_cell,cellstage)
%%parse_csv_pair_scatter Parse csv file pairs and return subtracted
%%coordinate matrix and a plot of the variance of all distances centered on the mean
%%distance for each cell. 
%
%   input :
%       directory : A character array specifying the location of the files
%       in paired_cell array.
%
%       paired_cell : A 2D cell array containing the names of the
%       csv-files. Each column in a type of CSV files and each row is a
%       pair.
%
%   output :
%       coord_mat : A 3D matrix where each row represents a time point and
%       each column represents the x and y dimension respectively, the
%       third dimension represents an individual timelapse of a yeast cell.
%       
%       figure: variance plot of paired foci distance for all cells
%       with the origin centered on the mean distance for each cell. 
%
%   NOTE : This function assumes the XY coordinates are in columns 5 and 6
%   of the input CSV-files. The column order is set by TrackMate.

for i = 1:size(paired_cell, 1)
    mat1i = readmatrix(fullfile(directory, paired_cell{i,1}));
    mat1i(1,:) = [];
    mat1 = sortrows(mat1i,9);
    xy1 = mat1(:,5:6);
    mat2i = readmatrix(fullfile(directory, paired_cell{i,2}));
    mat2i(1,:) = [];
    mat2 = sortrows(mat2i,9);
    xy2 = mat2(:,5:6);
    coord_mat(:,:,i) = xy1 - xy2;
end
coord_mat = coord_mat*0.065;
figure;
hold on
for ii = 1:i
   %w = waitforbuttonpress;
    scatter(coord_mat(:,1,ii)-mean(coord_mat(:,1,ii)),coord_mat(:,2,ii)-mean(coord_mat(:,2,ii)))
   
   xlim([-2 2])
   ylim([-2 2])
   
  title([ cellstage ' cells n = ',sprintf('%d',ii),])
end
hold off

% subtracting out motion that happens to both RFP and GFP.
% For iterations, 1 through the size of the first dimension of
% paired_cell, readmatrix produces a standard array labeled mat1 with
% standardized file separators for paired_cell: i rows, column 1. Directory
% specifies the directory that the files contained in paired_cell are in. xy1 is a standard array
% produced from all rows from mat1 and columns 5 through 6 from mat 1. The
% same is done for mat2 and xy2 but uses the second column of files
% specified by paired_cell. coord_mat creates a matrix subtracting xy2 from
% xy1, i is used to specify the 3rd dimension of the matrix (each page). 