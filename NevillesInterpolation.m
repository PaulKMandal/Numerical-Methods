function Q = NevillesInterpolation(x ,xi, yi)
    n = length(xi);
    Q=zeros(n,n);
    Q(:,1) = yi;
    for i = 2:n
        for j = 2:i
            Q(i,j) = ((x - xi(i-j+1))*Q(i,j-1) - (x-xi(i))*Q(i-1,j-1))/(xi(i)-xi(i-j+1));
        end
    end
end

