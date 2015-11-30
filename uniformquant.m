% test quantization
clc;clear;
 
disp('Reading Sample data file...');
fin = 'peppers.jpg';
x = imread(fin);
x = im2double(x);
disp('Input data loaded...');
disp('____________________');
 
%%
maxv = 1;
N =16;              %  N value
 
%% 
figure('name','uniform quantization');
subplot(1,3,1);
 
imshow(x);title('Orignal Data');
 
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
 
imshow(y);title(['Quantized Data N=' num2str(N) ' bits']);
 
subplot(1,3,3);
 
imshow(abs(y-x));title('Error signal');
 
