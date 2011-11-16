%%
% [z, sr]= wavread('a1F.wav');
% 
% 
% formants(z, sr, 'b');
% sound(z, sr);
% pause;
% hold on;
[z, sr]= wavread('a2F.wav');

sound(z, sr);
formants(z, sr, 'b');
pause;
hold on;
% [z, sr]= wavread('a1M.wav');
% 
% 
% formants(z, sr, 'g');
% sound(z, sr);
% pause;
% hold on;
[z, sr]= wavread('a2M.wav');

sound(z, sr);
formants(z, sr, 'g');
pause; hold on;
% [z, sr]= wavread('a1M2.wav');
% 
% 
% formants(z, sr, 'r');
% sound(z, sr);
% pause;
% hold on;
[z, sr]= wavread('a2M2.wav');

sound(z, sr);
formants(z, sr, 'r');
pause;
hold on;

%%
[z, sr] = wavread('a1.wav');

%chebishev windowing
w = window(@chebwin, 128);
[B, s,t] =spectrogram(z, w, [], 128, sr);
L = length(B(:,1));


for i=1:L
    semilogy(1:L, 2*abs(B(:,i)));

    G = findpeaks(1:L,2*abs(B(:,i)),.07, .0006, 2, 3);
    size(G)
    pause;
    
end