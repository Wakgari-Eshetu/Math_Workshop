% Name : Wakgari Eshetu
% UGR : UGR/9344/16

clc; clear;

f = @(x) exp(x) - x - 2;

x0 = 0;
x1 = 1;


tol = 1e-6;
maxIter = 100;



for i = 1:maxIter
   
    x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));
    
    fprintf('%d\t %.6f\t %.6f\n', i, x2, f(x2));
    
    if abs(x2 - x1) < tol
        fprintf('\nRoot found: %.6f\n', x2);
        break;
    end
    x0 = x1;
    x1 = x2;
end

if i == maxIter
    fprintf('Maximum iterations reached. Last approximation: %.6f\n', x2);
end
