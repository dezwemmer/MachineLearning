function dist = edist(A,q)
% computes euclidean distances for an array

% may need to change the 1 to a variable and iterate

dist = [];
for i = 1:height(A)
        add = 0;
        for j = 1:(width(A)-1)
            add = add + (A(i,j)-A(q,j))^2;
        end
        e = sqrt(add);
        dist = [dist; e];
end
    

