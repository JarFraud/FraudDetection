%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dater_reader: the function for reading fraud data in csv format %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [data] = data_reader(data_path, data_type, year_start, year_end)
temp = csvread(data_path, 1, 0); % read csv data starting from row 1 (second), column 0 (first).
switch data_type
    case 'default' % read data in the default format: (year, firm, label, features)
        data.years = temp(:, 1);
        idx = data.years>=year_start & data.years<=year_end;
        data.years = temp(idx, 1);
        data.firms = temp(idx, 2);
        data.labels = temp(idx, 3);
        data.features = temp(idx,4:end);
        data.num_obervations = size(data.features,1);
        data.num_features = size(data.features,2);
    case 'uscecchini28' % read data with 28 uscecchini raw variables as features
        data.years = temp(:, 1);
        idx = data.years>=year_start & data.years<=year_end;
        data.years = temp(idx, 1);
        data.firms = temp(idx, 2);
        data.sics = temp(idx, 3);
        data.insbnks = temp(idx, 4);
        data.understatements = temp(idx, 5);
        data.options = temp(idx, 6);
        data.paaers = temp(idx, 7);
        data.newpaaers = temp(idx, 8);
        data.labels = temp(idx, 9);
        data.features = temp(idx,10:37);
        data.num_obervations = size(data.features,1);
        data.num_features = size(data.features,2);
    case 'uscecchini28_normalized' % read data with 28 normalized uscecchini raw variables as features
        data.years = temp(:, 1);
        idx = data.years>=year_start & data.years<=year_end;
        data.years = temp(idx, 1);
        data.firms = temp(idx, 2);
        data.sics = temp(idx, 3);
        data.insbnks = temp(idx, 4);
        data.understatements = temp(idx, 5);
        data.options = temp(idx, 6);
        data.paaers = temp(idx, 7);
        data.newpaaers = temp(idx, 8);
        data.labels = temp(idx, 9);
        data.features = temp(idx,10:37);
        for i = 1:size(data.features, 1)
            data.features(i, :) = data.features(i, :)/norm(data.features(i, :));
        end
        data.num_obervations = size(data.features,1);
        data.num_features = size(data.features,2);
    case 'usdechow14' % read data with 14 usdechow ratio variables as features
        data.years = temp(:, 1);
        idx = data.years>=year_start & data.years<=year_end;
        data.years = temp(idx, 1);
        data.firms = temp(idx, 2);
        data.sics = temp(idx, 3);
        data.insbnks = temp(idx, 4);
        data.understatements = temp(idx, 5);
        data.options = temp(idx, 6);
        data.paaers = temp(idx, 7);
        data.newpaaers = temp(idx, 8);
        data.labels = temp(idx, 9);
        data.features = temp(idx,10+28:end);
        data.num_obervations = size(data.features,1);
        data.num_features = size(data.features,2);
    otherwise
        disp('Error: unsupported data format!');
end

fprintf('Data Loaded: %s, %d features, %d observations (%d pos, %d neg)\n',data_path, data.num_features, data.num_obervations, sum(data.labels==1), sum(data.labels==0));

end
