clear all

% series elastic element
a = 1;
Lo = 1;

x = (-1:0.001:1);
P_series = a*(exp(x/Lo)-1); 

figure(1)
plot(x,P_series)
grid on
hold on

% isometric contraction
t = 0:0.01:50;
b = 0.25;
Po = 100;
P_iso = Po*(1-exp(-(b/Lo)*t));

figure(2)
plot(t,P_iso)
grid on 
hold on

% constant velocity
v = 5;
P_constvel = (b*Po-a*v)/(b+v)*abs(1-exp(-t*(b+v)/Lo));

figure(3)
plot(t,P_constvel)
grid on
hold on