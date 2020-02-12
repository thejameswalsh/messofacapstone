last_number = 328;
% last_number = 2;
suf = 's_m0001_00'

%%
speechObject = speechClient('Google','languageCode','en-US');

a = ["file name","ASR words","confidance","WER","Time"];

for j=0:10
    pre = 'm0001_';
    switch j
        case 0
            secString = '0.0';
        case 1
            secString = '0.1';
        case 2
            secString = '0.2';
        case 3 
            secString = '0.3';
        case 4
            secString = '0.4';
        case 5
            secString = '0.5';
        case 6
            secString = '0.6';
        case 7
            secString = '0.7';
        case 8
            secString = '0.8';
        case 9
            secString = '0.9';
        case 10
            secString = '1.0';
    end
read_name = strcat(pre,secString,suf)
extension = '.wav';

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end

% new naming style
    final_name = strcat(read_name,number,extension)
    
    %import audio
    tic
    [signal, fs] = audioread(final_name);
    
%     tableOut = speech2text(speechObject,signal(:,1),fs)

    Table = table2cell(tableOut);    
    [r,c] = size(Table);
    
    s = toc;
    if r == 1
        stringWrite = Table(1,1);
        confidence = Table(1,2);
    else
        stringWrite = strcat(string(Table(1,1)),string(Table(2,1)));
        confidence = ((str2double(string(Table(1,2))) + str2double(string(Table(2,2)))) / 2);
    end
    
        a(i+(1 + ((j) *last_number)),1) = final_name;
        a(i+(1 + ((j) *last_number)),2) = stringWrite;
        a(i+(1 + ((j) *last_number)),3) = confidence;
        a(i+(1 + ((j) *last_number)),5) = s;
end

end

return
