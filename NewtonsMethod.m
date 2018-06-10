function [p, i] = NewtonsMethod(f, fprime, p0, Tol , No)
i = 1;
while i<=No
    p = p0 - f(p0)/fprime(p0);
    if abs(p - p0) < Tol
        return
    end
    
    i = i+1;
    p0 = p;
    
    disp('Method failed after No iterations, No = ' + No);
end
end

