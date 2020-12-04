function paired_cell = csv_pair(input_dir, pattern1, pattern2)
%%csv_pair Parses all the csv files in a given directory and pairs them.
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
%       paired_cell : A 2D cell array containing the names of the
%       csv-files. Each column in a type of CSV files and each row is a
%       pair.

pattern1_files = dir(fullfile(input_dir, pattern1));
pattern2_files = dir(fullfile(input_dir, pattern2));

if numel(pattern1_files) ~= numel(pattern2_files)
    error('Number of files specified by pattern1 and pattern2 are different!');
end

if contains(pattern1, '*')
    pattern1_length = length(pattern1)-1;
else
    pattern1_length = length(pattern1);
end

if contains(pattern2, '*')
    pattern2_length = length(pattern2)-1;
else
    pattern2_length = length(pattern2);
end

pattern1_names = {pattern1_files.name};
pattern1_basenames = cellfun(@(x) x(1:end-pattern1_length), pattern1_names, 'UniformOutput', false);
pattern2_names = {pattern2_files.name};
pattern2_basenames = cellfun(@(x) x(1:end-pattern2_length), pattern2_names, 'UniformOutput', false);


for i = 1:numel(pattern1_basenames)
    basename = pattern1_basenames{i};
    result_mat = cellfun(@(x) strcmp(basename, x), pattern2_basenames);
    if sum(result_mat) ~= 1
        error('%s does not have a paired csv-file!', pattern1_files(i).name);
    end
    paired_cell{i,1} = pattern1_files(i).name;
    paired_cell{i,2} = pattern2_files(result_mat).name;
end

