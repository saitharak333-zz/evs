filename = 'unvoiced.xlsx';

files = dir('*.wav');
audio = cell(1,8777);

A = zeros(8777,161);

for k = 1:8777

%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    A(k, 1) = k;
    
    for j = 2:161
        A(k,j) = Y(j-1);
    end
end

xlswrite(filename,A);
