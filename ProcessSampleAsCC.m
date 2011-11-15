function [fv] = ProcessSampleAsCC(sample, sr, varargin)
% This function needs to do a couple of things.
% ccepstral coefficients

addpath('rastamat');

%add handling of varargins... also how should we choose featue vects for
%CC?
fv = melfcc(sample, sr);
end
