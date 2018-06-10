function [p, i]= BisectionMethod(f, a, b, Tol, No)
i = 1;
FA = f(a);
while i <= No
    p = a + (b-a)/2;
    FP = f(p);
    if (abs(FP) < Tol || ((b-a)/2 < Tol))
        return;
    end
    
    i = i + 1;
    if (FA * FP) > 0
        a = p;
        FA = FP;
    else
        b = p;
    end
end
disp('Method failed after No iterations, No = ' + No)


end

