%1. This program only gives the graphs of original sound signal and quantized signals for N=2, 8, 16 (Change value of N in the program)
% test quantization
clc;clear;
 
disp('Reading Sample data file...');
fin = 'flute.wav';
[x,fs] = audioread(fin);
% x = im2double(x);
disp('Input data loaded...');
disp('____________________');
 
disp('playing orignal signal...')
sound(x,fs);
%% 
maxv = 1;
 
N =16;              %  N value
%% 
figure('name','uniform quantization');
subplot(1,3,1);
 
plot(x);title('Orignal Data');
 
[r,c,z]=size(x);
 
 
disp(['Quantizing data (' 'N = ' num2str(N) ') ...']);
 
steps = 2*N;
 
for j=1:z
    
    for i=1:r
        
 
        
        y(i,:,j) = quant(x(i,:,j),steps,maxv);
        
 
    end
end
 
err = abs(y - x) ;
 
MSE_err = mean(mean(mean(err.^2)));
 
 
 
 
disp('Quantization Done...')
 
disp(['Quantization Error = ' num2str(MSE_err)]);
disp('___________________________________');
 
subplot(1,3,2);
 
plot(y);title(['Quantized Data N=' num2str(N) ' bits']);
 
subplot(1,3,3);
 
plot(abs(y-x));title('Error signal');
 
pause(2);
 
disp('playing Quantized signal...')
sound(y,fs);
 
fout = ['Quantized_' num2str(N) '_bits_uniform_' fin];
audiowrite(fout,y,fs);
 
