function p = NewtonsInterpolation(x, xi, yi)
%Get a polynomial using Newton's Divided Differences
    F = NewtonsDD(x, xi, yi);
    n = size(F,2);
    p = zeros(size(x));
    for i = 1:size(x,2)
        p(i) = F(1,1);
        for j = 2:n
            p(i) = p(i) + F(j,j)*prod(x(i)-xi(1:j-1));
        end
    end
end

