function [f_new] = apply_permu(f,permutation)
% Transform the given text f to new text f_new according to given permutation
    l = 9; % key length
    num_blocks = length(f) / l;
    for b = 0:num_blocks-1
        for i = 1:l
            f_new(b*l + i) = f(b*l + permutation(i));
        end
    end
end