function y = LagrangeInterpolation(x, xi, yi)
    y = 0;
    n = size(xi,2);
    for i = 1:n
        x_arr = xi;
        x_arr(i) = [];
        p = 1;
        for j = 1:n-1;
            p = p .* (x-x_arr(j))./prod(xi(i)-x_arr(j));
        end
        y = y + p *yi(i);
    end;


end

