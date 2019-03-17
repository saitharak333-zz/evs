files = dir('*.wav');
audio = cell(1,28);

 for k = 1:28
     
     %      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    
    disp(Fs);
    
    pa = 3900/Fs;
    %     FIR filtering
    bhi = fir1(34, pa, 'low', chebwin(35,30));    
    outhi = filter(bhi,1,Y);
    filenames = [num2str(k,'%d') '.wav'];
    audiowrite(filenames,outhi,Fs);
    
 end

