z = wavread('test.wav');

%chebishev windowing
w = window(@chebwin, 128);
[B, s,t] =spectrogram(z, w, [], 128, 8000);
L = length(B(:,1));
G = zeros(L,4);
for i=1:L
    plot(1:L, 2*abs(B(:,i)/128));

    G(i, :) = findpeaks(1:L,2*abs(B(:,i)/128),.07, .00002, 2, 3);
end


