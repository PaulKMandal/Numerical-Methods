function x = GaussElim(A)
    n = size(A,1);
    for i = 1:n-1
        p = min(find(abs(A(i:n,i))>0)) + i-1;
        if p ~= i
            temp = A(i,:);
            A(i,:) = A(p,:);
            A(p,:) = temp;
        end
        for j = i+1:n
            m(j,i) = A(j,i)/A(i,i);
            A(j,:) = A(j,:) - m(j,i)*A(i,:);
        end
    end
    if A(n,n) == 0
        disp('No unique solution exists');
    end
    x(n,1) = A(n,n+1)/A(n,n);
    for i = n-1:-1:1
        x(i,1) = (A(i,n+1) - A(i,i+1:n)*x(i+1:n,1))/A(i,i);
    end
end

