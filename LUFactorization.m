function [L, U] = LUFactorization(A)
    n = size(A,1);
    L(1,1) = 1;
    U(1,1) = A(1,1);
    for j = 2:n
        U(1,j) = A(1,j);
        L(j,1) = A(j,1)/U(1,1);
    end
    for i = 2:n-1
        L(i,i) = 1;
        U(i,i) = A(i,i) - L(i,1:i-1)*U(1:i-1,i);
        for j = i+1:n
            U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
            L(j,i) = 1/U(i,i) * (A(j,i) - L(j,1:i-1)*U(1:i-1,i));
        end
    end
    U(n,n) = A(n,n) - L(n,1:n-1)*U(1:n-1,n);
    L(n,n) = 1;
end

