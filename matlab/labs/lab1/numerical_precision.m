% 1.2 Numerical precision  
% Demonstrating numerical precision with various calculations
clc, clearvars

%1
result1 = -1 + 1 + 1e-21;
%2
result2 = -1 + (1 + 1e-21);
%3
result3 = (-1 + 1) + 1e-22;
%4
result4 =  -1 + 1e-22 + 1 ;
%5
result5 = 12345678910111213 - 12345678910111212;
%6
result6 = 00000000000000003 - 00000000000000002;
%7
result7 = 0.0000000000000003 - 0.0000000000000002;

%My prediction:
%1: 1e-21 as we deduct from left to write.
%2: my prediction was 1e-21 as I thought it would be still representable by matlab.
%3: 1e-21 as it is just in the same order we do 1.
%4: 1e-21 as well just like previous cases. 
%5: 1 as two numbers are different just in the last digit by one.
%6: 1 since the zeros before the first digits are not being considered.
%7: I was not sure howevere sure this would be different from 5 so i could.
%- guess maybe zero because Matlab can not represent the precision.

%================================================================================

%real result:
% Display the real results

disp(['Result 1: ', num2str(result1)]);
disp(['Result 2: ', num2str(result2)]);
disp(['Result 3: ', num2str(result3)]);
disp(['Result 4: ', num2str(result4)]);
disp(['Result 5: ', num2str(result5)]);
disp(['Result 6: ', num2str(result6)]);
disp(['result 7: ', num2str(result7)]);

%Correction on my guess:
% 1: correct.

% 2: 0 as matlab can only represent 16 significant decimal digits so
% 1e-21 is too small.

% 3: correct.

% 4: just like 2 becomes 0 for the same reason.

% 5: Since there are 17 digits and matlab can only store 16 significant.
% digits it will round it to zero.

% 6: correct.

%7: 1e-16 as it is within the 16 significant digits.