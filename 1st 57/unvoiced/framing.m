T = readtable('final.xlsx', 'Sheet',2, 'Range','A1:C240');
arr = zeros(57,1);
cou = 0;

for i = 1:239
    
    filename = num2str(T.Name(i),'%d');
    file = ['rSA1(' filename ').waV'];
    
    [sample, Fs] = audioread(file);
    Y = zeros(160,1);
     
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
        arr(T.Name(i)) = arr(T.Name(i)) + 1;
        filenames = ['unvoiced_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,Y,Fs)
    end
end
disp('Finished');