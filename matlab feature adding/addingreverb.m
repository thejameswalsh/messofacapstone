%%

file_name = 'm0001_us_m0001_00';
suf = 's_m0001_00';
extension = '.wav';

for i = 1 : 1000
    file = file_name;
    ext = '.wav';
    
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
    
    file = strcat(file, number, ext);
    
    try
        audioread(file);
    catch
        break;
    end
end

last_number = i - 1

%% type of test

type = 'm0001_reverb';

%% make folder

folder = strcat(type,'_folder');

    if ~exist(folder, 'dir')
       mkdir(folder)
    end

%%
fs = 16000;

pre = 'm0001_';
% last_number = 1;

for j=0:10
    write_name = pre;
    switch j
        case 0
            sec = 0.0;
            secString = '0.0';
        case 1
            sec = 0.1;
            secString = '0.1';
        case 2
            sec = 0.2;
            secString = '0.2';
        case 3 
            sec = 0.3;
            secString = '0.3';
        case 4
            sec = 0.4;
            secString = '0.4';
        case 5
            sec = 0.5;
            secString = '0.5';
        case 6
            sec = 0.6;
            secString = '0.6';
        case 7
            sec = 0.7;
            secString = '0.7';
        case 8
            sec = 0.8;
            secString = '0.8';
        case 9
            sec = 0.9;
            secString = '0.9';
        case 10
            sec = 1.0;
            secString = '1.0';
    end
    
    reverb = reverberator('PreDelay', sec)
            
    write_name = strcat(write_name, secString, suf);

for i=1:last_number
    
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end

% new naming style
    final_name = strcat(file_name,number,extension)
    final_write_name = strcat(write_name,number,extension)
    
    %import audio
    try [signal, fs] = audioread(final_name);
    catch
        break
    end
    
    Out = reverb(signal);

    %save
    audiowrite(strcat(folder,'\',final_write_name),Out,fs);

end

end

'done'
return
