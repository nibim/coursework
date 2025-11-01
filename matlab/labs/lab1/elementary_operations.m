% Exercise 1.1 - Elementary operations
% 1. A*A, Aˆ2, A/A and the corresponding element-wise operations
clc ; clearvars;
A = [1 2 1 5; 4 5 6 7 ; 1 1 1 1; 1 2 4 5];

d = det(A);

squareOfA = A * A ;
powerTwo = A^2;
multipliedByInverse = A/A;

elementWiseSquare = A.*A;
 
elementWisePower2 = A.^2;

elementWiseDevision = A./A;


% 2. Given a positive real number c and a real n×n matrix A, what is the meaning of cˆA and c.ˆA in MATLAB?

 c = exp(1);
 cToThePowerA            = c^A   % Matrix exponential, meaning first we have exp(A . ln(c))
                                  % exp(M)= I + M + M^2​/2! + M3/3! ​+
                                  % M4/4! .... where M is a matrix. 
                                            
 cToThePowerA_elementWise = c.^A  % Element-wise exponentiation of c to the power of each element in A


 % Answer : while in second case we just power up each single element of
 %          matrix A , in first case we do Matrix exponential, as the formula already mentioned in the cm. 

 %3.Compute 0/0 and 1/0

 0 / 0 ;  %not available
 1 / 0 ;  %





