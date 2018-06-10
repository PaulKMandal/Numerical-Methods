function [y, z] = HornersMethod(ai, x0)
   n = size(ai,2);
   y = ai(n);
   z = ai(n);
   for j = n-1:-1:2
       y = x0.*y + ai(j);
       z = x0.*z + y;
   end
   y = x0.*y + ai(1);
end

