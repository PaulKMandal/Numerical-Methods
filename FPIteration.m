function [p,i] = FPIteration(g, po, Tol, No)
%FPITERATION Summary of this function goes here
%   Detailed explanation goes here
i = 1;
while i < No
    p = g(po);
    if abs(p - po) < Tol
        return
    end
    
    i = i+1;
    po = p;
end
disp('Method failed after No iterations, No = ' + No)

end

