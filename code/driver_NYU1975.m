clear all

%% global plotting options
fnum = 1;
opt_grid = 'on';
opt_hold =  'on';
splotx = 3;
sploty = 2;

% global muscle properties
Lopt = 0.75; %mm
Pmax = 100; %N
Vmax = 2; %mm/s

% muscle model constants
a = 0.25;
b = a*Vmax/Pmax;

%% series elastic element
% recall that x = L - L_ce = L_se (series element)
x = (-1:0.001:1);
L_se = x;
P_series = a*(exp(x/Lopt)-1); 

xvec = L_se;
yvec = P_series;
ftitle = 'Passive stretch of muscle';
xtitle = 'L_{se} (mm)';
ytitle = 'force (N)';
plotxy(xvec,yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)

%% isometric contraction
t = 0:0.01:(Vmax*100)/a;
P_iso = Pmax*(1-exp(-(b/Lopt)*t));

fnum = fnum+1;
xvec = t;
yvec = P_iso;
ftitle = 'Isometric force output of muscle';
xtitle = 'time (s)';
plotxy(xvec,yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)

%% constant velocity
% recall that v = dL_ce/dt
v = 0.01;
P_constvel = (b*Pmax-a*v)/(b+v)*abs(1-exp(-t*(b+v)/Lopt));

fnum = fnum+1;
yvec = P_constvel;
ftitle = ['Constant velocity of CE: ', num2str(v), ' mm/s'];
xtitle = 'time (s)';
plotxy(xvec,yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)

%% force-velocity relationship
% t tends to inifinty & exponential term in above equation drops out
% range of velocities
v = 0:0.01:2;
P_varyvel = (b*Pmax-a*v)./(b+v);
P_varyvel_norm = P_varyvel/Pmax;

fnum = fnum+1;
xvec = v;
yvec = P_varyvel_norm;
ftitle = 'Force-velocity contraction of muscle';
xtitle = 'velocity (mm/s)';
plotxy(xvec,yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)

%% force-length relationship
% recall that L_tot = L_ce + L_se
L_tot = (0.5*Lopt):0.01:(Lopt*1.5);
Lnorm = L_tot/Lopt;
SK = 0.25;
P_length = Pmax*exp(-((Lnorm-1)/SK).^2);
P_length_norm = P_length/Pmax;

fnum = fnum+1;
xvec = L_tot;
yvec = P_length_norm;
ftitle = 'Force-length contraction of muscle';
xtitle = 'L_{tot} = L_{ce}+L_{se} (mm)';
plotxy(xvec,yvec, fnum, ftitle, xtitle, ytitle, opt_grid, opt_hold, ...
    splotx, sploty)

%% total muscle force 
% here the 2-element model is implemented (the SE is ignored, seee Zajac
% (1989))








