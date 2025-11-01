%1.3 numerical cancellation 

clc ; clearvars;

r = 1;
h = 10.^(-(1:16));

% Original formula
A_original = (4/3) * pi * ((r + h).^3 - r.^3);

% Improved version
A_improved = (4/3) * pi .* h .* (h.^2 + 3*r.*h + 3*r.^2);

%relative difference
relativeDifference = abs(A_improved - A_original) ./ A_original;

%making tha table based on Matlab documentation
T = array2table([A_original; A_improved]);

T.Properties.RowNames = {'original','improved'};

T.Properties.VariableNames = cellstr(string(-(1:16)));

disp(relativeDifference)
disp(T)
