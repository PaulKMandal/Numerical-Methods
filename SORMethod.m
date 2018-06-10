function x = SORMethod(A, b, x0, w, Tol, N)
   n = size(A,1);
    k = 1;
    x = zeros(n,1);
    while k <= N
        for i = 1:n
            x(i,1) = (1-w)*x0(i)+ w/A(i,i) * (-A(i,1:i-1)*x(1:i-1,1) - A(i,i+1:n)*x0(i+1:n,1) + b(i));
        end
        if norm(x - x0,inf) < Tol
            fprintf('No. of Iterations: %i\n', k);
            break;
        end
        k = k+1;
        x0 = x;
    end
end
