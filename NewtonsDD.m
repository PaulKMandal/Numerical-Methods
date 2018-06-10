function F = NewtonsDD(x, xi, yi)
    n = length(xi);
    F=zeros(n,n);
    F(:,1) = yi;
    for i = 2:n
        for j = 2:i
            F(i,j) = (F(i,j-1)-F(i-1,j-1))/(xi(i)-xi(i-j+1));
        end
    end
end

