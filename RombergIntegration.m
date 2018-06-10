function R = RombergIntegration(f, a, b, n)
    h = (b-a);
    R(1,1) = h/2*(f(a)+f(b));
    for i = 2:n
        s = 0;
        for k = 1:2^(i-2)
            s =s+ f(a+(k-0.5)*h);
        end
        R(i,1) = 0.5*(R(i-1,1) + s*h);
        for j = 2:i
            R(i,j) = R(i,j-1) + (R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1);
        end
        h = h/2;
    end

end

