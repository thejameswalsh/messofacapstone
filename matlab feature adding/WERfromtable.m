%% correct full stops
T = readcell('trans full and broken.xlsx', 'Sheet','m1');
% ref = readcell('many db testing results', 'Sheet','white test');

'converting to WER'

column = 'C'
last_number = 1000

%WER only works with char not string as striing makes it " needed '

removed = ["removed stop words"];

for i=1:last_number
    
    Words = char(T(i+1, 2))
%     ASR = char(ref(i+2, (double(column) - 64)))
    
    len = strlength(Words);
       
    if Words(len) == '.'
        Words = Words(1:end-1);
    end
    
    Words
    
%    w = WER(char(ref(i+2, (double(column) - 64))), char(T(i+1, 2)));
    removed(i+1,1) = Words;
end

'fin'


%% 
%read table

T = readcell('trans full and broken.xlsx', 'Sheet','m1');
ref = readcell('many db testing results', 'Sheet','restaurant test');

'converting to WER'

column = 3
last_number = 328

%WER only works with char not string as striing makes it " needed '

table = ["WER5","WER10","WER15","WER20","WER25","WER30","WER35","WER40"];

for j = 1 : 8
    column = 3 + (5 * (j-1))  
    
for i=1:last_number
    
    Words = char(T(i+1, 3));
    ASR = char(ref(i+2, (column)));
    
    
   w = WER(lower(char(ref(i+2, (column)))), lower(char(T(i+1, 3))));

    table(i+1,j) = w(1, 2);
end
%WER only works with char not string as striing makes it " needed '

end








