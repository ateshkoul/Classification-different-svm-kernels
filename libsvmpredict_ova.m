function [pred,acc,prob] = libsvmpredict_ova(y, X, mdl)
    %# classes
    %labels = mdl.labels;
    %numLabels = numel(labels);

    %# get probability estimates of test instances using each 1-vs-all model
    %prob = zeros(size(X,1), numLabels);
%     for k=1:numLabels
%         [~,~,p] = svmpredict(double(y==labels(k)), X, mdl.models{k}, '-b 1 -q');
%         prob(:,k) = p(:, mdl.models{k}.Label==1);
%     end
    X_sparse = sparse(X);
    [pred,acc,prob] = svmpredict(double(y), X_sparse,mdl, '-b 1 -q');
    %prob = p(:, mdl.models{k}.Label==1);
    acc = acc(1);

    %# predict the class with the highest probability
    %[~,pred] = max(prob, [], 2);
    %# compute classification accuracy
    %acc = mean(p);
end