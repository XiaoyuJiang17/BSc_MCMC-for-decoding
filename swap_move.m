function [permutation] = swap_move(permutation1)
% new permutation(permutation) is created from swap move transformation of given
% permutation (permutation1)
% Permuation1 and Permutation are 1*9 vectors
    r1 = randi(9,1); r2 = randi(9,1);
    permutation = permutation1;
    a =  permutation1(r1);
    permutation(r1) = permutation1(r2);
    permutation(r2) = a;

end
