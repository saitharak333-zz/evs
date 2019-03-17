clc
clear all

T = readtable('final.xlsx', 'Sheet',3, 'Range','A1:C2001');
cou = 0;

for i = 1:2000
    
    [sample, Fs] = audioread(string(T.Name(i)));
    Y = zeros(160,1);
    disp(Fs)
    start = T.Start(i);
    start = round(start, 3);
    stop = T.Stop(i);
    stop = round(stop, 3);
    k = floor((stop - start)/0.02);

    for c = 1:k
        for r = 1:160
            indexing = uint32(((start)*8000)+((c-1)*160)+r);
            Y(r) = sample(indexing);
        end
        cou = cou + 1;
        filenames = ['unvoiced_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,Y,Fs)
    end
end

disp('Finished');