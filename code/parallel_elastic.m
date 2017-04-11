function F_PE = parallel_elastic(L_TOT, L_REST)
    c = 0.01;
    d = 10;
    % normalized passive force - no maximum force
    F_PE = c*(exp(d*(L_TOT/L_REST-1))-1);

    