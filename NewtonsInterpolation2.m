function p = NewtonsInterpolation(x, xi, yi)
%Get a polynomial using Newton's Divided Differences
    F = NewtonsDD(x, xi, yi);
    n = size(F,2);
    p = F(1,1);
    for j = 2:n
        p = p + F(j,j)*prod(x-xi(1:j-1));
    end
end

