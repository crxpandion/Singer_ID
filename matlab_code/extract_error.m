function [cc_err, ctf_err] = extract_error(results_file)
%
fid = fopen(results_file, 'r');

cc_err = [];
ctf_err = [];
errors = textscan(fid, '%[^_] %s %s %s %d %f %s');
error = errors{6};
type = errors{1};

fclose(fid);

for i = 1:length(error)
    if strcmp(type(i), 'cepstral')
       cc_err(end+1) =  error(i);
    else
       ctf_err(end+1) =  error(i); 
    end
    
end



