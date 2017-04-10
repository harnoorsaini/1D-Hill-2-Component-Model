function [F_MUSC,F_ACT,F_PASS] = force_muscle(L_TOT, L_REST, V_MAX, V, F_MAX, alpha, F_MAXECC)
    F_LEN = force_length(L_TOT, L_REST, F_MAX);
    F_VEL = force_vel(V_MAX, V, F_MAX,F_MAXECC);
    F_PE = parallel_elastic(L_TOT, L_REST, F_MAX);
    F_CE = alpha*F_LEN*F_VEL;

    F_ACT = F_MAX*F_CE;
    F_PASS = F_MAX*max(F_PE,0);
    
    F_MUSC = F_MAX*(F_CE + max(F_PE,0));