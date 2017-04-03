function F_MUSC = force_muscle(L_TOT, L_REST, V_MAX, V, a, b, F_MAX, alpha)
    F_LEN = force_length(L_TOT, L_REST, F_MAX);
    F_VEL = force_vel(V_MAX, V, F_MAX, a, b);
    F_PE = parallel_elastic(L_TOT, L_REST, F_MAX);

    F_CE = alpha*F_LEN*F_VEL;
    F_MUSC = F_MAX*(F_CE + max(F_PE,0));