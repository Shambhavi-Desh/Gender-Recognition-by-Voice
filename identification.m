feature_table = table();

for window = 1:70   % for the 70 audios which are being used as training set
   filename=['s' num2str(window) '.wav'];   
    % assign .wav audio files from current folder to variable 'filename'
   feature_table.Audio_name(window, 1) = window;    
   % storing audio number in table column 'Audio_name'
   [y,fs] = audioread(filename);     
   %read audio file where y is audio data file and fs is sampling rate in Hz
   [fundamental_freq,coeffs] = Charac_features(y,fs);   
   % Finding features by calling function Charac_features
feature_table.fundamental_freq(window, 1) = fundamental_freq;    
   %store fundamental frequency in a new column of the table   
   MFCC =                                                                                                                                                           
{'MFCC1','MFCC2','MFCC3','MFCC4','MFCC5','MFCC6','MFCC7','MFCC8','MFCC9','MFCC10','MFCC11','MFCC12'};
   for k=1:12
       feature_table.(MFCC{k})(window, 1) = coeffs(k);  
       %store MFCC coefficients from 1 to 12 in separate table columns
   end
end

disp(feature_table)     %display table contains extracted features
writetable(feature_table,'features.xls');   %write table to file
% Testing dataset is ready. Similarly find training dataset
