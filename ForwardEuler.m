function [t, w] = ForwardEuler(f, a, b, N, alpha)
    h = (b-a)/N;
    t(1) = a;
    w(1) = alpha;
    for i = 2:N+1
        w(i) = w(i-1) + h*f(t(i-1),w(i-1));
        t(i) = a + (i-1)*h;
    end
end

