% Adaptive Quadratur Serie 4 Aufgabe 2


% Clear the working space
clear all
close all

%define constants
tol =1e-4;
maxlevel=12;

% prepare plotting
figure
t = tiledlayout(3,3);


%% (i)
a = 3/2; % lower boundary
b = 4;  % upper boundary
ex_nr = 'i';
f1 = @(x) (1./(2*x.^3-x.^2)).*(5*cos(20./x)).^2;
[Q,grid] = adaptsimp(f1, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f1, a, b, ex_nr)

%% (ii)
a = 3/2; % lower boundary
b = 4;  % upper boundary
ex_nr = 'ii';
f2 = @(x) min(f1(x),1/2);
[Q,grid] = adaptsimp(f2, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f2, a, b, ex_nr)

%% (iii)
a = -5; % lower boundary
b = 5;  % upper boundary
ex_nr = 'iii';
f3 = @(x) 1./(1+x.^2);
[Q,grid] = adaptsimp(f3, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f3, a, b, ex_nr)

%% (iv)
a = 0; % lower boundary
b = 1;  % upper boundary
ex_nr = 'iv';
f4 = @(x) sqrt(x);
[Q,grid] = adaptsimp(f4, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f4, a, b, ex_nr)

%% (v)
a = 0; % lower boundary
b = 1;  % upper boundary
ex_nr = 'v';
f5 = @(x) sin(4*pi*x).*exp(-2*x);
[Q,grid] = adaptsimp(f5, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f5, a, b, ex_nr)

%% (vi)
a1 = 0; % lower boundary
b1 = 0.6; 
a2 = 0.6; 
b2 = 1; % upper boundary
ex_nr = 'vi';
[Q1,grid1] = adaptsimp(f5, a1, b1, tol, maxlevel);
[Q2,grid2] = adaptsimp(f5, a2, b2, tol, maxlevel);
grid = [grid1,grid2];
do_the_plot(Q1+Q2, grid, f5, a1, b2, ex_nr)

%% (vii)
a = 0; % lower boundary
b = pi/2;  % upper boundary
ex_nr = 'vii';
f7 = @(x) (sec(x).^2).*exp(-tan(x).^4);
[Q,grid] = adaptsimp(f7, a, b ,tol , maxlevel);
do_the_plot(Q, grid, f7, a, b, ex_nr)


f7 = @(x) (sec(x).^2).*exp(-tan(x).^4);

function [] = do_the_plot(Q, grid, f, a, b, ex_nr)

% Create a vector of evaluation points for plotting
x = linspace(a,b,1000);
nexttile;
plot(x,f(x),'b-');
hold on

% grid
plot (grid,zeros(1,length(grid)), 'r+');

legend(["Funktion","Quadratur Knoten"]);
legendstr = sprintf('(%s) Q = %f',ex_nr,Q);
title(legendstr);
ylim([ylim]+[-0.1,0.1])

end



