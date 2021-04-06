% crossover function

function [y1,y2] = crossover(x1,x2)
len = width(x1);
crosspt = width(x1)/2;
y1 = [x1(1:crosspt) x2((crosspt+1):len)];
y2 = [x2(1:crosspt) x1((crosspt+1):len)];

end
