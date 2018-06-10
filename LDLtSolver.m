function x = LDLtSolver(A, b)
    [L, D] = LDLtFactorization(A);
    n = size(A,1);
    y(1) = b(1);
    x = zeros(n,1);
    for i = 2:n
        y(i,1) = b(i,1) - L(i,1:i-1)*y(1:i-1,1);
    end
    for i = 1:n
        z(i) = y(i)/D(i,i);
    end
    x(n,1) = z(n);
    for i = n-1:-1:1
        x(i,1) = z(i) - L(i+1:n,i)'*x(i+1:n);
    end
end

