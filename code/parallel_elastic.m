function F_PE = parallel_elastic(L_TOT, L_REST, F_MAX)
    c = 0.01;
    d = 10;
    F_PE = F_MAX*c*(exp(d*(L_TOT/L_REST-1))-1);
    % normalize the F-v relationship to maximum force
    F_PE = F_PE/F_MAX;
    