%1.3 Maximum path sum
clc , clearvars;

function maximum_path_sum = tril(x)
      
      %count the number of rows in a matrix
      noRows = size(x,1);

      % Algo: we track the largest number from the bottom to the top.
      for i = noRows - 1 : -1 : 1  
          %start from index = noRows and decrease by 1 till no 1.
          
          for j = 1:i 
              %the bottomes elements , we find the maximum choice between
              %each two

              x(i,j) = x(i,j) + max( x(i+1,j), x(i+1,j+1) );
          end

       end

    % Final result is stored at the top
    maximum_path_sum = x(1,1);
end

x = [3 0 0 0
     7 4 0 0
     2 4 6 0
     8 5 9 3];

z = tril(x)
y = tril(magic(100)^2)