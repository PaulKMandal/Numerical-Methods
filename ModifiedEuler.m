function [t, w] = ModifiedEuler(f, a, b, N, alpha_vect)
    m = length(alpha_vect);
    h = (b-a)/N;
    t = a:h:b;
    for i = 1:m
        w(i,1) = alpha_vect(i);
    end
    for i = 1:N
        
        w(:,i+1) = w(:,i) + h/2*f(t(i), w(:,i)) + h/2*f(t(i+1),w(:,i) + h*f(t(i),w(:,i)));
    end
end

