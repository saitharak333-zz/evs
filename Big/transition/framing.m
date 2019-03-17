clc
clear all

T = readtable('final.xlsx', 'Sheet',4, 'Range','A1:B1242');
cou = 0;

for i = 1:1241
    
    [sample, Fs] = audioread(string(T.Name(i)));
    Y = zeros(160,1);
     
    start = T.Start(i);
    start = round(start, 3);
    for r = 1:160
        indexing = uint32(((start)*8000)+r);
        Y(r) = sample(indexing);
    end
        cou = cou + 1;
       
        filenames = ['transition_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,Y,Fs)
end
disp('Finished');