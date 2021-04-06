% fitness function

function y = fitness(solution,value,mass)
numtreas = sum(solution);
ms = solution*mass;
if ms < 15
    y = solution*value-500000*numtreas;
else
    y = 0;
end
end
