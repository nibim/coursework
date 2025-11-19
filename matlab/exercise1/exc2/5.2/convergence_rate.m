% 5.1 secant method

%part a

clc ; clearvars;

function [x_estimated, x_hist]= secant_method_simple(f, x0, x1 , tol)
    
    % default tolerence if the user do not provide
    if nargin < 4
        tol = 1e-6; % Set default tolerance
    end
    
    x_hist = [x0, x1];   % Initialize history of estimates

    while abs(x1-x0) > tol
        f0 = f(x0);
        f1 = f(x1);

        x_temp = x1 - f1 * (x1 - x0) / (f1 - f0); % Update x using the secant formula
        x0 = x1;        % Shift x0 to x1
        x1 = x_temp; % Update x1 to the new estimate

        x_hist(end+1,1) = x1;   % append to history
    end
    
    x_estimated = x1;
end

%=========================================================================

function [x2, x_hist1] = secant_method_bisection(f, x0, x1 , tol)
    
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

    x_hist1 = [x0; x1];

    for i = 1:100
        % Secant estimate
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        fx2 = f(x2);
        x_hist1(end+1,1) = x2;
    
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

% run the methods
[m_std, x_hist_std] = secant_method_simple(   f, 0.1, 0.5, 1e-12);
[m_br , x_hist_br ] = secant_method_bisection(f, 0.1, 0.5, 1e-12);

% errors δ_n ≈ x_n - x*  NOTE: m_std is a number while x_hist is an array
% but it is like deducting m_std from each elemnt of this array!
error_std = x_hist_std - m_std;
error_br  = x_hist_br  - m_br;

% use absolute errors and skip the first few non-asymptotic points. (AI is being used to get help for this part)
k0 = 1;  % you can tweak this
d_std_n   = abs(error_std(k0:end-1));
d_std_np1 = abs(error_std(k0+1:end)); %The same vector shifted by one position
d_br_n    = abs(error_br(k0:end-1));
d_br_np1  = abs(error_br(k0+1:end));  %The same vector shifted by one position

% Explained: Early iterates are not in the asymptotic convergence regime.
% The error might go up/down unpredictably before the method “locks in” to its true convergence behavior.
% So we discard the first few δ values.


% Basically the x axis is δn and y axis its corresponding δn+1,
% AI is used partially to draw the graph and naming it
figure;
loglog(d_std_n, d_std_np1, 'o-'); hold on;
loglog(d_br_n , d_br_np1 , 's-');
grid on;
xlabel('|δ_n|');
ylabel('|δ_{n+1}|');
legend('Standard secant','Bracketed secant','Location','SouthEast');
title('Convergence of secant variants');
