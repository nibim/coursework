% 5.1 secant method

%part a

clc ; clearvars;

function x_estimated = secant_method_simple(f, x0, x1 , tol)
    
    % default tolerence if the user do not provide
    if nargin < 4
        tol = 1e-6; % Set default tolerance
    end

    while abs(x1-x0) > tol
        f0 = f(x0);
        f1 = f(x1);

        x_temp = x1 - f1 * (x1 - x0) / (f1 - f0); % Update x using the secant formula
        x0 = x1;        % Shift x0 to x1
        x1 = x_temp; % Update x1 to the new estimate
    end
    
    x_estimated = x1;
end

beta = 0.17;
f = @(m) tanh(6 * beta * m) - m;

m_std = secant_method_simple(f, 0.1, 0.5, 1e-12);

fprintf('Standard secant:  %.12f\n', m_std);
