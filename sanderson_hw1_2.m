%% Steven Anderson
% AME 596
% HW1 #2
% KNN Classifier Application
clc
clear all
close all

%% Import dataset
dataset = importdata('sat_training.txt');
%dataset = importdata('sat_test.txt');

k = 2;  % set k value

%% Normalize data using given transformation
ndataset = normal(dataset);
% ntest = normal(test);


%% Iterate for all values of dataset
acctot = 0;
for q = 1:length(dataset)
    
    % Calculate Euclidean distance
    distances = edist(ndataset,q);
    
    % add index to distances array for looking up "true" class later
    for i = 1:length(distances)
        distances(i,2) = i;
    end
    
    distances = sortrows(distances,1);
    
    % determine k nearest neighbors & their indexes in original dataset
    nearn = [distances(2:(k+1),1) distances(2:(k+1),2)];
    
    % select class
    for i = 1:length(nearn)
        nearnclass(i) = dataset(nearn(i,2),37);
    end
    
    % predicted class
    pclass = mode(nearnclass);
    
    % check for ties, compare with "true" class, and assign accuracy
    occurances = [1 sum(nearnclass(:)==1); 2 sum(nearnclass(:)==2); 3 sum(nearnclass(:)==3); 4 sum(nearnclass(:)==4); 5 sum(nearnclass(:)==5); 6 sum(nearnclass(:)==6); 7 sum(nearnclass(:)==7) ];
    true = dataset(q,37);
    tie = 0;
    for i = 1:7
        if occurances(i,2) > 1
            store = occurances(i,2);
            tie = 1;
        end
    end
    
    % sort the occurances by the frequency
    occurances = sortrows(occurances,2);
    
    if tie == 0
        if pclass == true
            acc = 1;
        else
            acc = 0;
        end
    elseif tie == 1
        if true == occurances(7,1)
            acc = 1/occurances(7,2);       
        else
            acc = 0;
        end
    end
    
    acctot = acctot + acc;
    accpercent = 100*acctot/q;
    
    output(q,1) = q;
    output(q,2) = pclass;
    output(q,3) = true;
    output(q,4) = accpercent;
end

%% Output results
fprintf('Output (Object ID / Predicted Class / True Class / Accuracy (Running)):\n')
output


