% function to calculate value and mass of bag

function y = findval(solution,value,mass)
ms = solution*mass;
if ms > 15
    y = 0
else
    y = solution*value;
end

end