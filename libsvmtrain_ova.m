function model = libsvmtrain_ova(y, X, opts)
    if nargin < 3, opts = ''; end

    % for multiclass classification
    % #classes
    %labels = unique(y);
    %numLabels = numel(labels);

    %# train one-against-all models
    %models = cell(numLabels,1);
    %for k=1:numLabels
        %models{k} = svmtrain(double(y==labels(k)), X, opts);
    %end
    %mdl = struct('models',{models}, 'labels',labels);
    X_sparse = sparse(X);
    model = svmtrain(double(y), X_sparse, opts);
    
end