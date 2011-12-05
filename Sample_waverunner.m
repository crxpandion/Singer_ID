function [f, cc] = Sample_waverunner(wav_list_path)
%

addpath('rastamat');
fid = fopen([ wav_list_path, 'files.txt'], 'r');

C = textscan(fid, '%s'); 
C = C{1,1};

labels = struct;
labels.name = cell(size(C));
labels.note = cell(size(C));
labels.range = cell(size(C));
fclose(fid);

[z, sr] = wavread([wav_list_path C{1}]);
x = formants(z, sr);
fprintf(1, '# of points: %d\n', length(x));
f = zeros(size(C, 1), length(x));
w = zeros(size(f));
x = calc_and_avg_cc(z, sr);

cc = zeros(size(C, 1), length(x));

for i = 1:length(C)

    substr =  regexp(C(i), '/', 'split');
    substr = substr{:};
    labels.name(i) = substr(2);
    labels.note(i) = substr(5);
    labels.vowel(i) = substr(4);
    labels.range(i) = substr(3);
        
    [z, sr] = wavread([wav_list_path C{i}]);
    [f(i, :), w(i, :)] = formants(z, sr);
    cc(i, :) = calc_and_avg_cc(z, sr);
    
    if (i > 1 && (abs(sum(w(i, :) - w(i-1, :))) > 0))
        disp('wellsit');
    end
    
    
end
[pc score] = princomp(f);

%delete('formant_vec.awesome');
%delete('cepstral_vec.awesome');
%delete('pca_format_vec.awesome');
%write_matrix(score(:, 1:100),labels,  'pca_format_vec.awesome');
write_matrix(f, labels, 'formant_vec_male.txt');
write_matrix(cc, labels, 'cepstral_vec_male.txt');
end

function [cc] =calc_and_avg_cc(z, sr)
%
tmp_cc = melfcc(z, sr);

cc = sum(tmp_cc, 2)./size(tmp_cc,2);

end

function [] = write_matrix(matrix, labels, file)
%
fid = fopen(file, 'a+');
[m,n] = size(matrix);

fprintf(fid, '%s, %s, %s, %s', 'name', 'vowel', 'range', 'sex');
for i = 1:n
    fprintf(fid, ', %s%d', 'dim', i);
end
fprintf(fid, '\n');


   for i = 1:m
    if sum(strcmp(labels.name{i}, {'bryce_bartu', 'mike_brand',...
                                   'cary', 'alan_taylor',...
                                   'nathan_taylor', 'eric_rome'}))
        %continue;
        sex = 'male';
    else
        continue;
        %sex = 'female';
    end
    fprintf(fid, '%s, %s, %s, %s', labels.name{i}, ...
                                   labels.vowel{i}, ...
                                   labels.range{i}, ...
                                   sex);
    for j = 1:n
        fprintf(fid, ', %.6f', matrix(i,j));
    end
    fprintf(fid, '\n');
   end

fclose(fid);
end
