%%

file_name = 'f0001_us_f0001_00';
suf = 'dB_f0001_00';
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
    
    file = strcat(file, number, ext)
    
    try
        audioread(file);
    catch
        break;
    end
end

last_number = i - 1

%%
fs = 16000;

pre = 'f0001_restaurant_'
% pre = 'f0001_white_'
% pre = 'f0001_office_'
% pre = 'f0001_street_'

noise_type = 'restaurant_ref.wav'
% noise_type = 'office_ref.wav'
% noise_type = 'street_ref.wav'

for j=1:8
    write_name = pre;
    
    %set up SNR
    snr = j * 5;

    if snr < 10
        no = strcat('0',int2str(snr));
    else
        no = int2str(snr);
    end
    write_name = strcat(write_name, no, suf)

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
    
%     noise = wgn(size(signal,1),size(signal,2),0);
    [noise]=audioread(noise_type);

    len = min(size(signal, 1), size(noise, 1));
    noise = noise(1:len, 1);

    %adjust to be equal
    signal = signal/sqrt(mean(signal.^2))/100; 
    noise = noise/sqrt(mean(noise.^2))/100;
    
    %adjust noise
    rsDB = 10 * log10( mean( signal.^ 2 ) ); % in dB
    reqDB = rsDB / (10^(snr/20));

    noise = noise * (10^(reqDB/20));
    
    Out = signal + noise;

    %save
    audiowrite(final_write_name,Out,fs);

end

end

'done'

%%
fs = 16000;
% pre = 'f0001_restaurant_'
% pre = 'f0001_white_'
% pre = 'f0001_office_'
pre = 'f0001_street_'

% noise_type = 'restaurant_ref.wav'
% noise_type = 'office_ref.wav'
noise_type = 'street_ref.wav'

for j=1:8
    write_name = pre;
    
    %set up SNR
    snr = j * 5;

    if snr < 10
        no = strcat('0',int2str(snr));
    else
        no = int2str(snr);
    end
    write_name = strcat(write_name, no, suf)

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
    
%     noise = wgn(size(signal,1),size(signal,2),0);
    [noise]=audioread(noise_type);

    len = min(size(signal, 1), size(noise, 1));
    noise = noise(1:len, 1);

    %adjust to be equal
    signal = signal/sqrt(mean(signal.^2))/100; 
    noise = noise/sqrt(mean(noise.^2))/100;
    
    %adjust noise
    rsDB = 10 * log10( mean( signal.^ 2 ) ); % in dB
    reqDB = rsDB / (10^(snr/20));

    noise = noise * (10^(reqDB/20));
    
    Out = signal + noise;

    %save
    audiowrite(final_write_name,Out,fs);

end

end

'done'

%%
fs = 16000;
file_name = 'f0001_us_f0001_00';
% pre = 'f0001_restaurant_'
% pre = 'f0001_white_'
pre = 'f0001_office_'
% pre = 'f0001_street_'
suf = 'dB_f0001_00';

% noise_type = 'restaurant_ref.wav'
noise_type = 'office_ref.wav'
% noise_type = 'street_ref.wav'

for j=1:8
    write_name = pre;
    
    %set up SNR
    snr = j * 5;

    if snr < 10
        no = strcat('0',int2str(snr));
    else
        no = int2str(snr);
    end
    write_name = strcat(write_name, no, suf)

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
    
%     noise = wgn(size(signal,1),size(signal,2),0);
    [noise]=audioread(noise_type);

    len = min(size(signal, 1), size(noise, 1));
    noise = noise(1:len, 1);

    %adjust to be equal
    signal = signal/sqrt(mean(signal.^2))/100; 
    noise = noise/sqrt(mean(noise.^2))/100;
    
    %adjust noise
    rsDB = 10 * log10( mean( signal.^ 2 ) ); % in dB
    reqDB = rsDB / (10^(snr/20));

    noise = noise * (10^(reqDB/20));
    
    Out = signal + noise;

    %save
    audiowrite(final_write_name,Out,fs);

end

end

'done'

%%
fs = 16000;
% pre = 'f0001_restaurant_'
pre = 'f0001_white_'
% pre = 'f0001_office_'
% pre = 'f0001_street_'

% noise_type = 'restaurant_ref.wav'
% noise_type = 'office_ref.wav'
% noise_type = 'street_ref.wav'

for j=1:8
    write_name = pre;
    
    %set up SNR
    snr = j * 5;

    if snr < 10
        no = strcat('0',int2str(snr));
    else
        no = int2str(snr);
    end
    write_name = strcat(write_name, no, suf)

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
    
    noise = wgn(size(signal,1),size(signal,2),0);
%     [noise]=audioread(noise_type);

%     len = min(size(signal, 1), size(noise, 1));
%     noise = noise(1:len, 1);

    %adjust to be equal
    signal = signal/sqrt(mean(signal.^2))/100; 
    noise = noise/sqrt(mean(noise.^2))/100;
    
    %adjust noise
    rsDB = 10 * log10( mean( signal.^ 2 ) ); % in dB
    reqDB = rsDB / (10^(snr/20));

    noise = noise * (10^(reqDB/20));
    
    Out = signal + noise;

    %save
    audiowrite(final_write_name,Out,fs);

end

end

'done'

