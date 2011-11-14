function [fv] = ProcessSampleAsCC(sample, sr, varargin)
% This function needs to do a couple of things.
% First off it needs to calculate the instantaneous frequency and
% amplitude. Then it needs to perform the CTF estimation based off of the 
% approach suggested in B & W.
% We should be able to use the frequency estimators in
% http://tftb.nongnu.org/
% To determine our ifreq and iamp
%
% ccepstral coefficients vs formants
%
addpath('rastamat');

fv = melfcc(sample, sr, varargin);

end
