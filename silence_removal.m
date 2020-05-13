function new_signal = silence_removal(fs,audio)

    frame_length = 0.01*fs;   % 0.01 per frame
    N = length(audio);  %taking the length of the audio
    num_frames = floor(N/frame_length);    %find number of frames
    voiced_sig = zeros(N,1);
    count = 0;
    
    for k = 1:num_frames   
       frame = audio((k-1)*frame_length+1 : frame_length*k);  
       % defining frame divisions in the audio
       maximum = max(frame);    % find maximum amplitude in the frame
       %only append signal at amplitude >0.02 (0.02 is threshold amplitude)
         if(maximum > 0.02)   
  % if the condition is true the frame is voiced else it is considered unvoiced
            count = count+1;    
            voiced_sig((count-1)*frame_length+1 : frame_length*count) = frame; 
            %assign voiced frame as new silence removed signal
       end
  end
  
    % 'find' finds the last index corresponding to nonzero elements in new_sig
    new_signal = voiced_sig(1:find(voiced_sig, 1, 'last'));
end


       
