clc, clearvars;
% 4.2 Convergence Analysis of Newton-Raphson
m = 1000;

n = 1 / (1 - 10^(-15/m));         % n from part (a)
%n = 100                           %part c
x = 1;                            % initial guess x0
estimates = zeros(m,1);

for k = 1:m
    % Newton-Raphson for f(x) = x^n
    x = x * (1 - 1/n);     %simplified by calculation
    estimates(k) = x;
end

%AI was used for plotting the graph 
kvec = 1:m;
semilogy(kvec, abs(estimates), 'o-');
xlabel('Iteration k');
ylabel('|x_k|');
title(sprintf('Newton-Raphson for f(x) = x^n, n = %.4f', n));
grid on;
