last_number = 328;
% last_number = 2;
suf = 'dB_m0001_00'

%%
speechObject = speechClient('Google','languageCode','en-US');

a = ["file name","words","ASR words","confidance","WER","Time"];

for j=1:8
snr = j * 5

% read_name = 'm0001_white_';
read_name = 'm0001_office_';
% read_name = 'm0001_street_';
% read_name = 'm0001_restaurant_';

if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
read_name = strcat(read_name, no, suf);
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
    
    tableOut = speech2text(speechObject,signal(:,1),fs)

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
    
        a(i+(1 + ((j - 1) *last_number)),1) = final_name;
        a(i+(1 + ((j - 1) *last_number)),3) = stringWrite;
        a(i+(1 + ((j - 1) *last_number)),4) = confidence;
        a(i+(1 + ((j - 1) *last_number)),6) = s;
end
return
end

%% next



speechObject = speechClient('Google','languageCode','en-US');

b = ["file name","words","ASR words","confidance","WER","Time"];

for j=1:8
snr = j * 5

% read_name = 'm0001_white_';
% read_name = 'm0001_office_';
read_name = 'm0001_street_';
% read_name = 'm0001_restaurant_';

if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
read_name = strcat(read_name, no, suf);
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
    
    tableOut = speech2text(speechObject,signal(:,1),fs)

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
    
        b(i+(1 + ((j - 1) *last_number)),1) = final_name;
        b(i+(1 + ((j - 1) *last_number)),3) = stringWrite;
        b(i+(1 + ((j - 1) *last_number)),4) = confidence;
        b(i+(1 + ((j - 1) *last_number)),6) = s;
end

end

%% next


speechObject = speechClient('Google','languageCode','en-US');

d = ["file name","words","ASR words","confidance","WER","Time"];

for j=1:8
snr = j * 5

% read_name = 'm0001_white_';
% read_name = 'm0001_office_';
% read_name = 'm0001_street_';
read_name = 'm0001_restaurant_';

if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
read_name = strcat(read_name, no, suf);
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
    
    tableOut = speech2text(speechObject,signal(:,1),fs)

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
    
        d(i+(1 + ((j - 1) *last_number)),1) = final_name;
        d(i+(1 + ((j - 1) *last_number)),3) = stringWrite;
        d(i+(1 + ((j - 1) *last_number)),4) = confidence;
        d(i+(1 + ((j - 1) *last_number)),6) = s;
end

end

%% next


speechObject = speechClient('Google','languageCode','en-US');

e = ["file name","words","ASR words","confidance","WER","Time"];

for j=1:8
snr = j * 5

read_name = 'm0001_white_';
% read_name = 'm0001_office_';
% read_name = 'm0001_street_';
% read_name = 'm0001_restaurant_';

if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
read_name = strcat(read_name, no, suf);
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
    
    tableOut = speech2text(speechObject,signal(:,1),fs)

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
    
        e(i+(1 + ((j - 1) *last_number)),1) = final_name;
        e(i+(1 + ((j - 1) *last_number)),3) = stringWrite;
        e(i+(1 + ((j - 1) *last_number)),4) = confidence;
        e(i+(1 + ((j - 1) *last_number)),6) = s;
end

end