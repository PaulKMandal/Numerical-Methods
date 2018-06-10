function [t, w] = MVForwardEuler(f, a, b, N, alpha_vect)
    m = length(alpha_vect);
    h = (b-a)/N;
    t(1) = a;
    for i = 1:m
        w(i,1) = alpha_vect(i);
    end
    for i = 2:N+1
        w(:,i) = w(:,i-1) + h*f(t(i-1),w(:,i-1));
        t(i) = a + (i-1)*h;
    end
end

