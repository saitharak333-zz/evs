clc
clear all

cou = 0;

for i = 1:7500
    
%     Randomly picking 2 unvoiced samples
    un_i = randi(7552);
    un_j = randi(7552);
    
%     Randomly picking 3 voiced samples
    vo_i = randi(19066);
    vo_j = randi(19066);
    vo_k = randi(19066);
    
%     Converting into their filenames
    un_file1 = ['unvoiced_' num2str(un_i, '%d') '.wav'];
    un_file2 = ['unvoiced_' num2str(un_j, '%d') '.wav'];
    
    vo_file1 = ['voiced_' num2str(vo_i, '%d') '.wav'];
    vo_file2 = ['voiced_' num2str(vo_j, '%d') '.wav'];
    vo_file3 = ['voiced_' num2str(vo_k, '%d') '.wav'];
    
%     Extracting the samples from the files
    [un_sam1, Fs1] = audioread(un_file1);
    [un_sam2, Fs2] = audioread(un_file2);
    
    [vo_sam1, Fs3] = audioread(vo_file1);
    [vo_sam2, Fs4] = audioread(vo_file2);
    [vo_sam3, Fs5] = audioread(vo_file3);
    
    Y = zeros(160,1);
    Fs = 8000;

    for r = 1:160
        Y(r) = un_sam1(r) + un_sam2(r) + vo_sam1(r) + vo_sam2(r) + vo_sam3(r);
    end
        cou = cou + 1;
        filenames = ['multi_' num2str(cou,'%d') '.wav'];
        audiowrite(filenames,Y,Fs)
        
end

disp('Finished');