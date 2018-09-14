%This method was originally created by Dr. Laura Smith.

function [APP, xnodes] = adaptQuadClass(f, a, b, tol, N)
%%  Adaptive Quadrature Method with Trapezoidal Rule
% INPUT:  Function f. Endpoints a,b.  Tolerance tol.  Limit N to number of levels.
% OUTPUT:  Approximation APP of the integral or message limit reached.
xnodes = [a, (a+b)/2, b];
APP = 0;
i = 1;
tol(i) = 10*tol;

a(i) = a;
h(i) = (b-a)/2;
FA(i) = f(a);
FC(i) = f(a+h(i));
FB(i) = f(b);

% Approximation with Simpson's method for the entire interval.
S(i) = h(i)*(FA(i)+4*FC(i) +FB(i))/3;
L(i) = 1;

while i>0

    % Evaluate the function at midpoints of the subintervals
    FD = f(a(i) + h(i)/2);
    FE = f(a(i) + 3*h(i)/2);
    
    % Approximations from Simpson's method for halves of subintervals
    S1 = h(i)*(FA(i)+4*FD +FC(i))/6;
    S2 = h(i)*(FC(i)+4*FE +FB(i))/6;
    
    % Save the data at this level
    v1=a(i);
    v2 = FA(i);
    v3 = FC(i);
    v4 = FB(i);
    v5 = h(i);
    v6 = tol(i);
    v7 = S(i);
    v8 = L(i);
    
    
    % Delete the level
    i = i-1;
    
    % Desired tolerance reached
    if abs(S1+S2-v7)< v6
        APP = APP + (S1+S2);
        xnodes = [xnodes, a(i+1)+h(i+1)/2, a(i+1)+3*h(i+1)/2];
        
    % Otherwise, subdivide
    else
        % Maximum sublevels reached.  Terminate.
        if v8>=N
            disp('Level exceeded');
            return;
            
        else
            % Right half subinterval
            i = i+1;
            a(i) = v1 + v5;
            FA(i) = v3;
            FC(i) = FE;
            FB(i) = v4;
            h(i) = v5/2;
            tol(i) = v6/2;
            S(i) = S2;
            L(i) = v8+1;
            
            % Left half subinterval
            i = i+1;
            a(i) = v1;
            FA(i) = v2;
            FC(i) = FD;
            FB(i) = v3;
            h(i) = h(i-1);
            tol(i) = tol(i-1);
            S(i) = S1;
            L(i) = L(i-1);
        end
    end
end

end
