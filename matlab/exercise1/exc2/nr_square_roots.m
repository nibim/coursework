% exc 2
% 4.1 Newton-Raphson for Square Roots
clc, clearvars

a = (1:10);
max_rel_err = 1e-15;
no_iter = 100;

for index = 1:length(a)
    a1 = a(index);
    % initial guess = 1
    x_k = 0.1 ;  
    x_correct = 1 / a1;
    rel_err = abs(x_k - x_correct) / abs(x_correct);
    iter = 0;

    while rel_err > max_rel_err && iter < no_iter
        x_kPlus1 = 2* x_k - a1 * x_k^2;        % Newton iteration
        iter = iter + 1;
        rel_err = abs(x_kPlus1 - x_k) / abs(x_kPlus1);
        x_k = x_kPlus1;
    end
    fprintf('a = %6.3f, iterations = %2d\n', a1, iter);
end
 