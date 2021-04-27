% Q2 Five least frequent characters in <War and Peace> in increasing order

clear; clc;
load log_char_freq; freq = log_char_freq;
load alph; alp = alph;
load unnormalized_TransB; TransB = unnormalized_TransB;
Min_inc_index = zeros(1,5); %increase order
for j = 1:5
    [m,index] = min(freq);
    Min_inc_index(j) = index;
    freq(index) = +inf; 
end
Sol_Q2 = alp(Min_inc_index);


%Q3 Five most frequent transitions
Max_dec_index = zeros(2,5); %Each column represents one transition
for j = 1:5
    n = max(max(TransB));
    [row,col] = find(TransB==n);
    Max_dec_index(1,j) = row;
    Max_dec_index(2,j) = col;
    TransB(row,col) = -inf; 
end
Sol_Q3 = alp(Max_dec_index);