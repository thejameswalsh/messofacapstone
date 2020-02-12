%%
%playing all files
%go to find the name

file_name = 'm0001_us_m0001_00';
spkr_ID = '01'
extension = '.wav';
last_number = 1;

a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    [samples, fs] = audioread(final_name);
    
%     sound(samples, fs);
    
    %wait for the sound to stop
%     T = numel(samples)/fs;
%     pause(T+1);
    
     speechObject = speechClient('Google','languageCode','en-US');

     tableOut = speech2text(speechObject,samples(:,1),fs)
    
     Table = table2cell(tableOut);
     
     a(i+1,1) = final_name;
     a(i+1,3) = Table(1,1);
     a(i+1,4) = Table(1,2);
    
    
end
%[samples, fs] = audioread('1.wav');
return


%%
%testing section for fs values
file_name = 'm0001_us_m0001_00';
spkr_ID = '01'
extension = '.wav';
last_number  = 4
for i=1:last_number
        if i < 10
        number = strcat('00',int2str(i));
        elseif i < 100
        number = strcat('0', int2str(i));
        else
        number = int2str(i);
    end
    final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)
%     [samples, fs] = audioread(final_name);
%     fs
end

return

%% 
% adding noise
'reverb testing'
file_name = 'f0001_us_f0001_00';
spkr_ID = '01'
extension = '.wav';
last_number = 1000;

a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    [samples, fs] = audioread(final_name);
    
%      sound(samples, fs);
    
    %wait for the sound to stop
%      T = numel(samples)/fs;
%      pause(T+1);
    
    speechObject = speechClient('Google','languageCode','en-US');

    reverb = reverberator

    audioOut = reverb(samples);
    
%          sound(audioOut, fs);
    
    %wait for the sound to stop
%      T = numel(audioOut)/fs;
%      pause(T+1);
    
     tableOut = speech2text(speechObject,audioOut(:,1),fs)
    
     Table = table2cell(tableOut);
     
     a(i+1,1) = final_name;
     a(i+1,3) = Table(1,1);
     a(i+1,4) = Table(1,2);
    
    
end

return

%% 
% adding white noise
'white noise testing'
file_name = 'm0001_us_m0001_00';
spkr_ID = '01'
extension = '.wav';
last_number = 1;

a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    [samples, fs] = audioread(final_name);
    
%      sound(samples, fs);
    
    %wait for the sound to stop
%      T = numel(samples)/fs;
%      pause(T+1);
    
    speechObject = speechClient('Google','languageCode','en-US');

    SNR=40;
    audioOut = awgn(samples,SNR);
    
         sound(audioOut, fs);
    
    %wait for the sound to stop
     T = numel(audioOut)/fs;
     pause(T+1);
    
     tableOut = speech2text(speechObject,audioOut(:,1),fs)
    
     Table = table2cell(tableOut);
     
     a(i+1,1) = final_name;
     a(i+1,3) = Table(1,1);
     a(i+1,4) = Table(1,2);
    
    
end

return

%% 
% adding office ref
'office noise testing'
file_name = 'f0001_us_f0001_00';
spkr_ID = '01'
extension = '.wav';
last_number = 1;

a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    [samples, fs] = audioread(final_name);
    
%      sound(samples, fs);
    
    %wait for the sound to stop
%      T = numel(samples)/fs;
%      pause(T+1);
    
    speechObject = speechClient('Google','languageCode','en-US');

    SNR=20;
%     audioOut = awgn(samples,SNR);

    officeDb = 10^(SNR/40)    
    [office_ref, office_fs] = audioread('office_ref.wav');


len = min(size(samples, 1), size(office_ref, 1));
audioOut = samples(1:len, :) + (officeDb * office_ref(1:len, :));
         sound(audioOut, fs);
    
    %wait for the sound to stop
     T = numel(audioOut)/fs;
     pause(T+1);
    
%      tableOut = speech2text(speechObject,audioOut(:,1),fs)
    
     Table = table2cell(tableOut);
     
     a(i+1,1) = final_name;
     a(i+1,3) = Table(1,1);
     a(i+1,4) = Table(1,2);
    
%     using
% https://www.audioblocks.com/stock-audio/crowd-chatter-ambience-04-bem74yc2iprk0wy4hpo.html
end

return

%% 
% adding office ref using snr function
'office noise testing'
file_name = 'f0001_us_f0001_00';
spkr_ID = '01'
extension = '.wav';
last_number = 1;

a = ["file name","words","ASR words","confidance","WER"];

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    [samples, fs] = audioread(final_name);
    
%      sound(samples, fs);
    
    %wait for the sound to stop
%      T = numel(samples)/fs;
%      pause(T+1);
    
    speechObject = speechClient('Google','languageCode','en-US');

    SNR=40;
    [office_ref, office_fs] = audioread('office_ref.wav');
    
% len = min(size(samples, 1), size(office_ref, 1));
% audioOut = samples(1:len, :) + (officeDb * office_ref(1:len, :));
         sound(audioOut, fs)
    
    %wait for the sound to stop
     T = numel(audioOut)/fs;
     pause(T+1);
    
%      tableOut = speech2text(speechObject,audioOut(:,1),fs)
    
%      Table = table2cell(tableOut);
     
     a(i+1,1) = final_name;
%      a(i+1,3) = Table(1,1);
%      a(i+1,4) = Table(1,2);
    
%     using
% https://www.audioblocks.com/stock-audio/crowd-chatter-ambience-04-bem74yc2iprk0wy4hpo.html
end

return

%% snr play thing

fs = 16000;

[signal]=audioread('f0001_us_f0001_00001.wav');
[noise]=audioread('office_ref.wav');
% [noise_reduced_signal]=audioread('Filtered.wav');
% [noisysignal]=audioread('Noisy.wav');

len = min(size(signal, 1), size(noise, 1));
audioOut = noise(1:len, 1);
audioOut = wgn(74880,1,40);
snr_before = mean( signal.^ 2 ) / mean( audioOut .^ 2 );
snr_before_db1 = 10 * log10( snr_before ) % in dB

snr = 40;
adjusted = snr_before_db - snr;

level = 10^(adjusted/20);

useable = audioOut * level;

snr_before = mean( signal.^ 2 ) / mean( useable .^ 2 );
snr_before_db2 = 10 * log10( snr_before ) % in dB

y = (signal + useable);

sound(y,fs);

T = numel(audioOut)/fs;
     pause(T+1);
     
     sound(awgn(signal,snr), fs)
     
     snr_before = mean( signal.^ 2 ) / mean( awgn(signal, snr) .^ 2 );
snr_before_db3 = 10 * log10( snr_before ) % in dB

%% compare sig strength

fs = 16000;

[signal]=audioread('f0001_us_f0001_00001.wav');
[noise]=audioread('office_ref.wav');

len = min(size(signal, 1), size(noise, 1));
audioOut = noise(1:len, 1);

i1 = mean( signal.^ 2 )
i2 = mean( audioOut.^ 2 )

% i2 = mean( wgn(74880,1,0).^ 2 )

r = i1/i2
snr = 0;
snrj = r - snr;
aO = audioOut * 2*(40^(snrj/20))
i2 = mean( aO.^ 2)

Y = signal + aO;
% r = i1/i2
sound(Y, fs);

nexttile
plot(Y);
title("cool grapth");

% hold on
nexttile
plot(signal)
nexttile
plot(aO)

% hold off

%%
fs = 16000;

[signal]=audioread('f0001_us_f0001_00001.wav');
[noise]=audioread('office_ref.wav');

len = min(size(signal, 1), size(noise, 1));
audioOut = noise(1:len, 1);

noise = wgn(size(signal,1),size(signal,2),0);

signal = signal/sqrt(mean(signal.^2))/100;
audioOut = audioOut/sqrt(mean(audioOut.^2))/100;
noise = noise/sqrt(mean(noise.^2))/100;

sDB = mean( signal.^ 2 ) ;
aDB = mean( audioOut .^ 2 );
nDB = mean( noise .^ 2 );

rsDB = 10 * log10( sDB ) % in dB
raDB = 10 * log10( aDB ) % in dB
rnDB = 10 * log10( nDB ) % in dB

% finding out the new noise db needed
snr = 15 %desried snr in DB
reqDB = rsDB / (10^(snr/20))

noise = noise * (10^(reqDB/20));
audioOut = audioOut * (10^(reqDB/20));

sDB = mean( signal.^ 2 ) ;
aDB = mean( audioOut .^ 2 );
nDB = mean( noise .^ 2 );

rsDB = 10 * log10( sDB ) % in dB
raDB = 10 * log10( aDB ) % in dB
rnDB = 10 * log10( nDB ) % in dB

file_name = 'm0001_us_m0001_00';
write_name = 'm0001_street_'
if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
write_name = strcat(write_name, no, 'dB_m0001_00')
spkr_ID = '01'
extension = '.wav';
last_number = 328;

for j=1:8
snr = j * 5

file_name = 'm0001_us_m0001_00';
write_name = 'm0001_restaurant_'
if snr < 10
    no = strcat('0',int2str(snr));
else
    no = int2str(snr);
end
write_name = strcat(write_name, no, 'dB_m0001_00')
spkr_ID = '01'
extension = '.wav';

for i=1:last_number
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
%     old style
%     final_name = strcat(file_name, spkr_ID,'_',number,'_1',extension)

% new naming style
    final_name = strcat(file_name,number,extension)
    final_write_name = strcat(write_name,number,extension)
    
    %import audio
    [signal, fs] = audioread(final_name);
%     noise = wgn(size(signal,1),size(signal,2),0);
    [noise]=audioread('restaurant_ref.wav');

    len = min(size(signal, 1), size(noise, 1));
    noise = noise(1:len, 1);

    %adjust to be equal
    signal = signal/sqrt(mean(signal.^2))/100; 
    noise = noise/sqrt(mean(noise.^2))/100;
    
    %adjust noise
    reqDB = rsDB / (10^(snr/20));

    noise = noise * (10^(reqDB/20));
    
    Out = signal + noise;

    %save
    audiowrite(final_write_name,Out,fs);
% audiowrite('sample2.wav',awgn(signal, 40),fs);

end

end