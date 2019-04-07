files = dir('*.wav');
audio = cell(1,1225);

for k = 1:1225

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    filenames = ['unvoiced_' num2str(k+7552,'%d') '.wav'];
    audiowrite(filenames,Y,Fs)
    
end

disp('finished');