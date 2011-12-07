% cepstral all results
% === Confusion Matrix ===
% 
%   a  b  c  d  e  f  g  h  i  j  k   <-- classified as
%  44  6  2  9  3  7  1  0  3  0  0 |  a = alison
%   4 57  1  2  4  2  1  1  1  0  2 |  b = kimmy
%   7  2 54  0  8  0  4  0  0  0  0 |  c = angela_harrington
%   8  1  4 48  0  7  5  0  0  1  1 |  d = sadie_frazier
%   5  0  8  2 57  1  0  0  1  0  1 |  e = emily_spencer
%   8  2  0  8  0 44  7  0  0  0  1 |  f = nina_dante
%   2  0  4  4  0  7 55  0  0  1  2 |  g = stephanie_feigenbaum
%   0  0  0  0  0  0  0 73  0  1  1 |  h = nathan_taylor
%   1  1  0  0  3  0  0  1 69  0  0 |  i = cary
%   0  0  0  1  0  0  2  2  0 67  3 |  j = mike_brand
%   2  1  0  0  0  1  4  1  0  2 64 |  k = eric_rome
% 
% formants all results
% === Confusion Matrix ===
% 
%   a  b  c  d  e  f  g  h  i  j  k   <-- classified as
%  40  2  5  5  5  2  3  1  6  0  6 |  a = alison
%   3 49  8  3  1  4  3  0  1  1  2 |  b = kimmy
%   6  3 48  2  4  2  7  0  0  2  1 |  c = angela_harrington
%   1  3  4 47  2  8  1  0  0  3  6 |  d = sadie_frazier
%   8  1  2  0 62  0  0  0  2  0  0 |  e = emily_spencer
%   3  6  0  5  2 44  3  0  1  3  3 |  f = nina_dante
%   1  4  4  7  0  4 48  1  1  1  4 |  g = stephanie_feigenbaum
%   0  1  0  1  0  0  0 68  0  3  2 |  h = nathan_taylor
%   2  0  0  0  1  0  1  0 70  1  0 |  i = cary
%   1  2  0  1  0  3  2  2  0 53 11 |  j = mike_brand
%   1  0  0  3  1  2  6  0  0  6 56 |  k = eric_rome

%cepstral type
% === Confusion Matrix ===
% 
%    a   b   c   d   e   <-- classified as
%  170  43   5   2   0 |   a =  soprano
%   52 240   1   5   2 |   b =  mezzo
%    4   6 136   0   4 |   c =  tenor
%    3   4   1  67   0 |   d =  baritone
%    1   0   1   0  73 |   e =  bass


%formant type
% === Confusion Matrix ===
% 
%    a   b   c   d   e   <-- classified as
%  157  43   9   8   3 |   a =  soprano
%   55 228  10   4   3 |   b =  mezzo
%    4  12 128   0   6 |   c =  tenor
%    2   2   0  71   0 |   d =  baritone
%    8   2   8   0  57 |   e =  bass
   
clear all
clc
close all

% ALL

cepstralResults = [  
   44  6  2  9  3  7  1  0  3  0  0 ;
   4 57  1  2  4  2  1  1  1  0  2 ;
   7  2 54  0  8  0  4  0  0  0  0 ;
   8  1  4 48  0  7  5  0  0  1  1 ;
   5  0  8  2 57  1  0  0  1  0  1 ;
   8  2  0  8  0 44  7  0  0  0  1 ;
   2  0  4  4  0  7 55  0  0  1  2 ;
   0  0  0  0  0  0  0 73  0  1  1 ;
   1  1  0  0  3  0  0  1 69  0  0 ;
   0  0  0  1  0  0  2  2  0 67  3 ;
   2  1  0  0  0  1  4  1  0  2 64 ];

formantResults = [
  40  2  5  5  5  2  3  1  6  0  6 ;
   3 49  8  3  1  4  3  0  1  1  2 ;
   6  3 48  2  4  2  7  0  0  2  1 ;
   1  3  4 47  2  8  1  0  0  3  6 ;
   8  1  2  0 62  0  0  0  2  0  0 ;
   3  6  0  5  2 44  3  0  1  3  3 ;
   1  4  4  7  0  4 48  1  1  1  4 ;
   0  1  0  1  0  0  0 68  0  3  2 ;
   2  0  0  0  1  0  1  0 70  1  0 ;
   1  2  0  1  0  3  2  2  0 53 11 ;
   1  0  0  3  1  2  6  0  0  6 56 ];

labels = cellstr(('A':'K')');
labels = {'Soprano1'; 'Mezzo3'; 'Mezzo1'; 'Soprano3'; 'Mezzo2'; 'Soprano2'; 'Mezzo4'; 'Tenor2'; 'Baritone1'; 'Baritone2'; 'Tenor1'};

figure;
heatmap(cepstralResults, labels, labels, 'Colorbar', true);
dir = '/../figures/Confusion/'
exportPlots(dir, 'Cepstral_all_Confusion');

figure;
heatmap(formantResults, labels, labels, 'Colorbar', true);
exportPlots(dir, 'Formant_all_Confusion');

% TYPE

labels = {'Soprano', 'Mezzo', 'Tenor', 'Baritone', 'Bass'};
cepstralType = [
    170  43   5   2   0;
   52 240   1   5   2 ;
    4   6 136   0   4 ;
    3   4   1  67   0 ;
    1   0   1   0  73];

figure;
heatmap(cepstralType, labels, labels, 'Colorbar', true);
exportPlots(dir, 'Cepstral_Type_Confusion');


formantType = [
  157  43   9   8   3;
   55 228  10   4   3;
    4  12 128   0   6;
    2   2   0  71   0;
    8   2   8   0  57];

figure;
heatmap(formantType, labels, labels, 'Colorbar', true);
exportPlots(dir, 'Formant_Type_Confusion');

% SEX

labels = {'Soprano', 'Mezzo', 'Tenor', 'Baritone', 'Bass'};
cepstralType = [
    170  43   5   2   0;
   52 240   1   5   2 ;
    4   6 136   0   4 ;
    3   4   1  67   0 ;
    1   0   1   0  73];

figure;
heatmap(cepstralType, labels, labels, 'Colorbar', true);
exportPlots(dir, 'Cepstral_Type_Confusion');
