function[P_max,Permu_max] = MH_decoder_fun(alph,log_char_freq,log_TransB,f_j)
% for given ciphertext f_j, MaxIt of interatation is runned, 
% best Permutation is returned together with plausibility
    Permutation = [1,2,3,4,5,6,7,8,9]; %Initialize Permuatation as indentity
    P_j = plausibility(alph,log_char_freq,log_TransB,f_j);
    P_max = P_j;
    Permu_max = Permutation;
    MaxIt = 6000;
    % Iterate first MaxIt/2 with slide move
    for k1=1:MaxIt/2
        New_Permu_candidate = slide_move(Permutation);
        f_star = apply_permu(f_j,New_Permu_candidate);
        P_star = plausibility(alph,log_char_freq,log_TransB,f_star);
        f_old = apply_permu(f_j,Permutation);
        P_old = plausibility(alph,log_char_freq,log_TransB,f_old);
        u = rand(1,1);
        if u < exp(min(0,P_star - P_old))
            Permutation = New_Permu_candidate; % Permutation is the one in Markov Chain
        end
        
        if P_star > P_max
            P_max = P_star;
            Permu_max = New_Permu_candidate; 
        end  
    end
    
    % Iterate last MaxIt/2 with swap move
    for k2=1:MaxIt/2
        New_Permu_candidate = swap_move(Permutation);
        f_star = apply_permu(f_j,New_Permu_candidate);
        P_star = plausibility(alph,log_char_freq,log_TransB,f_star);
        f_old = apply_permu(f_j,Permutation);
        P_old = plausibility(alph,log_char_freq,log_TransB,f_old);
        u = rand(1,1);
        if u < exp(min(0,P_star - P_old))
            Permutation = New_Permu_candidate;
        end
        
        if P_star > P_max
            P_max = P_star;
            Permu_max = New_Permu_candidate;
        end  
    end
end
