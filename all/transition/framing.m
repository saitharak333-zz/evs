T = readtable('final.xlsx', 'Sheet',4, 'Range','A1:C339');
arr = zeros(57,1);
cou = 0;

for i = 1:338
    
    filename = num2str(T.Name(i),'%d');
    file = ['rSA1(' filename ').waV'];
    
    [sample, Fs] = audioread(file);
    Y = zeros(160,1);
     
    start = T.Start(i);
    start = round(start, 3);
    for r = 1:160
        indexing = uint32(((start)*8000)+r);
        Y(r) = sample(indexing);
    end
        cou = cou + 1;
        arr(T.Name(i)) = arr(T.Name(i)) + 1;
        filenames = ['transition_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,Y,Fs)
end
disp('Finished');