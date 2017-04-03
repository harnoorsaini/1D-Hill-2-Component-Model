function F_LEN = force_length(L_TOT, L_REST, F_MAX)
    SK = 0.25;
    % L_TOT is defined above, the same definition is used here
    Q = L_TOT/L_REST;
    F_LEN = F_MAX*exp(-((Q-1)/SK).^2);
    % normalise the F-l relationship to max force
    F_LEN = F_LEN/F_MAX;