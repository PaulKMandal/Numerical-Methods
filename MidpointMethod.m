function [t, w] = MidpointMethod(f, a, b, N, alpha)
%This is also known as RKO2
    h = (b-a)/N;
    t(1) = a;
    w(1) = alpha;
    for i = 1:N
        w(i+1) = w(i) + h*f(t(i) + h/2, w(i) + h/2*f(t(i),w(i)));
        t(i+1) = a + (i)*h;
    end


end

