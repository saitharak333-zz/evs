files = dir('*.wav');
audio = cell(1,338);

for k = 1:338

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    filenames = ['transition_' num2str(k+1241,'%d') '.wav'];
    audiowrite(filenames,Y,Fs)
    
end

disp('finished');