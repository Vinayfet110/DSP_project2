clc;clear;
 
disp('Reading Sample data file...');
fin = 'flute.wav';
[x,fs] = audioread(fin);
 
disp('Input data loaded...');
disp('____________________');
 
%%
maxv = 1;
N = 8;
mu=255;
xm=1;
 
%%
disp('playing orignal signal...')
sound(x,fs);
mu = 1/mu;
mux = sign(x).*xm.*((log10(1+mu*abs(x./xm)))/log10(1+mu)); % mu transform
 
%%
 
subplot(1,3,1);
 
plot(x);title('Orignal Data');
 
 
 
disp(['Quantizing data (' 'N = ' num2str(N) ') ...']);
 
steps = 2*N;
 
quant_mu_x = quant(mux,steps,maxv);
 
invY = sign(quant_mu_x).*(xm/mu).*(10.^(log10(1+mu).*abs(quant_mu_x)./xm)-1); % take inverse of mu transform
err = mean((invY-x).^2);          % calculating mean squared error ...
 
disp('Quantization Done...')
 
disp(['Quantization Error = ' num2str(err)]);
disp('___________________________________');
 
 
subplot(1,3,2);
 
plot(invY);title(['Quantized Data N=' num2str(N) ' bits']);
 
 
subplot(1,3,3);
 
 
plot((invY-x));title('Quantization error ');
 
pause(3);
 
disp('playing Quantized signal...')
sound(invY,fs);
 
% set(gcf,'units','normalized','outerposition',[0 0 1 1]);
 
fout = ['Quantized' '_' num2str(N) '_bit_mu_Law_' fin];
audiowrite(fout,invY,fs);
