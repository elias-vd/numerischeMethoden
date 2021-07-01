% Adaptive Quadratur Beispiel

% Clear the working space
clear all
close all

%define constants
tol =1e-4;
maxlevel=12;

%define boundaries for each function
a = -1;
b = 1;

%define function handels, "elementwise" operations in case 'x' is a vector
f = @(x) (5*cos(pi *x)).^2 - 12.5;
  [Q,grid] = adaptsimp(f, a, b ,tol , maxlevel);
  Q

% plot results 
figure

%Create a vector of evaluation points for plotting
x = linspace(a,b,1000);
plot(x,f(x),'b-');
hold on

% grid
plot (grid,zeros(1,length(grid)), 'r+');

legend(["Funktion","Quadratur Knoten"]);
title (['Funktion & Grid '])
ylim([ylim]+[-0.1,0.1])
