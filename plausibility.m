function [P] = plausibility(alph,log_char_freq,log_TransB,f)
% Compute the plausibility of given text
% Input:f where f is a text
    P = log_char_freq(strfind(alph,f(1)));
    for i=1:length(f)-1
        P = P + log_TransB(strfind(alph,f(i)), strfind(alph,f(i+1)));
    end 
end
