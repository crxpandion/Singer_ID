function [iF] = instFrequency(sample, sr)
% 
%
%
k = 10; %max number of sineusoids
window_s = 128;

w = window(@chebwin, window_s);
B = spectrogram(sample, w, [], window_s, sr);

K = zeros(length(B(1,:)), k);
for i = 1:length(B(:,1))
    findpeaks(1:L,abs(B(:,i)),.07, .0006, 2, 3);
    
end


end


function [k_j] = trackFrequencies(k_i, b)
%
peaks = findpeaks(1:L, log10(abs(b)),.07*9, -2.5, 2, 7,1);
[freqs, II] = sort(peaks(:,2)); %sort frequencies

m = size(peaks,1);
n = size(k_i, 2);
d_f = .01;

k_j = zeros(size(k_i));
matched_old = zeros(size(k_i));
matched_new = zeros(size(freqs));
% for each frequency in the previous time find its match
for i = 1:n
    I = find(freqs < (k_i(i, 1) + d_f) & freqs > (k_i(i, 1) - d_f));
    if ~isempty(I)        
        for j = 1:length(I)
            if ~matched_old(i)
                matched_old(i) = 1;
                matched_new(I(j)) = 1;
                k_j(i, 1) = k_j(i, 1); 
                k_j(i, 2) = peaks(I(j),3); %amplitude 
                break;
            end        
        end
    end  
end

for 

end