[y, fs] = audioread('1.wav');
speechObject = speechClient('Google','languageCode','en-US');

%tableOut = speech2text(speechObject,y(:,1),fs)
Nt = 300;
sz = [Nt 2];
varTypes = {'string','string','double'};
Table = table('Size',sz,'VariableTypes',varTypes);
for i = 1:Nt
    Table(i,1) = table(1,1);
    Table(i,2) = table(1,2);
end
