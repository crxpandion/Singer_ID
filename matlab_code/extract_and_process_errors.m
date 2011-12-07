function [stat] = extract_and_process_errors()

[cc_all, ctf_all] = extract_error('../running_all/results.txt');
[cc_sex, ctf_sex] = extract_error('../running_sex/results.txt');
[cc_type, ctf_type] = extract_error('../running_type/results.txt');

stat = struct;

boxplot(reshape([cc_all, ctf_all], 30, 2), 'labels', {'Mel Freq CC', 'CTF'});
title('Individual Classification');
ylabel('% Correctly Classified'); 
exportPlots('/../figures/boxplots/', 'SingerClassBox');

boxplot(reshape([cc_sex, ctf_sex], 30, 2), 'labels', {'Mel Freq CC', 'CTF'});
title('Sex Classification');
ylabel('% Correctly Classified');
exportPlots('/../figures/boxplots/', 'SexClassBox');

boxplot(reshape([cc_type, ctf_type], 30, 2), 'labels', {'Mel Freq CC', 'CTF'});
title('Voice Type Classification');
ylabel('% Correctly Classified');
exportPlots('/../figures/boxplots/', 'SingerTypeClassBox');

[stat.all.h, stat.all.p, stat.all.ci] = ttest(cc_all, ctf_all);
[stat.sex.h, stat.sex.p, stat.sex.ci] = ttest(cc_sex, ctf_sex);
[stat.type.h, stat.type.p, stat.type.ci] = ttest(cc_type, ctf_type);

fid = fopen('../figures/boxplots/significance.txt', 'w+');

fprintf(fid, 'all h=%d p-value=%g confidence_i=[%f, %f]\n', stat.all.h, ...
                                                       stat.all.p, ...
                                                       stat.all.ci(1), ...
                                                       stat.all.ci(2));
                                                  
fprintf(fid, 'sex h=%d p-value=%g confidence_i=[%f, %f]\n', stat.sex.h, ...
                                                      stat.sex.p, ...
                                                      stat.sex.ci(1), ...
                                                      stat.sex.ci(2));
                                                  
fprintf(fid, 'type h=%d p-value=%g confidence_i=[%f, %f]\n', stat.type.h,...
                                                       stat.type.p,...
                                                       stat.type.ci(1), ...
                                                       stat.type.ci(2));
fclose(fid);

%boxplot
