%3.2


clc, clearvars

N = 20        % can be 30 as well
x = linspace(0, pi, N)
y = linspace(0, 2*pi, N)


[X, Y] = meshgrid(x, y);     % regular 2D grid

phi = sin(X).^2 .* cos(Y).^3 + cos(Y).^2;


%% Plot phi as a surface
figure;
surf(X, Y, phi);
xlabel('x'); ylabel('y'); zlabel('\phi(x,y)');
title('Surface plot of \phi(x,y)');
shading interp; colorbar;

%% Now compute the grid spacing (this is fine)
hx = x(2) - x(1);
hy = y(2) - y(1);

%please refere to the handwritten part for mathematic explanation! 

% First derivatives (central differences, O(h^2))
Ex = (phi(3:N,   2:N-1) - phi(1:N-2, 2:N-1)) / (2*hx);  % dphi/dx
Ey = (phi(2:N-1, 3:N  ) - phi(2:N-1, 1:N-2)) / (2*hy);  % dphi/dy

% Second derivatives for Laplacian
phi_xx = (phi(3:N,   2:N-1) - 2*phi(2:N-1, 2:N-1) + phi(1:N-2, 2:N-1)) / hx^2;
phi_yy = (phi(2:N-1, 3:N  ) - 2*phi(2:N-1, 2:N-1) + phi(2:N-1, 1:N-2)) / hy^2;

% Laplacian of phi
rho = phi_xx + phi_yy;      



%AI is being used for getting help to draw contour and quiever graphs

% Coordinates for interior grid
Xi = X(2:N-1, 2:N-1);
Yi = Y(2:N-1, 2:N-1);

%% Separate contour plot of phi
figure;
contour(X, Y, phi, 20);
xlabel('x'); ylabel('y');
title('Contour plot of \phi(x,y)');
colorbar; axis equal tight;

%% Separate quiver plot of gradient E
figure;
quiver(Xi, Yi, Ex, Ey);
xlabel('x'); ylabel('y');
title('Quiver plot of gradient \nabla\phi');
axis equal tight;