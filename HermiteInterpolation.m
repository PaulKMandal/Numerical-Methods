function [Q, z] = HermiteInterpolation( xi, yi, yi_prime)
    n = length(xi);
    Q = zeros(n,n);
    z = zeros(2*n);
    for i = 1:(n)
        z(2*i-1) = xi(i);
        z(2*i) = xi(i);
        Q(2*i-1,1) = yi(i);
        Q(2*i,1) = yi(i);
        Q(2*i,2) = yi_prime(i);
        if i ~= 1
            Q(2*i-1,2) = (Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
        end
    end
    
    for i = 3:2*n
        for j = 3:i
            Q(i,j) = (Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
        end
    end
end

