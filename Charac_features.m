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
for i=1:n % 30 millisecond of the frame and 10 millisecond of the overlapping
    if i==1
        sample(:,1) = recording(1:num_of_Samples);
    else
        sample(:,i) = 
        recording(num_Samp*(i-1)+1:num_Samp*(i-1)+num_of_Samples);
    end
end
for i=1:n
   auto(:,i) = xcorr(sample(:,i));%autocorrelation
   [z, ind] = findpeaks(auto(:,i));%Finding the local maxima
   sum_1(i) = mean(diff(ind));
   %Finding the difference in the location of peaks
end  
period = max(sum_1);%Finding the period of the 
fundamental = fs/period;%Finding the fundamental frequency
end



