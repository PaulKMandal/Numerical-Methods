function [L, D] = LDLtFactorization(A)
    n = size(A,1);
    D = zeros(n,n);
    L = zeros(n,n);
    v=0;
    for i = 1:n
        L(i,i) = 1;
        for j = 1:i-1
            v(j) = L(i,j)*D(j,j);
        end
        D(i,i) =  A(i,i) - L(i,1:i-1)*v(1:i-1)';
        for j = i+1:n
            L(j,i) = (A(j,i) - L(j,1:i-1)*v(1:i-1)')/D(i,i);
        end
    end
end

