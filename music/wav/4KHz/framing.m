clc
clear all

files = dir('*.wav');
audio = cell(1,10);
cou = 0;

 for k = 1:10

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    
%     Counting the number of sub audio files
    numbr = floor(length(Y)/160);
    
%     New Audio file
    New = zeros(160,1);
    
%     Iterating through all the sub audio files
    for c = 1:numbr
        for r = 1:160
            indexing = uint32(((c-1)*160)+r);
            New(r) = Y(indexing);
        end
        cou = cou + 1;
        filenames = ['music_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,New,Fs)
    end
 end
 
 disp('Finished');