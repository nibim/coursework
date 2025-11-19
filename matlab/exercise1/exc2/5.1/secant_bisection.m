% 5.1 secant method

%part a

clc ; clearvars;

function x2 = secant_method_bisection(f, x0, x1 , tol)
    
    % default tolerence if the user do not provide
    if nargin < 4
        tol = 1e-6;         % Set default tolerance
    end
    fx0 = f(x0);
    fx1 = f(x1);

    % must bracket otherwise does not go further!
    if fx0 * fx1 > 0
        error('Interval does not bracket the root');
    end

    for i = 1:100
        % Secant estimate
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        fx2 = f(x2);
    
        % Check stopping criteria
        if abs(fx2) < tol || abs(x1 - x0) < tol
            return
        end

        % checking for biesectral part to see where to exactly find that
        if fx0 * fx2 <= 0
            x1  = x2;
            fx1 = fx2;
        else
            x0  = x2;
            fx0 = fx2;
        end

     end
end

beta = 0.17;
f = @(m) tanh(6 * beta * m) - m;
m_br  = secant_method_bisection(f, 0.2, 0.3, 1e-12);
fprintf('Bracketed secant: %.12f\n', m_br);