function F_VEL = force_vel(V_MAX, V, F_MAX,F_MAXECC, L_TOT, L_REST)
    % muscle model constants are computed for the *current* F_{MAX}
    a = 0.25;
    b = a*V_MAX/F_MAX;

    vSteps = length(V);
    F_VEL(vSteps) = zeros;
    for i = 1:vSteps
        % eccentric on decending + ascending limbs 
        if V(i) > 0 % DYNAMIC FORCE ENHANCEMENT
            F_VEL(i) = (F_MAXECC-F_MAX)/abs(V_MAX) * V(i) + F_MAX;
        else % ISOMETRIC + CONCENTRIC
            F_VEL(i) = a*(V_MAX-V(i))./(b+V(i)); 
        end
        
        % normalize the F-v relationship to maximum force
        F_VEL(i) = F_VEL(i)/F_MAX;
    end
    