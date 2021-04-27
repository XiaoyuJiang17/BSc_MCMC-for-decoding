% Run this piece of code, freq vector and TranB table will be created and
% their transformed values (log) will be stored as log_char_freq and log_TransB
clear;clc;
filename = 'data.txt';
file = fileread(filename);
alph = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' '];
save alph

file_len = length(file);
alph_len = length(alph);

char_freq = zeros(alph_len,1);
for i=1:alph_len
    idx = strfind(file,alph(i));
    char_freq(i) = length(idx) / file_len;
end
log_char_freq = log(char_freq);
save log_char_freq

TransB = zeros(alph_len,alph_len); % Initialize TransB
for i=1:file_len-1
    char1 = file(i);
    char2 = file(i+1);
    indexOfchar1 = strfind(alph,char1);
    indexOfchar2 = strfind(alph,char2);
    TransB(indexOfchar1,indexOfchar2) = TransB(indexOfchar1,indexOfchar2) + 1;
end

unnormalized_TransB = TransB; %Used for Question Answering
save unnormalized_TransB

Diag = diag(1./sum(TransB,2));
TransB = Diag * TransB; % Normalize each row
% Replace -Inf values in log_TransB by a small value -12
log_TransB = log(TransB);
[x,y] = find(log_TransB == -inf);
for i=1:length(x)
    log_TransB(x(i),y(i)) = -12;
end

save log_TransB