clc;clear;
 
disp('Reading Sample data file...');
 
im = imread('peppers.jpg');
% im = rgb2gray(im);
im = im2double(im);
 
disp('Input data loaded...');
disp('____________________');
subplot(121);
imshow(im);title('Orignal Data');
% im = double(im);
mu=255;
log_part = (log(log(log(1+mu*abs(im))))/log(log(log(1+mu))));
mux = sign(im).*log_part; % mu transform
 
%%
[r,c,z]=size(mux);
 
maxv = 1;
 
N = 128;
 
disp(['Quantizing data (' 'N = ' num2str(N) ') ...']);
 
steps = 2*N;
for j=1:z
    for i=1:r
        quant_mu_x(i,:,j) = quant(mux(i,:,j),steps,maxv);
        
        invY(i,:,j) = sign(quant_mu_x(i,:,j)).*(1/mu).*((1+mu).^abs(quant_mu_x(i,:,j))-1); % take inverse of mu transform
    end
end
 
 
disp('Quantization Done...')
 
 
disp('___________________________________');
 
subplot(1,2,2);
 
imshow((invY));title(['Quantized Data N=' num2str(N) ' bits']);
 
 
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
 


