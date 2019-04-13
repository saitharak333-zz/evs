filename = 'sad_music.xlsx';

files = dir('*.wav');
audio = cell(1,10786);

A = zeros(10786,27);

% SAD 1 -- Energy of the critical bands

fl1 = [0 100 200 300 400 510 630 770 920 1080 1270 1480 1720 2000 2320 2700 3150];
fh1 = [100 200 300 400 510 630 770 920 1080 1270 1480 1720 2000 2320 2700 3150 3700];


% SAD 2 -- Energy of the critical bands

fl2 = [0 400 800 1200 1600 2000 2400 2800 3200];
fh2 = [400 800 1200 1600 2000 2400 2800 3200 3600];

for k = 1:10786
    
%      Reading an audio file
    audio{k} = audioread(files(k).name);
    [Y, Fs] = audioread(files(k).name);
    
%     SAD 1
    for i=1:17
%       Pass band and Stop band Limits
        pass = (fl1(i) + 5)*2/Fs;
        stop = (fh1(i) - 5)*2/Fs;

%       Filter coefficients
        bhi = fir1(34,[pass stop],'bandpass',chebwin(35,30));

%       Passing through filter
        outhi = filter(bhi,1,Y);
        
%       Energy Calculation
        energy = 0;
        for j = 1:160
            energy = energy + (outhi(i) * outhi(i));
        end
        
%       Updating the energy value into the matrix
        A(k,i+1) = energy;
    end
    
    % SAD 2
    
    for i=1:9
%       Pass band and Stop band Limits
        pass = (fl2(i) + 5)*2/Fs;
        stop = (fh2(i) - 5)*2/Fs;

%       Filter coefficients
        bhi = fir1(34,[pass stop],'bandpass',chebwin(35,30));

%       Passing through filter
        outhi = filter(bhi,1,Y);
        
%       Energy Calculation
        energy = 0;
        for j = 1:160
            energy = energy + (outhi(i) * outhi(i));
        end
        
%       Updating the energy value into the matrix
        A(k,i+1+17) = energy;
    end
    
    A(k, 1) = k;
end

xlswrite(filename,A);
    
disp('finished');