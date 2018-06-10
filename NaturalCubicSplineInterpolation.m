function [a, b, c, d] = NaturalCubicSplineInterpolation(x, a)
    n = length(x);
    for i = 1:n-1
        h(i) = x(i+1)-x(i);
    end
    for i = 2:n-1
        alpha(i) = 3/h(i)*(a(i+1)-a(i)) - 3/h(i-1)*(a(i)-a(i-1));
    end
    l(1) = 1; mu(1) = 0; z(1) = 0;
    for i = 2:n-1
        l(i) = 2*(x(i+1)-x(i-1)) - h(i-1)*mu(i-1);
        mu(i) = h(i)/l(i);
        z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
    end
    l(n) = 1; z(n) = 0; c(n) = 0;
    for j = n-1:-1:1
        c(j) = z(j) - mu(j)*c(j+1);
        b(j) = (a(j+1)-a(j))/h(j) - h(j)*(c(j+1)+2*c(j))/3;
        d(j) = (c(j+1) - c(j))/(3*h(j));
    end
        
  c= c(1:n-1);
end

