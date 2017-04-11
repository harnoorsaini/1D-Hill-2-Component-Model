function [F_MUSC,F_ACT,F_PASS] = force_muscle(L_TOT, L_REST, V_MAX, V, F_MAX, alpha, F_MAXECC)
    % ACTIVE FORCE
    % force-length relationship 
    F_LEN = force_length(L_TOT, L_REST);
    % force-velocity relationship
    F_VEL = force_vel(V_MAX, V, F_MAX,F_MAXECC, L_TOT, L_REST);
    % total 
    F_CE = alpha*F_LEN*F_VEL;
    F_ACT = F_MAX*F_CE;
    
    % PASSIVE FORCE
    F_PE = parallel_elastic(L_TOT, L_REST);
    % total
    F_PASS = F_MAX*max(F_PE,0);
    
    % TOTAL MUSCLE FORCE
    F_MUSC = F_ACT + F_PASS;