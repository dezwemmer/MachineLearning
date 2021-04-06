% fitness function

function [val, ms]= fitnessorig(solution,value,mass)
val = solution*value;
ms = solution*mass;

end
