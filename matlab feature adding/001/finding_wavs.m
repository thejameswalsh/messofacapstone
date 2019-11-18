%%
%playing all files
%go to find the name

file_name = 'PDAs';
spkr_ID = '01'
extension = '.wav';
last_number = 40;

%a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
    final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)
    [samples, fs] = audioread(final_name);
    
    sound(samples, fs);
    
    %wait for the sound to stop
    T = numel(samples)/fs;
    pause(T+1);
    
    speechObject = speechClient('Google','languageCode','en-US');

    tableOut = speech2text(speechObject,samples(:,1),fs)
    
    Table = table2cell(tableOut);
    
    a(i+1,1) = final_name;
    a(i+1,3) = Table(1,1);
    a(i+1,4) = Table(1,2);
    
    
end
%[samples, fs] = audioread('1.wav');

%%
%testing section for fs values


for i=1:last_number
        if i < 10
        number = strcat('00',int2str(i));
        elseif i < 100
        number = strcat('0', int2str(i));
        else
        number = int2str(i);
    end
    final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)
    [samples, fs] = audioread(final_name);
    fs
end