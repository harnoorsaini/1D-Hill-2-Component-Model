function F_LEN = force_length(L_TOT, L_REST)
    SK = 0.25;
    % L_TOT is defined above, the same definition is used here
    Q = L_TOT/L_REST;
    % normalised F-l relationship - no max force
    F_LEN = exp(-((Q-1)/SK).^2);
