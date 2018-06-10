function p = MullersMethod( f, p0, p1, p2, Tol, No )
    h1 = p1-p0;
    h2 = p2-p1;
    d1 = (f(p1) - f(p0))/h1;
    d2 = (f(p2)-f(p1))/h2;
    d = (d2 - d1)/(h2 + h1);
    i = 3;
    
    while i<= No
        b = d2 + h2*d;
        D = (b^2 - 4*f(p2)*d)^0.5;
        if abs(b-D) < abs(b+D)
            E = b+D;
        else
            E = b-D;
        end
        h = -2*f(p2)/E;
        p = p2 + h;
        
        if abs(h) < Tol
            return;
        end
        
        p0 = p1;
        p1 = p2;
        p2 = p;
        h1 = p1-p0;
        h2 = p2 - p1;
        d1 = (f(p1) - f(p0))/h1;
        d2 = (f(p2) - f(p1))/h2;
        d = (d2 - d1)/(h2 + h1);
        i = i + 1;
    end

end

