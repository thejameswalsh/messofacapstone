%%
%adding reverb

[samples, fs] = audioread('1.wav');

% sound(samples, fs);

reverb = reverberator

audioOut = reverb(samples);
sound(audioOut, fs);

% %%
% %adding reverb graphs and plays in time
% 
% fileReader = dsp.AudioFileReader('2.wav','SamplesPerFrame',1024);
% deviceWriter = audioDeviceWriter('SampleRate',fileReader.SampleRate);
% 
% % tic
% % while toc < 4
% %     audio = fileReader();
% %     deviceWriter(audio);
% % end
% % release(fileReader)
% 
% reverb = reverberator
% 
% scope = dsp.TimeScope( ...
%     'SampleRate',fileReader.SampleRate, ...
%     'TimeSpanOverrunAction','Scroll', ...
%     'TimeSpan',3, ...
%     'BufferLength',3*fileReader.SampleRate*2, ...
%     'YLimits',[-1,1], ...
%     'ShowGrid',true, ...
%     'ShowLegend',true, ...
%     'Title','Audio with Reverberation vs. Original');
% 
% while ~isDone(fileReader)
%     audio = fileReader();
%     audioWithReverb = reverb(audio);
%     deviceWriter(audioWithReverb);
% %     audiowrite('new.wav', audioWithReverb, 44100);
%     scope([audioWithReverb(:,1),audio(:,1)])
% end
% 
% % sound(audioWithReverb, fs);
% % [samples_, fs_] = audioread('new.wav');
% % sound(samples_, fs_);
% 
% release(fileReader)
% release(deviceWriter)
% release(scope)



%%
%adding noise
% [smaples, fs] = audioread('1.wav');
% f = 200; %noise frequency
% n = [0:1/fs:5];
% 
% x = sin(2*pi*f*n);
% 
% sound(x, fs);
% 
% y = awgn(x, 30); %30 is the SNR
% 
% sound(y, fs);

[samples, fs] = audioread('2.wav');

samples = samples + (randn(size(samples)) /100);

sound(samples, fs)

%%
% adding noise again

%uses communication toolbox

[samples, fs] = audioread('2.wav');

SNR=10;
z=awgn(samples,SNR,'measured');

sound(z, fs);

%%
