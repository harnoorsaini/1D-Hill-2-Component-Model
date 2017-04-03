function F_VEL = force_vel(V_MAX, V, F_MAX,a , b)
    F_VEL = a*(V_MAX-V)./(b+V);
    % normalize the F-v relationship to maximum force
    F_VEL = F_VEL/F_MAX;