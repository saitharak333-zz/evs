files = dir('*.wav');
audio = cell(1,4737);

for k = 1:4737

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    filenames = ['voiced_' num2str(k+19066,'%d') '.wav'];
    audiowrite(filenames,Y,Fs)
    
end