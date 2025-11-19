%lab 3

clc, clearvars

global phi bndry L 
%a variable that can be accessed and modified by multiple functions and the base workspace, without needing to be passed as an argument


N = 201;         % or 101 / 401
L = 1.0;         % 1 m box

setup(N);

h = L / (N-1);



% helper: length [m] -> number of cells
len2cells = @(a) round(a / h);
%used AI to get this idea

wall  = len2cells(0.02);   % 2 cm wall thickness
pW    = len2cells(0.20);   % plate width  20 cm
pH    = len2cells(0.02);   % plate height 2 cm
gap   = len2cells(0.10);   % gap between plates 10 cm


% bottom wall
rect(0,        N-1,       0,          wall-1,        0);
% top wall
rect(0,        N-1,       N-wall,     N-1,           0);
% left wall
rect(0,        wall-1,    0,          N-1,           0);
% right wall
rect(N-wall,   N-1,       0,          N-1,           0);


x_min = floor((N - pW)/2);
x_max = x_min + pW - 1;

% put the pair roughly in the middle vertically
y_low_min = floor(N/2) - floor(pH/2);
y_low_max = y_low_min + pH - 1;

y_up_min  = y_low_max + gap;
y_up_max  = y_up_min  + pH - 1;

% upper plate: +100 V
rect(x_min, x_max, y_up_min,  y_up_max,  +100);


% lower plate: -100 V
rect(x_min, x_max, y_low_min, y_low_max, -100);



% quick check , AI is being used to get help and draw a shape however, the syntax is totally understood !
figure;
subplot(1,2,1); imagesc(phi);   axis image; colorbar; title('\phi'); 
subplot(1,2,2); imagesc(bndry); axis image; colorbar; title('bndry');


%part 1 and 2
function setup(N)

    global phi bndry L
    % Allocate matrices
    phi   = zeros(N, N);      % double precision matrix
    bndry = false(N, N);      % logical matrix
end
% Set boundary points (all points on the edges)
%bndry(1, :) = true;         % Bottom edge
%bndry(N, :) = true;         % Top edge  
%bndry(:, 1) = true;         % Left edge
%bndry(:, N) = true;         % Right edge


% part 2 rect function
function rect(minx, maxx, miny, maxy, val)

    global phi bndry
    % Convert coordinate ranges to index ranges cuz matlab starts from 1.
    ix1 = minx + 1;
    ix2 = maxx + 1;
    iy1 = miny + 1;
    iy2 = maxy + 1;

    % Set potential values  (NOTE: y first, x second)
    phi(iy1:iy2, ix1:ix2) = val;

    % Mark as boundary
    bndry(iy1:iy2, ix1:ix2) = true;
end