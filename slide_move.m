function [permutation2] = slide_move(permutation1)
% new permutation(permutation2) is created from slide move transformation of given
% permutation (permutation1)
% Permuation1 and Permutation2 are 1*9 vectors
    l = 9;
    b = randi(l-2,1);
    k1 = randi(l-b+1,1);
    k2 = randi([0,l-b],1);
    Deleted_Part = permutation1(k1:k1+b-1);
    Remainder_Part = permutation1([1:k1-1 k1+b:end]);
    permutation2 = [Remainder_Part(1:k2) Deleted_Part Remainder_Part(k2+1:end)];
end
