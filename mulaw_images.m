5. This program is to test the Mu-law quantization on images
clc;clear;
 
disp('Reading Sample data file...');
 
im = imread('peppers.jpg');
% im = rgb2gray(im);
im = im2double(im);
figure('name','mu law quantization');
disp('Input data loaded...');
disp('____________________');
subplot(131);
imshow(im);title('Orignal Data');
% im = double(im);
%%
mu=255;
xm = 1;
maxv = 1;
N = 6;
 
%%
mu = 1/mu;
mux = sign(im).*xm.*((log10(1+mu*abs(im./xm)))/log10(1+mu)); % mu transform
 
%%
[r,c,z]=size(mux);
disp(['Quantizing data (' 'N = ' num2str(N) ') ...']);
 
steps = 2*N;
 
for j=1:z
    for i=1:r
        
        quant_mu_x(i,:,j) = quant(mux(i,:,j),steps,maxv);
        
    end
end
 
invY = sign(quant_mu_x).*(xm/mu).*(10.^(log10(1+mu).*abs(quant_mu_x)./xm)-1); % take inverse of mu transform
 
err = (invY- im);
MSE_err = mean(mean(mean(err.^2)));
 
disp('Quantization Done...')
 
disp(['Quantization Error = ' num2str(MSE_err)]);
disp('___________________________________');
 
subplot(1,3,2);
 
imshow((invY));title(['Quantized Data N=' num2str(N) ' bits']);
 
subplot(1,3,3);
 
imshow(abs(invY-im));title('Error signal');
 
% set(gcf,'units','normalized','outerposition',[0 0 1 1]);
 


