%3.1 Stable Recurrence Relation
clc, clearvars
numberOfSentences = 20 
euler = exp (1)


p_store = zeros(1,21) 

f = @(x)    (log(x)).^(numberOfSentences + 1); % (ln)^ 21
p_store(numberOfSentences + 1) = integral(f, 1, euler); %p21 is calculated

%backward propogation
for i = numberOfSentences:-1:1
    p_store(i) = (euler - p_store(i+1)) / (i + 1);
end


% print P_1 ... P_20

for i = 1:21
    fprintf('P_%d = %.10f\n', i, p_store(i));
end