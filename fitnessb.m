% fitness function

function y = fitnessb(solution,value,mass)
ms = solution*mass;
if ms < 15
    y = solution*value;
else
    y = 0;
end
end
