% Main Part of the project: using Metropolis-Hasting algorithm to find best
% permutation (Permu_max), apply it to the whole ciphertext for decryption
clear;clc;
Num_MH = 20; % Run the Metropolis-Hastings algorithm 20 times
ciphertext = fileread("ciphertext.txt");
l = 9; % key length
% Initialize P_max and Permu_max
P_max = -inf; 
Permu_max = [1,2,3,4,5,6,7,8,9];

load('alph.mat');
load('log_char_freq.mat');
load('log_TransB.mat');


% loop Num_MH time for searching Permutation with Maximum plausibility value
for i=1:Num_MH
% Run Metropolis-Hastings algorithm for Num_MH times, 
% each time with MaxIt iterations
% For each run of MH algorithm, f_j is randomly created for decryption
    j = randi(30,1); % Uniformly select an integer from 1 to 30
    f_j = ciphertext(j*l+1:end);% delecting the first j blocks
    [P_candidate,Permu_candidate] = MH_decoder_fun(alph,log_char_freq,log_TransB,f_j);
    if P_candidate > P_max
        P_max = P_candidate;
        Permu_max = Permu_candidate;
    end          
end

plaintext = apply_permu(ciphertext,Permu_max);% Permu_max is applied to the whole ciphertext
P_plaintext = plausibility(alph,log_char_freq,log_TransB,plaintext);% Calculate corresponding plausibility
% decrypted text is stored in plaintext.txt
fileID = fopen("plaintext.txt",'w');
fprintf(fileID,plaintext);
fclose(fileID);


