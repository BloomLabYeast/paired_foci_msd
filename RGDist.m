function AvgDistRG = RGDist(input_dir, pattern1, pattern2)
%%RGDist finds the distance between foci from x and y coords provided by
%coord_mat using the pythagorean theorem (a^2 + b^2 = c^2). 
%
%   input: 
%       input_dir: A character array that specifies the directory to be
%       parsed for csv-files.
%       
%       pattern1: A character array that specifies the names of the files
%       to parse, i.e. '*GFP.csv'. Note, pattern1 files should pair with
%       pattern2 files.
%
%       pattern2: A character array that specifies the names of the files
%       to parse, i.e. '*RFP.csv'. Note, pattern2 files should pair with
%       pattern1 files.
%
%   output :
%       AvgDistRG: A value depicting the average distance between
%       all tracked foci. 
%       
paired_cell = csv_pair(input_dir, pattern1, pattern2);
coord_mat = parse_csv_pair(input_dir, paired_cell);
coord_mat (:,2,:) = []
coord_matx = coord_mat
coord_mat = parse_csv_pair(input_dir, paired_cell);
coord_mat (:,1,:) = []
coord_maty = coord_mat
for i = 1:size(coord_mat, 3)
    DistRG = sqrt(coord_matx(:,1,i).^2 + (coord_maty(:,1,i)).^2)
end
avgDistRG = avg(DistRG)
