clc ;clear ;close all ;

f = input("Enter the function you want to work with f(x):","s");
f = inline(f,'x');

lower_v = input("Enter your lower value:");
upper_v = input("Enter your lower value:");
tol_v = input("Enter your tolerance:");
iter_v = input("Enter the maxximum number of iterations:");

% check the line weather cross the x-axis or not 
if f(lower_v)*f(upper_v) > 0
    disp('invalid guesses f(lower) and f(upper) must have opposite sign.');
else
    for i = 1:iter_v
        temp  =(lower_v*f(upper_v)  - upper_v*f(lower_v)) /(f(upper_v)-f(lower_v));
        fprintf('Iteration %d: a = %.6f, b = %.6f, c = %.6f, f(c) = %.6f\n', ...
            i, a, b, c, f(c));
        if abs(f(temp)) < tol_v
            fprintf("\n Root found at x = %.6f after %d iteration.\n",temp,i);
            break;
        end 

        if f(lower_v)*f(temp)<0
            upper_v = temp;
        else 
            lower_v = temp;
        end 
    end 

    if i == iter_v
        fprint("\n Method did not converge after %d iterations.\n",iter_v);
    end 
end 