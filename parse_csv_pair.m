function coord_mat = parse_csv_pair(directory, paired_cell)
%%parse_csv_pair Parse csv file pairs and return subtracted coordinate mat.
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
%       coord_mat : A 3D matrix...
%
%   NOTE : This function assumes the XY coordinates are in columns 5 and 6
%   of the input CSV-files. The column order is set by TrackMate.

for i = 1:size(paired_cell, 1)
    mat1 = readmatrix(fullfile(directory, paired_cell{i,1}));
    xy1 = mat1(:,5:6);
    mat2 = readmatrix(fullfile(directory, paired_cell{i,2}));
    xy2 = mat2(:,5:6);
    coord_mat(:,:,i) = xy1 - xy2;
end
