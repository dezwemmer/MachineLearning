% mutation function

function y = mutation(x)
len = width(x);
r1 = randi([1 len]);
r2 = randi([1 len]);
r3 = randi([1 len]);
x2 = x;
if x(r1) == 0
    x2(r1) = 1;
else
    x2(r1) = 0;
end

if x(r2) == 0
    x2(r2) = 1;
else
    x2(r2) = 0;
end

if x(r3) == 0
    x2(r3) = 1;
else
    x2(r3) = 0;
end

y = x2;
end
