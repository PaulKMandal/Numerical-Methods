function [p, i] = SteffensensMethod(g, po, Tol, No)
    i=1;
    while i <= No
        p1 = g(po);
        p2 = g(p1);
        p = po - (p1 - po)^2/(p2-2*p1+po);
        if abs(p-po) < Tol
            return;
        end;
        i=i+1;
        po = p;
    end;
    
     disp('Method failed after No iterations, No = ' + No);
            



end

