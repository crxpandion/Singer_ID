%%
Sample_waverunner('../clean_samples/samples/normalized/');

%%
[z, sr]= wavread('../samples/mezzo1/mid/a/a1.wav');
formants(z, sr, 'b');

hold on;
[z, sr]= wavread('../samples/soprano1/mid/a/a2.wav');
formants(z, sr, 'r');
xlabel('Frequency (Hz)')
ylabel('Log Scale Frequency Response')
title('CTF')
exportPlots('/../figures/CTF/', 'comparisionMezzo1Soprano1CTF');
exportPlots('/../figures/CTF/', 'comparisionMezzo1Soprano1CTF');


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