% script to find features from kinematics data

% ----------------------------
% Author : Atesh Koul
% Italian Institute of technology, Genoa
% ----------------------------

%close all;
%clear all;
clc;

% not removing the first trial values to simplify the list of the columns 
% u can do that as: 
%remove first column of trial values
%Data = Data(:,2:end);


% select the y labels - 2nd column in the origional file

y = Data(:,2);

% choose which columns to use
% the colum names are used as in the origional file so as to keep it simple
% that is the columns that are not used are not eliminated, but not sent to
% the feature selection.
unbin_col = [3 4 5 6 7 35 220 221 242 243 244];
unbin_col_no_aper = [3 4 5 7 35 220 221 242 243 244];
unbin_col_no_aper_no_lug = [3 4 5 7 35 220 221 242];


% first column- trial no. is present
% data has been kept in origional form
% to have a consistant naming of columns through out


% % first all the unbinned columns
% data_unbin = Data(:,unbin_col);
% matrix_unbin = [y data_unbin];
% kinematicsvm(matrix_unbin,'unbin.txt');
% 
% 
% data_unbin_no_aper = Data(:,unbin_col_no_aper);
% matrix_unbin_no_aper = [y data_unbin_no_aper];
% kinematicsvm(matrix_unbin_no_aper,'unbin-no-aper.txt');
% 
% 
% data_unbin_no_aper_no_lug = Data(:,unbin_col_no_aper_no_lug);
% matrix_unbin_no_aper_no_lug = [y data_unbin_no_aper_no_lug];
% kinematicsvm(matrix_unbin_no_aper_no_lug,'unbin-no-aper-no-lug.txt');




% % for all binned have to loop for all 10 bins:
initial_col = [8 18 40 50 60 70 80 90 100 170 180 190];
% 

colHeaders = {'AccTest','AccCv','fs'};
results = cell(13,length(colHeaders)); %preallocate resutls
results(1,:)= colHeaders;
% loop for the number of bins (= 10 in our case)

% starting the loop from 0 because the initial column would have to be like
% matrix_bin = [y Data(:,initial_col-1+i)];
% subtract 1 as the initial columns would have to have been subtracted by 1
% This is done to not think about subtracting 1 from the column numbers and
% simply put the column no. of dynamic variables to be used.

for i = 0:9
    matrix_bin = [y Data(:,initial_col+i)];
    file= strcat('bin-', num2str(i),'.txt');
    [accTest, accCv] = kinematicsvm_param_sig(matrix_bin);
    results{i+2,1}=num2str(accTest);
    results{i+2,2}=num2str(accCv);
    %results{i+2,3}=num2str(fs);
end


save('results_sigmoid.mat','results')

% % updated to have all those variables that we require.
% all_bin = [8:17 18:27 40:109 200:219 222:231 232:241];
% matrix_all_bin = [y Data(:,all_bin)];
% kinematicsvm(matrix_all_bin,'all-bin.txt');





