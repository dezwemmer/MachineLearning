function Fv = normal(A)
% normalizes the dataset & eliminates the class column
Fv = [];

for i = 1:(width(A)-1)  % column
    array = [];
    
    for j = 1:height(A) % row
        value = (A(j,i)-mean(A(:,i)))/std(A(:,i));
        array = [array; value];
    end
    Fv = [Fv array];
end