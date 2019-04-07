filename = 'music.xlsx';

files = dir('*.wav');
audio = cell(1,10786);

A = zeros(10786,161);

for k = 1:10786

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    A(k, 1) = k;
    
    for j = 2:161
        A(k,j) = Y(j-1);
    end
end

xlswrite(filename,A);
    
