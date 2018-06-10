function x = CholeskySolver(A, b)
    L = CholeskyFactorization(A);
    n = size(A,1);
    x =zeros(n,1);
    y(1) = b(1)/L(1,1);
    for i = 2:n
        y(i,1) = (b(i) - L(i,1:i-1)*y(1:i-1))/L(i,i);
    end
    x(n) = y(n)/L(n,n);
    for i = n-1:-1:1
        x(i,1) = (y(i) - L(i+1:n,i)'*x(i+1:n))/L(i,i);
    end
end

