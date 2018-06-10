function x = LUSolver(A, b)
    [L, U] = LUFactorization(A);
    n = size(A,1);
    x = zeros(n,1);
    y(1) = b(1)/L(1,1);
    for i = 2:n
        y(i,1) = b(i) - L(i,1:i-1)*y(1:i-1);
    end
        x(n) = y(n)/U(n,n);
    for i = n-1:-1:1
        x(i,1) = (y(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
    end
end

