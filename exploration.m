%%
[z, sr]= wavread('test_samples/a1M.wav');
formants(z, sr, 'b');
hold on

[z, sr]= wavread('test_samples/a1M2.wav');
formants(z, sr, 'b');
hold on;
% [z, sr]= wavread('test_samples/a1M.wav');
% 
% 
% formants(z, sr, 'g');
% hold on;
% 
% [z, sr]= wavread('test_samples/a2M.wav');
% formants(z, sr, 'g');
% hold on;
% [z, sr]= wavread('test_samples/a1M2.wav');
% 
% 
% formants(z, sr, 'r');
% hold on;
% [z, sr]= wavread('test_samples/a2M2.wav');
% formants(z, sr, 'r');
% hold on;

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