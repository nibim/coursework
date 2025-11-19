% 2.1

clc, clearvars

f  = @(x) cos(x);  
%function handles: https://www.mathworks.com/help/matlab/function-handles.html

fp = @(x) -sin(x);
% derative of cos(x)

x  = 1;
true_val = fp(x);   % cos(1)

h = 10.^(-(1:10)); 

true_vec = true_val * ones(size(h));

%forward dif
function val =  forward_dif(f ,x ,h )
    val = (f(x + h) - f(x)) ./ h;
end


%central dif
function val =  central_dif(f ,x ,h )
    val = (f(x + h) - f(x - h)) ./ (2 .* h);
end



%5 pts stencil
function val =  five_point_4th(f ,x ,h )
    val = (-f(x + 2.*h) + 8.*f(x + h) - 8.*f(x - h) + f(x - 2.*h)) ./ (12 .* h);
end


Df = forward_dif(f, x, h);
Dc = central_dif(f, x, h);
D4 = five_point_4th(f, x, h);

%calculating the errors for each case
errs_forward = abs(Df - true_vec);
errs_central = abs(Dc - true_vec);
errs_4th     = abs(D4 - true_vec);

% Display the errors in a table format using AI
fprintf('Errors for each differentiation method:\n');
fprintf('----------------------------------------\n');
fprintf('  h\t\tforward\t\tcentral\t\t4th-order\n');
for k = 1:numel(h)
    fprintf(' %1.0e\t%.3e\t%.3e\t%.3e\n', h(k), ...
        errs_forward(k), errs_central(k), errs_4th(k));
end





%2.2 Visualizing and Fitting Error


rel_forward = errs_forward / abs(true_val);
rel_central = errs_central / abs(true_val);
rel_4th     = errs_4th     / abs(true_val);


figure;  % get help from AI
loglog(h , rel_forward,'o-', 'DisplayName', 'Forward'); hold on;
loglog(h, rel_central, 's-', 'DisplayName', 'Central');
loglog(h, rel_4th,     '^-', 'DisplayName', '4th-order');
xlabel('h');
ylabel('relative error');
legend('Location','best'); 
% to show “Forward” , “Central” and “4th-order” which we already determined
% in the plots. by best matlab itself decides where to put the plots.
grid on;
title('Relative error vs h (log-log)');