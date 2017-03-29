%% 1D Muscle Model based on the *Hill* 3-Element Model

clear all
%% Global plotting options

fnum = 1;
opt_grid = 'on';
opt_hold =  'off';
splotx = 0;
sploty = 0;
%% Global muscle properties
% $L_{rest}$ is the muscle resting length, $P_{max}$ is the maximum force the 
% muscle can produce and $v_{max}$ is the maximum velocity of shortening.

L_REST = 0.5; %mm
F_MAX = 5; %N
V_MAX = 1.5; %mm/s
%% 
% $a$ and $b$ are shape constants for the muscle force-velocity relationship

% muscle model constants
a = 0.25;
b = a*V_MAX/F_MAX;
%% Parallel elastic element
% This element represents the passive response of the muscle upon streching 
% greater than resting length.
% 
% Note that $L_{PE}=L_{TOT}=L_{CE}$
% 
% The form of the passive relationship is not easily found in literature 
% and is implemented in a straight forward way here to match the requirements 
% of an exponential form which is non-zero above $L_{rest}$. Parameter $c$ is 
% introduced to tune the shape of the curve. 

c = 1;
L_TOT = (0:0.001:L_REST*2);
F_PE = F_MAX*c*(exp(L_TOT/L_REST-1)-1); 

xvec = L_TOT/L_REST;
yvec = F_PE;
ftitle = 'Passive stretch of muscle';
xtitle = 'L_{TOT}/L_{REST} (mm)';
ytitle = 'Force (N)';
plotxy(xvec, yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)
%% Contractile element
% This element is reponsible for the active force production in the muscle. 
% The total force is given in the form:
% 
% $$F_{CE} = \alpha(t) \times F_{vel}(V)\times F_{len}(L_{TOT})$$
% 
% As a first step, we assume that the muscle is fully tetanized, i.e. $\alpha(t) 
% = 1$. 
% 
% Force-velocity* *
% 
% Taken from _"Muscle modelling basics"_ by Challis, J. (1994), who based 
% it on on Hill (1938),
% 
% $$F_{VEL} = \frac{a(V_{MAX}-V)}{(b-V)}$$
% 
% where $a$ and $b$ have been fit to $V_{MAX}$ and $F_{MAX}$.

V = 0:0.01:1.1*V_MAX;
F_VEL = a*(V_MAX-V)./(b+V);
% normalize the F-v relationship to maximum force
F_VEL = F_VEL/F_MAX;
xvec = V;
yvec = F_VEL;
ftitle = 'Force-Velocity Relationship of F_{CE}';
xtitle = 'V (mm/s)';
ytitle = 'F_{VEL}/F_{MAX} (N)';
plotxy(xvec, yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)
%% 
% Force-Length
% 
% The force-length relationship is also taken from _"Muscle modelling basics"_ 
% by Challis, J. (1994), who based it on on Hatze (1981),