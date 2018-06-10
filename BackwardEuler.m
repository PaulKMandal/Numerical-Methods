function [t, w] = BackwardEuler(f, a, b, N, alpha)
    h = (b-a)/N;
    t = a:h:b;
    w(1) = alpha;
    for i = 1:N
        w(i+1) = w(i)/(1-h*cos(t(i+1)));
       
    end
end

