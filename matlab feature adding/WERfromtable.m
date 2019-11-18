%% 
%read table

T = readcell('0001results.xlsx', 'Sheet','f0001');

t = ["no.","WER","words"];

last_number = 500

%WER only works with char not string as striing makes it " needed '
for i=1:last_number
   i;
    A = char(T(i+1, 2))
    B = char(T(i + 1, 3))
   w = WER(char(T(i+1, 2)), char(T(i+1, 3)))
   num = count(T(i+1, 2),' ') + 1;
    t(i+1,1) = i;
    t(i+1,2) = w(1, 2);
    t(i+1,3) = num;
end

