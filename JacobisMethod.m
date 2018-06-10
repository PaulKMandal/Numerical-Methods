function x = JacobisMethod(A, b, x0, Tol, N)
    n = size(A,1);
    k = 1;
    while k <= N
        for i = 1:n
            x(i,1) = 1/A(i,i) * (-(A(i,1:n)*x0 - A(i,i)*x0(i)) + b(i));
        end
        if norm(x - x0,inf) < Tol
            fprintf('No. of Iterations: %i\n', k);
            break;
        end
        k = k+1;
        x0 = x;
    end
end

